using System;
using System.Collections.Generic;
using UnityEngine;
using UnityInjector;
using UnityInjector.Attributes;

namespace CM3D2.Repaint
{
	[PluginFilter("CM3D2x64"), PluginFilter("CM3D2x86"), PluginName("Repaint"), PluginVersion("0.0.0.0")]
	public class Repaint : PluginBase
	{
		public class Binding
		{
			public string Material = string.Empty;
			public bool Transparent = false;
			[System.Xml.Serialization.XmlArrayItem("Keyword", typeof(string))]
			public List<string> Keywords = new List<string>();
			[System.Xml.Serialization.XmlArrayItem("Ignore", typeof(string))]
			public List<string> Ignores = new List<string>();
		}

		public class Bindset
		{
			public List<Binding> Bindings = new List<Binding>();
		}

		public class Matparam
		{
			public class Property
			{
				public enum PropertyType
				{
					Float,
					Color,
				}

				public string Name = string.Empty;
				public PropertyType Type = PropertyType.Float;
				public float Float = 0.0f;
				public Color Color = Color.white;
			}

			public string Shader = string.Empty;
			public List<Property> Properties = new List<Property>();
		}

		public class Config
		{
			public KeyCode KeyReload = KeyCode.R;
			public KeyCode KeyDump = KeyCode.D;
			public string Flavor = string.Empty;
		}

		private static Config m_config = new Config();
		private static string m_folder = string.Empty;
		private static Dictionary<string, Shader> m_shaders = new Dictionary<string, Shader>();
		private static Dictionary<string, Matparam> m_materials = new Dictionary<string, Matparam>();
		private static List<Binding> m_bindings = new List<Binding>();
		private static RenderTexture m_cubemap = null;

		public void Awake()
		{
			UnityEngine.Object.DontDestroyOnLoad(this);
		}

		public void OnLevelWasLoaded(int lv)
		{
			m_folder = System.IO.Path.Combine(this.DataPath, "Repaint");
			m_config = loadXml<Config>(System.IO.Path.Combine(m_folder, "Repaint.xml"));
		}

		public void LateUpdate()
		{
			if (GameMain.Instance.CharacterMgr.IsBusy())
			{
				return;
			}

			if (Input.GetKeyDown(m_config.KeyReload))
			{
				updateMaterials();
			}

			if (Input.GetKeyDown(m_config.KeyDump))
			{
				foreach (var rd in FindObjectsOfType<Renderer>())
				{
					var materials = rd.materials;
					for (int j = 0; j < materials.Length; ++j)
					{
						Console.WriteLine(materials[j].name);
					}
				}
			}

			updateCubemap(1 << (Time.frameCount % 6));
		}

		private void updateMaterials()
		{
			var configFilePath = System.IO.Path.Combine(m_folder, "Repaint.xml");
			m_config = loadXml<Config>(configFilePath);
			loadShaders();
			loadMaterials();
			loadBindings();
	
			foreach (var rd in FindObjectsOfType<Renderer>())
			{
				var changed = false;
				var materials = rd.materials;

				for (int j = 0; j < materials.Length; ++j)
				{
					var trans = false;
					var param = getMatparam(materials[j].name, ref trans);
					if (param == null) continue;

					var shaderName = param.Shader;
					if (trans) shaderName += "_Trans";
					
					if (!m_shaders.ContainsKey(shaderName))
					{
						Console.WriteLine("Shader [" + shaderName + "] not found");
						continue;
					}

					var mat = new Material(m_shaders[shaderName]);
					mat.CopyPropertiesFromMaterial(materials[j]);
					var name = materials[j].name;
					var instance = name.IndexOf(" (Instance)");
					if (instance >= 0)
					{
						name = name.Substring(0, instance);
					}
					mat.name = name;

					foreach (var p in param.Properties)
					{
						switch (p.Type)
						{
							case Matparam.Property.PropertyType.Float:
								mat.SetFloat(p.Name, p.Float);
								break;
							case Matparam.Property.PropertyType.Color:
								mat.SetColor(p.Name, p.Color);
								break;
							default:
								break;
						}
					}

					materials[j] = mat;
					Console.WriteLine(mat.name);
					changed = true;
				}

				if (changed)
				{
					rd.materials = materials;
				}
			}
		}

		private void updateCubemap(int flag)
		{
			List<KeyValuePair<Renderer, bool>> rds = new List<KeyValuePair<Renderer, bool>>();
			for (int i = 0; i < GameMain.Instance.CharacterMgr.GetMaidCount() - 1; ++i)
			{
				var maid = GameMain.Instance.CharacterMgr.GetMaid(i);
				if (maid == null || maid.body0.gameObject == null) continue;
				foreach (var rd in FindObjectsOfType<Renderer>())
				{
					if (rd.gameObject.transform.IsChildOf(maid.body0.gameObject.transform))
					{
						rds.Add(new KeyValuePair<Renderer, bool>(rd, rd.enabled));
					}
				}
			}

			foreach (var kv in rds) kv.Key.enabled = false;

			var lit_int = GameMain.Instance.MainLight.GetIntensity();
			var lit_col = GameMain.Instance.MainLight.GetColor();
			GameMain.Instance.MainLight.SetIntensity(1.0f);
			GameMain.Instance.MainLight.SetColor(Color.white);

			if (m_cubemap == null)
			{
				//m_cubemap = new Cubemap(512, TextureFormat.ARGB32, true);
				m_cubemap = new RenderTexture(512, 512, 16);
				m_cubemap.isCubemap = true;
				m_cubemap.generateMips = true;
				m_cubemap.useMipMap = true;
				m_cubemap.hideFlags = HideFlags.HideAndDontSave;
			}

			var cam = GameObject.Find("CameraMain");
			var pos = cam.transform.position;
			var rot = cam.transform.rotation;
			cam.transform.position = new Vector3(0.0f, 1.5f, 0.0f);
			cam.transform.rotation = Quaternion.identity;
			cam.GetComponent<Camera>().RenderToCubemap(m_cubemap, flag);
			cam.transform.position = pos;
			cam.transform.rotation = rot;

			GameMain.Instance.MainLight.SetIntensity(lit_int);
			GameMain.Instance.MainLight.SetColor(lit_col);
			foreach (var kv in rds) kv.Key.enabled = kv.Value;

			Shader.SetGlobalTexture("_Reflection", m_cubemap);
		}

		private System.Text.RegularExpressions.Regex makeWildCardRegex(string text)
		{
			return new System.Text.RegularExpressions.Regex(
				System.Text.RegularExpressions.Regex.Replace(text, ".", m => {
				return m.Value == "?" ? "." : (m.Value == "*" ? ".*" : System.Text.RegularExpressions.Regex.Escape(m.Value));
			}));
		}
	
		private Matparam getMatparam(string name, ref bool trans)
		{
			var name_lowered = name.ToLower();
			foreach (var b in m_bindings)
			{
				foreach (var i in b.Ignores)
				{
					if (name_lowered.Contains(i.ToLower())) return null;
				}

				foreach (var k in b.Keywords)
				{
					if (makeWildCardRegex(k.ToLower()).IsMatch(name_lowered))
					{
						if (m_materials.ContainsKey(b.Material))
						{
							trans = b.Transparent;
							return m_materials[b.Material];
						}
						else
						{
							Console.WriteLine("Material parameter [" + b.Material + "] not found");
							return null;
						}
					}
				}
			}

			return null;
		}

		private void loadShaders()
		{
			m_shaders.Clear();

			var dir = System.IO.Path.Combine(m_folder, "shaders");
			foreach (var f in System.IO.Directory.GetFiles(dir))
			{
				var name = System.IO.Path.GetFileNameWithoutExtension(f);
				using (var sr = new System.IO.StreamReader(f))
				{
					m_shaders[name] = new Material(sr.ReadToEnd()).shader;
				}
			}
		}

		private void loadMaterials()
		{
			m_materials.Clear();

			var dir = System.IO.Path.Combine(m_folder, "materials");
			foreach (var f in System.IO.Directory.GetFiles(dir))
			{
				var name = System.IO.Path.GetFileNameWithoutExtension(f);
				m_materials[name] = loadXml<Matparam>(f);
			}
		}

		private void loadBindings()
		{
			m_bindings.Clear();

			var dir = System.IO.Path.Combine(m_folder, "bindings");
			foreach (var d in System.IO.Directory.GetDirectories(dir))
			{
				if (m_config.Flavor != System.IO.Path.GetFileName(d))
				{
					continue;
				}

				foreach (var f in System.IO.Directory.GetFiles(d))
				{
					m_bindings.AddRange(loadXml<Bindset>(f).Bindings);
				}
			}
		}

		private T loadXml<T>(string path)
		{
			var serializer = new System.Xml.Serialization.XmlSerializer(typeof(T));
			using (var sr = new System.IO.StreamReader(path, new System.Text.UTF8Encoding(true)))
			{
				return (T)serializer.Deserialize(sr);
			}
		}
	}
}