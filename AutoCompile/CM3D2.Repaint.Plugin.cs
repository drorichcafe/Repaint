using System;
using System.Collections.Generic;
using UnityEngine;
using UnityInjector;
using UnityInjector.Attributes;

namespace CM3D2.Repaint
{
	[PluginFilter("CM3D2x64"), PluginFilter("CM3D2x86"), PluginName("Repaint"), PluginVersion("0.0.0.3")]
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
			public int ReflectionMapSize = 512;
			[System.Xml.Serialization.XmlArrayItem("Property", typeof(Matparam.Property))]
			public List<Matparam.Property> GlobalProperties = new List<Matparam.Property>();
			public string Flavor = string.Empty;
		}

		public class BindingCache
		{
			public Matparam param = null;
			public bool trans = false;
		}

		private static Config m_config = new Config();
		private static string m_folder = string.Empty;
		private static Dictionary<string, Shader> m_shaders = new Dictionary<string, Shader>();
		private static Dictionary<string, Matparam> m_materials = new Dictionary<string, Matparam>();
		private static List<Binding> m_bindings = new List<Binding>();
		private static RenderTexture m_cubemap = null;
		private static int m_updateStep = 0;
		private static Dictionary<string, BindingCache> m_cache = new Dictionary<string, BindingCache>();
		private static bool m_reloaded = false;

		public void Awake()
		{
			UnityEngine.Object.DontDestroyOnLoad(this);
		}

		public void OnLevelWasLoaded(int lv)
		{
			m_folder = System.IO.Path.Combine(this.DataPath, "Repaint");
			reload();
		}

		public void LateUpdate()
		{
			if (GameMain.Instance.CharacterMgr.IsBusy())
			{
				return;
			}

			if (Input.GetKeyDown(m_config.KeyReload))
			{
				reload();
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

			if (!m_reloaded) return;

			int materialCount = updateMaterials();

			m_updateStep++;

			if (m_updateStep > (materialCount + 6))
			{
				m_updateStep = 0;
			}
			else if (m_updateStep > materialCount)
			{
				int i = (m_updateStep - materialCount) -1;
				updateCubemap(1 << i);
			}
		}

		private void reload()
		{
			m_reloaded = false;

			var configFilePath = System.IO.Path.Combine(m_folder, "Repaint.xml");
			m_config = loadXml<Config>(configFilePath);
			loadShaders();
			loadMaterials();
			loadBindings();
			m_cache.Clear();
			UnityEngine.Object.DestroyImmediate(m_cubemap);
			m_cubemap = null;
			System.GC.Collect();

			foreach (var p in m_config.GlobalProperties)
			{
				switch (p.Type)
				{
					case Matparam.Property.PropertyType.Float:
						Shader.SetGlobalFloat(p.Name, p.Float);
						break;
					case Matparam.Property.PropertyType.Color:
						Shader.SetGlobalColor(p.Name, p.Color);
						break;
					default:
						break;
				}
			}

			updateCubemap(63);
			Shader.SetGlobalTexture("_Reflection", m_cubemap);

			m_reloaded = true;
		}

		private int updateMaterials()
		{
			int count = 0;

			foreach (var rd in FindObjectsOfType<Renderer>())
			{
				for (int j = 0; j < rd.sharedMaterials.Length; ++j)
				{
					var trans = false;
					var param = getMatparam(rd.sharedMaterials[j].name, ref trans);
					if (param == null) continue;

					count++;
					if (count != m_updateStep) continue;

					var shaderName = param.Shader;
					if (trans) shaderName += "_Trans";

					if (!m_shaders.ContainsKey(shaderName))
					{
						Console.WriteLine("Shader [" + shaderName + "] not found");
						continue;
					}

					var shader = m_shaders[shaderName];
					if (shader != rd.sharedMaterials[j].shader)
					{
						rd.sharedMaterials[j].shader = shader;
					}

					foreach (var p in param.Properties)
					{
						switch (p.Type)
						{
							case Matparam.Property.PropertyType.Float:
								rd.sharedMaterials[j].SetFloat(p.Name, p.Float);
								break;
							case Matparam.Property.PropertyType.Color:
								rd.sharedMaterials[j].SetColor(p.Name, p.Color);
								break;
							default:
								break;
						}
					}
				}
			}

			return count;
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
				var size = m_config.ReflectionMapSize;
				m_cubemap = new RenderTexture(size, size, 16);
				m_cubemap.isPowerOfTwo = true;
				m_cubemap.isCubemap = true;
				m_cubemap.generateMips = true;
				m_cubemap.useMipMap = true;
				m_cubemap.hideFlags = HideFlags.HideAndDontSave;
			}

			var camgo = new GameObject("CubemapCamera");
			camgo.transform.position = new Vector3(0.0f, 1.5f, 0.0f);
			camgo.transform.rotation = Quaternion.identity;
			var cam = camgo.AddComponent<Camera>();
			cam.nearClipPlane = 0.001f;
			cam.farClipPlane = 100.0f;
			cam.enabled = false;
			cam.RenderToCubemap(m_cubemap, flag);
			DestroyImmediate(camgo);

			GameMain.Instance.MainLight.SetIntensity(lit_int);
			GameMain.Instance.MainLight.SetColor(lit_col);
			foreach (var kv in rds) kv.Key.enabled = kv.Value;
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
			if (m_cache.ContainsKey(name))
			{
				var value = m_cache[name];
				trans = value.trans;
				return value.param;
			}

			var name_lowered = name.ToLower();
			foreach (var b in m_bindings)
			{
				bool ignore = false;

				foreach (var i in b.Ignores)
				{
					if (name_lowered.Contains(i.ToLower()))
					{
						ignore = true;
						break;
					}
				}

				if (ignore) continue;

				foreach (var k in b.Keywords)
				{
					if (makeWildCardRegex(k.ToLower()).IsMatch(name_lowered))
					{
						if (m_materials.ContainsKey(b.Material))
						{
							var cache = new BindingCache();
							cache.trans = b.Transparent;
							cache.param = m_materials[b.Material];
							m_cache[name] = cache;
							trans = cache.trans;
							return cache.param;
						}
						else
						{
							Console.WriteLine("Material parameter [" + b.Material + "] not found");
							return null;
						}
					}
				}
			}

			var cacheNotFound = new BindingCache();
			cacheNotFound.trans = false;
			cacheNotFound.param = null;
			m_cache[name] = cacheNotFound;
			trans = cacheNotFound.trans;
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