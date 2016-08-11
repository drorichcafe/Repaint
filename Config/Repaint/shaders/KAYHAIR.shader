// Compiled shader for PC, Mac & Linux Standalone, uncompressed size: 14.6KB

Shader "KAYHAIR" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _MainTex ("Base (RGB)", 2D) = "white" {}
 _SpecularColor ("Specular Color", Color) = (1,1,1,1)
 _SpecularPower ("Specular Power", Range(0,500)) = 150
 _SpecularShift ("Specular Shift", Range(-3.14,3.14)) = 0
 _RimColor ("Rim Color", Color) = (1,1,1,1)
 _RimPower ("Rim Power", Range(0.1,30)) = 2
 _RimShift ("Rim Shift", Range(-1,1)) = 0
 _TranslucentColor ("Translucent Color", Color) = (1,1,1,1)
 _TranslucentPower ("Translucent Power", Range(0.1,10)) = 2
 _TranslucentAlbedo ("Translucent Albedo", Range(0,1)) = 0
 _Reflectivity ("Reflectivity", Color) = (0,0,0,1)
}
SubShader { 
 LOD 200
 Tags { "LIGHTMODE"="ForwardBase" "QUEUE"="Geometry" "RenderType"="Opaque" }


 // Stats for Vertex shader:
 //       d3d11 : 19 math
 //    d3d11_9x : 19 math
 //        d3d9 : 18 math
 //      opengl : 18 math
 // Stats for Fragment shader:
 //       d3d11 : 53 math, 1 texture
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry" "RenderType"="Opaque" }
Program "vp" {
SubProgram "opengl " {
// Stats: 18 math
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[11] = { program.local[0],
		state.matrix.mvp,
		program.local[5..10] };
TEMP R0;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD R0.xyz, -R0, c[9];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL result.texcoord[3].xyz, R0.w, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[10], c[10].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
DP3 result.texcoord[1].z, vertex.attrib[14], c[7];
DP3 result.texcoord[1].y, vertex.attrib[14], c[6];
DP3 result.texcoord[1].x, vertex.attrib[14], c[5];
DP3 result.texcoord[2].z, vertex.normal, c[7];
DP3 result.texcoord[2].y, vertex.normal, c[6];
DP3 result.texcoord[2].x, vertex.normal, c[5];
END
# 18 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 18 math
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [_MainTex_ST]
"vs_2_0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add r0.xyz, -r0, c8
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul oT3.xyz, r0.w, r0
mad oT0.xy, v3, c9, c9.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
dp3 oT1.z, v1, c6
dp3 oT1.y, v1, c5
dp3 oT1.x, v1, c4
dp3 oT2.z, v2, c6
dp3 oT2.y, v2, c5
dp3 oT2.x, v2, c4
"
}
SubProgram "d3d11 " {
// Stats: 19 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 176
Vector 64 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedllaafdfbnkmmapogjbpdgbclfldeopjlabaaaaaaoeaeaaaaadaaaaaa
cmaaaaaanmaaaaaahmabaaaaejfdeheokiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaijaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaajbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
jiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
gaadaaaaeaaaabaaniaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaae
egiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaadiaaaaaihcaabaaa
aaaaaaaafgbfbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaaaaaaaaaa
dcaaaaakhccabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaabaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaa
agbabaaaacaaaaaaegacbaaaaaaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaa
acaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaia
ebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhccabaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 19 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 176
Vector 64 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedoeihgpgjackjhobhicikggoedllgjnlmabaaaaaapiagaaaaaeaaaaaa
daaaaaaaeaacaaaakiafaaaafiagaaaaebgpgodjaiacaaaaaiacaaaaaaacpopp
laabaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaaeaa
abaaabaaaaaaaaaaabaaaeaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
acaaamaaaeaaahaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaafaaaaadaaaaahia
abaaffjaaiaaoekaaeaaaaaeaaaaahiaahaaoekaabaaaajaaaaaoeiaaeaaaaae
abaaahoaajaaoekaabaakkjaaaaaoeiaafaaaaadaaaaahiaacaaffjaaiaaoeka
aeaaaaaeaaaaahiaahaaoekaacaaaajaaaaaoeiaaeaaaaaeacaaahoaajaaoeka
acaakkjaaaaaoeiaafaaaaadaaaaahiaaaaaffjaaiaaoekaaeaaaaaeaaaaahia
ahaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaahiaakaaoekaaaaappjaaaaaoeiaacaaaaadaaaaahiaaaaaoeib
acaaoekaaiaaaaadaaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiiaaaaappia
afaaaaadadaaahoaaaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaeaaoeka
aeaaaaaeaaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaa
fdeieefcgaadaaaaeaaaabaaniaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaa
aaaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaa
abaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaacaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
amaaaaaaagbabaaaacaaaaaaegacbaaaaaaaaaaadcaaaaakhccabaaaadaaaaaa
egiccaaaacaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhccabaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadoaaaaabejfdeheokiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaaijaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaahahaaaajbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
// Platform opengl had shader errors
//   <no keywords>
// Platform d3d9 had shader errors
//   <no keywords>
// Platform d3d11_9x had shader errors
//   <no keywords>
SubProgram "d3d11 " {
// Stats: 53 math, 1 textures
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Reflection] CUBE 1
ConstBuffer "$Globals" 176
Vector 16 [_LightColor0]
Vector 48 [_Color]
Vector 80 [_SpecularColor]
Float 96 [_SpecularPower]
Float 100 [_SpecularShift]
Vector 112 [_RimColor]
Float 128 [_RimPower]
Float 132 [_RimShift]
Vector 144 [_TranslucentColor]
Float 160 [_TranslucentPower]
Float 164 [_TranslucentAlbedo]
Float 168 [_LambertScale]
Float 172 [_LambertOffset]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedmpimdcdpcjjnhfdamimnkkhelafdmnjpabaaaaaabaaiaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcaiahaaaaeaaaaaaamcabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaa
fjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaaeaahabaaa
abaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacafaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaa
egbcbaaaaeaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaajicaabaaa
aaaaaaaaegiccaaaabaaaaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
abaaaaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaa
acaaaaaapgapbaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaabaaaaaahicaabaaaabaaaaaa
egbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegbcbaaaadaaaaaa
diaaaaaihcaabaaaaeaaaaaaegacbaaaadaaaaaafgifcaaaaaaaaaaaagaaaaaa
dcaaaaajhcaabaaaaeaaaaaaegbcbaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
aeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaa
pgapbaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aeaaaaaaegacbaaaabaaaaaadcaaaaakbcaabaaaabaaaaaadkaabaiaebaaaaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaacaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaaibcaabaaa
abaaaaaaakaabaaaabaaaaaaakiacaaaaaaaaaaaagaaaaaabjaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadcaaaaajccaabaaaabaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaamaabeaaaaaaaaaeaeadiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
bkaabaaaabaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaa
aaaaaaaabacaaaahbcaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaa
dccaaaalbcaabaaaabaaaaaaakaabaaaabaaaaaackiacaaaaaaaaaaaakaaaaaa
dkiacaaaaaaaaaaaakaaaaaaeiaaaaalpcaabaaaacaaaaaaegacbaaaadaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaaabeaaaaaaaaaiaebbacaaaahbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaadaaaaaadeaaaaahccaabaaaaaaaaaaa
akaabaaaabaaaaaaakaabaaaacaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaa
aaaaaaaaafaaaaaapgapbaaaaaaaaaaafgafbaaaaaaaaaaaaaaaaaaibcaabaaa
abaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpcpaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akiacaaaaaaaaaaaakaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
aacaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaabkiacaaaaaaaaaaaaiaaaaaa
cpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaaibcaabaaaabaaaaaa
akaabaaaabaaaaaaakiacaaaaaaaaaaaaiaaaaaabjaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadiaaaaaihcaabaaaabaaaaaaagaabaaaabaaaaaaegiccaaa
aaaaaaaaahaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
egiccaaaaaaaaaaaadaaaaaadcaaaaamhcaabaaaadaaaaaaegiccaaaaaaaaaaa
ajaaaaaaegacbaaaacaaaaaaegiccaiaebaaaaaaaaaaaaaaajaaaaaadcaaaaal
hcaabaaaadaaaaaafgifcaaaaaaaaaaaakaaaaaaegacbaaaadaaaaaaegiccaaa
aaaaaaaaajaaaaaadiaaaaahhcaabaaaadaaaaaaagaabaaaaaaaaaaaegacbaaa
adaaaaaadeaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaa
aaaaaaahhcaabaaaaaaaaaaajgahbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaihccabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
}
}
 }
}
Fallback "Diffuse"
}