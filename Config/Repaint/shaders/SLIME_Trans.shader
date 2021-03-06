// Compiled shader for PC, Mac & Linux Standalone, uncompressed size: 22.8KB

Shader "SLIME_Trans" {
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
 _TranslucentTilt ("Translucent Tilt", Range(0,1)) = 0
 _SpecularColor ("Specular Color", Color) = (1,1,1,1)
 _Metalness ("Metalness", Range(0,1)) = 0
 _Refraction ("Refraction", Range(0,1)) = 1
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Transparent+1" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 GrabPass {
  "_GrabTexture"
 }


 // Stats for Vertex shader:
 //       d3d11 : 30 math
 //    d3d11_9x : 30 math
 //        d3d9 : 29 math
 //      opengl : 29 math
 // Stats for Fragment shader:
 //       d3d11 : 111 math, 5 texture, 4 branch
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "QUEUE"="Transparent+1" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
  AlphaTest Greater 0
Program "vp" {
SubProgram "opengl " {
// Stats: 29 math
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[16] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
TEMP R2;
DP4 R1.w, vertex.position, c[4];
DP4 R1.z, vertex.position, c[3];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].x;
MUL R0.y, R0, c[14].x;
ADD result.texcoord[5].xy, R0, R0.z;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD R2.xyz, -R0, c[13];
DP3 R0.w, R2, R2;
MOV result.position, R1;
RSQ R1.x, R0.w;
DP4 R0.w, vertex.position, c[8];
MUL result.texcoord[2].xyz, R1.x, R2;
MOV result.texcoord[3], R0;
DP4 result.texcoord[4].w, R0, c[12];
DP4 result.texcoord[4].z, R0, c[11];
DP4 result.texcoord[4].y, R0, c[10];
DP4 result.texcoord[4].x, R0, c[9];
MOV result.texcoord[5].zw, R1;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
DP3 result.texcoord[1].z, vertex.normal, c[7];
DP3 result.texcoord[1].y, vertex.normal, c[6];
DP3 result.texcoord[1].x, vertex.normal, c[5];
DP3 result.texcoord[6].z, vertex.normal, c[3];
DP3 result.texcoord[6].y, vertex.normal, c[2];
DP3 result.texcoord[6].x, vertex.normal, c[1];
END
# 29 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 29 math
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [_MainTex_ST]
"vs_2_0
def c16, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r1.w, v0, c3
dp4 r1.z, v0, c2
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r0.xyz, r1.xyww, c16.x
mul r0.y, r0, c13.x
mad oT5.xy, r0.z, c14.zwzw, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add r2.xyz, -r0, c12
dp3 r0.w, r2, r2
mov oPos, r1
rsq r1.x, r0.w
dp4 r0.w, v0, c7
mul oT2.xyz, r1.x, r2
mov oT3, r0
dp4 oT4.w, r0, c11
dp4 oT4.z, r0, c10
dp4 oT4.y, r0, c9
dp4 oT4.x, r0, c8
mov oT5.zw, r1
mad oT0.xy, v2, c15, c15.zwzw
dp3 oT1.z, v1, c6
dp3 oT1.y, v1, c5
dp3 oT1.x, v1, c4
dp3 oT6.z, v1, c2
dp3 oT6.y, v1, c1
dp3 oT6.x, v1, c0
"
}
SubProgram "d3d11 " {
// Stats: 30 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 256
Matrix 192 [_LightMatrix0]
Vector 16 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedaoilobhjpjccbcofdmajcgembamjpkheabaaaaaabeahaaaaadaaaaaa
cmaaaaaanmaaaaaameabaaaaejfdeheokiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaijaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaajbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
oaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaneaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaaneaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apaaaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaaneaaaaaa
afaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaaneaaaaaaagaaaaaaaaaaaaaa
adaaaaaaahaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefceiafaaaaeaaaabaafcabaaaafjaaaaaeegiocaaaaaaaaaaa
baaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
baaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
pccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaa
gfaaaaadhccabaaaahaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaabaaaaaa
ogikcaaaaaaaaaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaaacaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaa
amaaaaaaagbabaaaacaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaacaaaaaa
egiccaaaacaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaaabaaaaaadiaaaaai
hcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaajhcaabaaaabaaaaaa
egacbaiaebaaaaaaabaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaahhccabaaaadaaaaaapgapbaaaabaaaaaaegacbaaa
abaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
anaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadgaaaaaf
pccabaaaaeaaaaaaegaobaaaabaaaaaadiaaaaaipcaabaaaacaaaaaafgafbaaa
abaaaaaaegiocaaaaaaaaaaaanaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
aaaaaaaaamaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaa
acaaaaaaegiocaaaaaaaaaaaaoaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaakpccabaaaafaaaaaaegiocaaaaaaaaaaaapaaaaaapgapbaaaabaaaaaa
egaobaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
abaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaagaaaaaakgaobaaa
aaaaaaaaaaaaaaahdccabaaaagaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaa
diaaaaaihcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiccaaaacaaaaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaaaaaaaaagbabaaaacaaaaaa
egacbaaaaaaaaaaadcaaaaakhccabaaaahaaaaaaegiccaaaacaaaaaaacaaaaaa
kgbkbaaaacaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 30 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 256
Matrix 192 [_LightMatrix0]
Vector 16 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedajecbgockmojjnokkpcgenoghilefkfgabaaaaaadaakaaaaaeaaaaaa
daaaaaaaeiadaaaajiaiaaaaeiajaaaaebgpgodjbaadaaaabaadaaaaaaacpopp
kmacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaabaa
abaaabaaaaaaaaaaaaaaamaaaeaaacaaaaaaaaaaabaaaeaaacaaagaaaaaaaaaa
acaaaaaaaeaaaiaaaaaaaaaaacaaamaaaeaaamaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbaaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaae
aaaaadoaadaaoejaabaaoekaabaaookaafaaaaadaaaaahiaacaaffjaanaaoeka
aeaaaaaeaaaaahiaamaaoekaacaaaajaaaaaoeiaaeaaaaaeabaaahoaaoaaoeka
acaakkjaaaaaoeiaafaaaaadaaaaahiaaaaaffjaanaaoekaaeaaaaaeaaaaahia
amaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaahiaapaaoekaaaaappjaaaaaoeiaacaaaaadaaaaahiaaaaaoeib
agaaoekaaiaaaaadaaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiiaaaaappia
afaaaaadacaaahoaaaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaanaaoeka
aeaaaaaeaaaaapiaamaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaoaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaappjaaaaaoeiaafaaaaad
abaaapiaaaaaffiaadaaoekaaeaaaaaeabaaapiaacaaoekaaaaaaaiaabaaoeia
aeaaaaaeabaaapiaaeaaoekaaaaakkiaabaaoeiaaeaaaaaeaeaaapoaafaaoeka
aaaappiaabaaoeiaabaaaaacadaaapoaaaaaoeiaafaaaaadaaaaapiaaaaaffja
ajaaoekaaeaaaaaeaaaaapiaaiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
akaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeia
afaaaaadabaaabiaaaaaffiaahaaaakaafaaaaadabaaaiiaabaaaaiabaaaaaka
afaaaaadabaaafiaaaaapeiabaaaaakaacaaaaadafaaadoaabaakkiaabaaomia
afaaaaadabaaahiaacaaffjaajaaoekaaeaaaaaeabaaahiaaiaaoekaacaaaaja
abaaoeiaaeaaaaaeagaaahoaakaaoekaacaakkjaabaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacafaaamoa
aaaaoeiappppaaaafdeieefceiafaaaaeaaaabaafcabaaaafjaaaaaeegiocaaa
aaaaaaaabaaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadpccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagfaaaaadpccabaaa
agaaaaaagfaaaaadhccabaaaahaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
abaaaaaaogikcaaaaaaaaaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaa
acaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaa
acaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaaabaaaaaa
diaaaaaihcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaajhcaabaaa
abaaaaaaegacbaiaebaaaaaaabaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahhccabaaaadaaaaaapgapbaaaabaaaaaa
egacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaa
dgaaaaafpccabaaaaeaaaaaaegaobaaaabaaaaaadiaaaaaipcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiocaaaaaaaaaaaanaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaaaaaaaaaamaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaaaaaaaaaaoaaaaaakgakbaaaabaaaaaaegaobaaa
acaaaaaadcaaaaakpccabaaaafaaaaaaegiocaaaaaaaaaaaapaaaaaapgapbaaa
abaaaaaaegaobaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaagaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaagaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiccaaaacaaaaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaaaaaaaaagbabaaa
acaaaaaaegacbaaaaaaaaaaadcaaaaakhccabaaaahaaaaaaegiccaaaacaaaaaa
acaaaaaakgbkbaaaacaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheokiaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
ijaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaajbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaa
neaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaaneaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaa
neaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
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
// Stats: 111 math, 5 textures, 4 branches
SetTexture 0 [_LightTextureB0] 2D 4
SetTexture 1 [_LightTexture0] 2D 3
SetTexture 2 [_MainTex] 2D 0
SetTexture 3 [_Reflection] CUBE 1
SetTexture 4 [_GrabTexture] 2D 2
ConstBuffer "$Globals" 256
Matrix 192 [_LightMatrix0]
Vector 0 [_Color]
Float 32 [_Roughness]
Float 36 [_F0]
Vector 48 [_RimColor]
Float 64 [_RimPower]
Float 68 [_RimShift]
Vector 80 [_TranslucentColor]
Float 96 [_TranslucentPower]
Float 100 [_TranslucentTilt]
Vector 112 [_SpecularColor] 3
Float 124 [_Metalness]
Float 128 [_LambertScale]
Float 132 [_LambertOffset]
Float 136 [_Refraction]
Vector 160 [_LightColor0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedpncogkfekjabhepodnkmjigckeaelejcabaaaaaapebaaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefckeapaaaaeaaaaaaaojadaaaafjaaaaaeegiocaaa
aaaaaaaabaaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaafidaaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaa
gcbaaaadlcbabaaaagaaaaaagcbaaaadhcbabaaaahaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacajaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
ocaabaaaaaaaaaaaagaabaaaaaaaaaaaagbjbaaaadaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaabaaaaaaegbcbaaa
acaaaaaabiaaaaaiicaabaaaabaaaaaadkiacaaaabaaaaaaaaaaaaaaabeaaaaa
aaaaaaaabpaaaeaddkaabaaaabaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaa
abaaaaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaaihcaabaaaacaaaaaapgapbaaaabaaaaaaegiccaaa
abaaaaaaaaaaaaaadgaaaaafbcaabaaaadaaaaaaabeaaaaaaaaaiadpbcaaaaab
aaaaaaajhcaabaaaaeaaaaaaegbcbaiaebaaaaaaaeaaaaaaegiccaaaabaaaaaa
aaaaaaaadjaaaaaiicaabaaaabaaaaaadkiacaaaaaaaaaaaapaaaaaaabeaaaaa
aaaaiadpbpaaaeaddkaabaaaabaaaaaabaaaaaahicaabaaaabaaaaaaegbcbaaa
afaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaafaaaaaapgapbaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaeaaaaaaaoaaaaahgcaabaaaafaaaaaaagbbbaaa
afaaaaaapgbpbaaaafaaaaaaaaaaaaakgcaabaaaafaaaaaafgagbaaaafaaaaaa
aceaaaaaaaaaaaaaaaaaaadpaaaaaadpaaaaaaaaefaaaaajpcaabaaaagaaaaaa
jgafbaaaafaaaaaaeghobaaaabaaaaaaaagabaaaadaaaaaadbaaaaahicaabaaa
abaaaaaaabeaaaaaaaaaaaaackbabaaaafaaaaaaabaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaaabaaaaaadkaabaaa
agaaaaaadkaabaaaabaaaaaadiaaaaahbcaabaaaadaaaaaaakaabaaaafaaaaaa
dkaabaaaabaaaaaabcaaaaabbaaaaaahicaabaaaabaaaaaaegbcbaaaafaaaaaa
egbcbaaaafaaaaaaefaaaaajpcaabaaaadaaaaaapgapbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaadaaaaaabfaaaaabbaaaaaahicaabaaaabaaaaaaegacbaaa
aeaaaaaaegacbaaaaeaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahhcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaaaeaaaaaabfaaaaab
dcaaaaajocaabaaaadaaaaaaagbjbaaaadaaaaaaagaabaaaaaaaaaaaagajbaaa
acaaaaaabaaaaaahbcaabaaaaaaaaaaajgahbaaaadaaaaaajgahbaaaadaaaaaa
eeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahocaabaaaadaaaaaa
agaabaaaaaaaaaaafgaobaaaadaaaaaabaaaaaaibcaabaaaaaaaaaaajgahbaia
ebaaaaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaadcaaaaalhcaabaaaaeaaaaaaegacbaaaabaaaaaa
agaabaiaebaaaaaaaaaaaaaajgahbaiaebaaaaaaaaaaaaaabacaaaahbcaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaabacaaaahicaabaaaabaaaaaa
egacbaaaacaaaaaajgahbaaaadaaaaaabacaaaahbcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaaeaaaaaabacaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaa
egacbaaaabaaaaaabacaaaahecaabaaaaaaaaaaajgahbaaaadaaaaaaegacbaaa
abaaaaaaaaaaaaaiicaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpaacaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaabkiacaaaaaaaaaaa
aeaaaaaadccaaaalccaabaaaacaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaa
aiaaaaaabkiacaaaaaaaaaaaaiaaaaaaaaaaaaajecaabaaaacaaaaaabkiacaia
ebaaaaaaaaaaaaaaacaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaabaaaaaa
dkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaaacaaaaaa
dkaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahicaabaaaacaaaaaadkaabaaa
acaaaaaadkaabaaaacaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaa
dkaabaaaacaaaaaadcaaaaakicaabaaaabaaaaaackaabaaaacaaaaaadkaabaaa
abaaaaaabkiacaaaaaaaaaaaacaaaaaadiaaaaaihcaabaaaadaaaaaaagaabaaa
adaaaaaaegiccaaaaaaaaaaaakaaaaaadiaaaaajecaabaaaacaaaaaaakiacaaa
aaaaaaaaacaaaaaaakiacaaaaaaaaaaaacaaaaaadiaaaaahicaabaaaacaaaaaa
ckaabaaaacaaaaaackaabaaaacaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaajicaabaaaadaaaaaackaabaaaacaaaaaa
ckaabaaaacaaaaaaabeaaaaaaaaaialpdcaaaaajecaabaaaaaaaaaaackaabaaa
aaaaaaaadkaabaaaadaaaaaaabeaaaaaaaaaiadpdiaaaaahecaabaaaaaaaaaaa
ckaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaaabeaaaaanaapejeaaoaaaaahecaabaaaaaaaaaaadkaabaaaacaaaaaa
ckaabaaaaaaaaaaadiaaaaahicaabaaaacaaaaaackaabaaaacaaaaaaabeaaaaa
aaaaaadpdcaaaaakecaabaaaacaaaaaackaabaiaebaaaaaaacaaaaaaabeaaaaa
aaaaaadpabeaaaaaaaaaiadpdcaaaaajicaabaaaadaaaaaaakaabaaaaaaaaaaa
ckaabaaaacaaaaaadkaabaaaacaaaaaaaoaaaaakicaabaaaadaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpdkaabaaaadaaaaaadcaaaaajecaabaaa
acaaaaaabkaabaaaaaaaaaaackaabaaaacaaaaaadkaabaaaacaaaaaaaoaaaaak
ecaabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpckaabaaa
acaaaaaadiaaaaahecaabaaaacaaaaaackaabaaaacaaaaaadkaabaaaadaaaaaa
diaaaaahbcaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaadkaabaaaabaaaaaaakaabaaaaaaaaaaadicaaaahbcaabaaa
aaaaaaaackaabaaaacaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakiacaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaafaaaaaa
egacbaaaadaaaaaaagaabaaaaaaaaaaaefaaaaajpcaabaaaagaaaaaaegbabaaa
abaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaadiaaaaaipcaabaaaagaaaaaa
egaobaaaagaaaaaaegiocaaaaaaaaaaaaaaaaaaaeiaaaaalpcaabaaaahaaaaaa
egacbaaaabaaaaaaeghobaaaadaaaaaaaagabaaaabaaaaaaabeaaaaaaaaaiaeb
diaaaaahhcaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaahaaaaaacpaaaaaf
ecaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaaiecaabaaaaaaaaaaackaabaaa
aaaaaaaaakiacaaaaaaaaaaaaeaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaaihcaabaaaahaaaaaakgakbaaaaaaaaaaaegiccaaaaaaaaaaa
adaaaaaadiaaaaahhcaabaaaahaaaaaapgapbaaaabaaaaaaegacbaaaahaaaaaa
dcaaaaamhcaabaaaaiaaaaaaegiccaaaaaaaaaaaafaaaaaaegacbaaaagaaaaaa
egiccaiaebaaaaaaaaaaaaaaafaaaaaadcaaaaalhcaabaaaaiaaaaaafgifcaaa
aaaaaaaaagaaaaaaegacbaaaaiaaaaaaegiccaaaaaaaaaaaafaaaaaacpaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaaaaaaaaaagaaaaaabjaaaaafccaabaaaaaaaaaaabkaabaaa
aaaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaaaiaaaaaa
deaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaaahaaaaaadiaaaaah
ocaabaaaaaaaaaaaagajbaaaadaaaaaafgaobaaaaaaaaaaadiaaaaaiicaabaaa
abaaaaaaakiacaaaaaaaaaaaacaaaaaaabeaaaaaaaaahaebeiaaaaalpcaabaaa
aeaaaaaaegacbaaaaeaaaaaaeghobaaaadaaaaaaaagabaaaabaaaaaadkaabaaa
abaaaaaadcaaaaakicaabaaaabaaaaaaakiacaaaaaaaaaaaacaaaaaaabeaaaaa
aaaamgecabeaaaaaaaaaiadpaoaaaaahicaabaaaabaaaaaaabeaaaaaaaaamiec
dkaabaaaabaaaaaacpaaaaafbcaabaaaacaaaaaaakaabaaaacaaaaaadiaaaaah
icaabaaaabaaaaaadkaabaaaabaaaaaaakaabaaaacaaaaaabjaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadeaaaaahncaabaaaacaaaaaapgapbaaaabaaaaaa
agajbaaaaeaaaaaadiaaaaaincaabaaaacaaaaaaagaobaaaacaaaaaaagijcaaa
aaaaaaaaahaaaaaadiaaaaahhcaabaaaaeaaaaaafgafbaaaacaaaaaaegacbaaa
adaaaaaadeaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaa
dcaaaaajocaabaaaaaaaaaaaagajbaaaagaaaaaaagajbaaaabaaaaaafgaobaaa
aaaaaaaadcaaaaajhcaabaaaaaaaaaaaagaabaaaaaaaaaaaegacbaaaadaaaaaa
jgahbaaaaaaaaaaadcaaaaajhcaabaaaabaaaaaaigadbaaaacaaaaaaegacbaaa
adaaaaaaegacbaaaafaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaiaebaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaapgipcaaaaaaaaaaa
ahaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaa
egbcbaaaahaaaaaaegbcbaaaahaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaahaaaaaa
diaaaaajicaabaaaaaaaaaaackiacaaaaaaaaaaaaiaaaaaackiacaaaaaaaaaaa
aiaaaaaadcaaaaakicaabaaaabaaaaaackaabaiaebaaaaaaabaaaaaackaabaaa
abaaaaaaabeaaaaaaaaaiadpdcaaaaakicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadpelaaaaaficaabaaaabaaaaaa
dkaabaaaaaaaaaaadcaaaaakecaabaaaabaaaaaackiacaaaaaaaaaaaaiaaaaaa
ckaabaaaabaaaaaadkaabaaaabaaaaaabnaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaadiaaaaahdcaabaaaabaaaaaaegaabaaaabaaaaaa
kgakbaaaabaaaaaadgaaaaagdcaabaaaabaaaaaaegaabaiaebaaaaaaabaaaaaa
abaaaaahdcaabaaaabaaaaaapgapbaaaaaaaaaaaegaabaaaabaaaaaaaoaaaaah
mcaabaaaabaaaaaaagbebaaaagaaaaaapgbpbaaaagaaaaaaaaaaaaahdcaabaaa
abaaaaaaegaabaaaabaaaaaaogakbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
egaabaaaabaaaaaaeghobaaaaeaaaaaaaagabaaaacaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaajhccabaaa
aaaaaaaapgapbaaaagaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaf
iccabaaaaaaaaaaadkaabaaaagaaaaaadoaaaaab"
}
}
 }
}
Fallback "Diffuse"
}