// Compiled shader for PC, Mac & Linux Standalone, uncompressed size: 14.8KB

Shader "GGXSSS" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _MainTex ("Base (RGB)", 2D) = "white" {}
 _Roughness ("Roughness", Range(0,1)) = 0.5
 _F0 ("F0", Range(0,1)) = 0.5
 _RimColor ("Rim Color", Color) = (1,1,1,1)
 _RimPower ("Rim Power", Range(0.1,30)) = 2
 _RimShift ("Rim Shift", Range(-1,1)) = 0
 _TranslucentColor ("Translucent Color", Color) = (1,1,1,1)
 _TranslucentPower ("Translucent Power", Range(0.1,10)) = 2
 _TranslucentAlbedo ("Translucent Albedo", Range(0,1)) = 0
 _Reflection ("Cubemap", CUBE) = "" {}
 _Reflectivity ("_Reflectivity", Color) = (0,0,0,1)
}
SubShader { 
 LOD 200
 Tags { "LIGHTMODE"="ForwardBase" "QUEUE"="Geometry" "RenderType"="Opaque" }


 // Stats for Vertex shader:
 //       d3d11 : 16 math
 //    d3d11_9x : 16 math
 //        d3d9 : 15 math
 //      opengl : 15 math
 // Stats for Fragment shader:
 //       d3d11 : 75 math, 1 texture
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry" "RenderType"="Opaque" }
Program "vp" {
SubProgram "opengl " {
// Stats: 15 math
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
DP3 result.texcoord[2].z, vertex.normal, c[7];
DP3 result.texcoord[2].y, vertex.normal, c[6];
DP3 result.texcoord[2].x, vertex.normal, c[5];
END
# 15 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 15 math
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [_MainTex_ST]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add r0.xyz, -r0, c8
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul oT3.xyz, r0.w, r0
mad oT0.xy, v2, c9, c9.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
dp3 oT2.z, v1, c6
dp3 oT2.y, v1, c5
dp3 oT2.x, v1, c4
"
}
SubProgram "d3d11 " {
// Stats: 16 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
eefiecedklndgknfgjkeplekjedenjhnakbmdmcpabaaaaaaeeaeaaaaadaaaaaa
cmaaaaaanmaaaaaageabaaaaejfdeheokiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaijaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaajbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
iaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaaheaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcniacaaaaeaaaabaalgaaaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
baaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaac
abaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaa
aaaaaaaaaeaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaa
agbabaaaacaaaaaaegacbaaaaaaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaa
acaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaia
ebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhccabaaaadaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 16 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
eefiecedjofagmljonhmdcfceonoeiejppjokphiabaaaaaabeagaaaaaeaaaaaa
daaaaaaapmabaaaanmaeaaaaimafaaaaebgpgodjmeabaaaameabaaaaaaacpopp
gmabaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaaeaa
abaaabaaaaaaaaaaabaaaeaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
acaaamaaaeaaahaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoa
adaaoejaabaaoekaabaaookaafaaaaadaaaaahiaacaaffjaaiaaoekaaeaaaaae
aaaaahiaahaaoekaacaaaajaaaaaoeiaaeaaaaaeabaaahoaajaaoekaacaakkja
aaaaoeiaafaaaaadaaaaahiaaaaaffjaaiaaoekaaeaaaaaeaaaaahiaahaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaahiaakaaoekaaaaappjaaaaaoeiaacaaaaadaaaaahiaaaaaoeibacaaoeka
aiaaaaadaaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiiaaaaappiaafaaaaad
acaaahoaaaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaae
aaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefc
niacaaaaeaaaabaalgaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaae
egiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaacabaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaa
diaaaaaihcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaacaaaaaa
egacbaaaaaaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgbkbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hccabaaaadaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheo
kiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaaijaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaajbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaaheaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
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
// Stats: 75 math, 1 textures
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Reflection] CUBE 1
ConstBuffer "$Globals" 176
Vector 16 [_LightColor0]
Vector 48 [_Color]
Float 80 [_Roughness]
Float 84 [_F0]
Vector 96 [_RimColor]
Float 112 [_RimPower]
Float 116 [_RimShift]
Vector 128 [_TranslucentColor]
Float 144 [_TranslucentPower]
Float 148 [_TranslucentAlbedo]
Vector 160 [_Reflectivity]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedlpfihaebjkfnhnkggdhkacpigilnmbdjabaaaaaapmakaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaheaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcamakaaaaeaaaaaaaidacaaaafjaaaaaeegiocaaa
aaaaaaaaalaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fidaaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacagaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaabaaaaaajccaabaaa
aaaaaaaaegiccaaaabaaaaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaaeeaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaafgafbaaa
aaaaaaaaagijcaaaabaaaaaaaaaaaaaadcaaaaajhcaabaaaabaaaaaaegbcbaaa
adaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
agaabaaaaaaaaaaaegbcbaaaadaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaabacaaaah
bcaabaaaaaaaaaaajgahbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaa
abaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadkaabaaaabaaaaaaaaaaaaajicaabaaaabaaaaaabkiacaiaebaaaaaa
aaaaaaaaafaaaaaaabeaaaaaaaaaiadpdcaaaaakbcaabaaaaaaaaaaadkaabaaa
abaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaaafaaaaaabaaaaaahicaabaaa
abaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegbcbaaa
acaaaaaabacaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaa
diaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaaj
ccaabaaaabaaaaaaakiacaaaaaaaaaaaafaaaaaaakiacaaaaaaaaaaaafaaaaaa
dcaaaaajecaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaa
aaaaialpdcaaaaajbcaabaaaabaaaaaaakaabaaaabaaaaaackaabaaaabaaaaaa
abeaaaaaaaaaiadpdiaaaaahfcaabaaaabaaaaaaagabbaaaabaaaaaaagabbaaa
abaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaanaapejea
aoaaaaahbcaabaaaabaaaaaackaabaaaabaaaaaaakaabaaaabaaaaaabacaaaah
ecaabaaaabaaaaaajgahbaaaaaaaaaaaegacbaaaadaaaaaadiaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaackaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaa
akaabaaaaaaaaaaaakaabaaaabaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaa
acaaaaaaegacbaaaadaaaaaadgcaaaaficaabaaaacaaaaaadkaabaaaabaaaaaa
aaaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaak
hcaabaaaaeaaaaaaegacbaaaadaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaaa
acaaaaaaeiaaaaalpcaabaaaadaaaaaaegacbaaaadaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaaabeaaaaaaaaahaebdiaaaaahicaabaaaabaaaaaabkaabaaa
abaaaaaaabeaaaaaaaaaaadpdcaaaaakccaabaaaabaaaaaabkaabaiaebaaaaaa
abaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdcaaaaajbcaabaaaacaaaaaa
dkaabaaaacaaaaaabkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaajccaabaaa
abaaaaaackaabaaaabaaaaaabkaabaaaabaaaaaadkaabaaaabaaaaaaaaaaaaah
ecaabaaaabaaaaaackaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahecaabaaa
abaaaaaackaabaaaabaaaaaaabeaaaaaaaaaaadpdeaaaaahecaabaaaabaaaaaa
ckaabaaaabaaaaaaakaabaaaadaaaaaaaoaaaaakccaabaaaabaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpbkaabaaaabaaaaaaaoaaaaakicaabaaa
abaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpakaabaaaacaaaaaa
diaaaaahccaabaaaabaaaaaadkaabaaaabaaaaaabkaabaaaabaaaaaadicaaaah
bcaabaaaabaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaaaaaaaaaiccaabaaa
abaaaaaadkaabaiaebaaaaaaacaaaaaaabeaaaaaaaaaiadpcpaaaaaficaabaaa
abaaaaaadkaabaaaacaaaaaadiaaaaaiicaabaaaabaaaaaadkaabaaaabaaaaaa
akiacaaaaaaaaaaaajaaaaaabjaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
aacaaaaiccaabaaaabaaaaaabkaabaaaabaaaaaabkiacaaaaaaaaaaaahaaaaaa
cpaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaaiccaabaaaabaaaaaa
bkaabaaaabaaaaaaakiacaaaaaaaaaaaahaaaaaabjaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
aaaaaaaaagaaaaaadiaaaaahhcaabaaaacaaaaaaagaabaaaaaaaaaaaegacbaaa
acaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadiaaaaaipcaabaaaadaaaaaaegaobaaaadaaaaaaegiocaaa
aaaaaaaaadaaaaaadcaaaaamhcaabaaaafaaaaaaegiccaaaaaaaaaaaaiaaaaaa
egacbaaaadaaaaaaegiccaiaebaaaaaaaaaaaaaaaiaaaaaadcaaaaalhcaabaaa
afaaaaaafgifcaaaaaaaaaaaajaaaaaaegacbaaaafaaaaaaegiccaaaaaaaaaaa
aiaaaaaadiaaaaahhcaabaaaafaaaaaapgapbaaaabaaaaaaegacbaaaafaaaaaa
deaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaafaaaaaadcaaaaaj
ocaabaaaabaaaaaaagajbaaaadaaaaaakgakbaaaabaaaaaaagajbaaaacaaaaaa
dgaaaaaficcabaaaaaaaaaaadkaabaaaadaaaaaaaaaaaaahocaabaaaabaaaaaa
agaabaaaabaaaaaafgaobaaaabaaaaaadgaaaaagicaabaaaaeaaaaaabkaabaia
ebaaaaaaaeaaaaaabacaaaahbcaabaaaaaaaaaaangagbaaaaaaaaaaaigadbaaa
aeaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakccaabaaa
aaaaaaaaakiacaaaaaaaaaaaafaaaaaaabeaaaaaaaaamgecabeaaaaaaaaaiadp
aoaaaaahccaabaaaaaaaaaaaabeaaaaaaaaamiecbkaabaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaabjaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaaakiacaaaaaaaaaaa
afaaaaaaabeaaaaaaaaahaebeiaaaaalpcaabaaaacaaaaaamgacbaaaaeaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaabkaabaaaaaaaaaaadeaaaaahhcaabaaa
aaaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaagaabaaaabaaaaaaaaaaaaaihcaabaaaaaaaaaaajgahbaia
ebaaaaaaabaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
aaaaaaaaakaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaaihccabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadoaaaaab"
}
}
 }
}
Fallback "Diffuse"
}