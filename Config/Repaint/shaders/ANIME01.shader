// Compiled shader for PC, Mac & Linux Standalone, uncompressed size: 33.6KB

Shader "ANIME01" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _MainTex ("Base (RGB)", 2D) = "white" {}
 _ToonRamp ("Tone Ramp (RGB)", 2D) = "white" {}
 _RimRamp ("Rim Ramp (RGB)", 2D) = "white" {}
 _HL1_Color ("High Light Primary Color", Color) = (1,1,1,1)
 _HL1_Roughness ("High Light Primary Roughness", Range(0,1)) = 0.125
 _HL1_F0 ("High Light Primary F0", Range(0,1)) = 0.5
 _HL2_Color ("High Light Secondary Color", Color) = (1,0.75,0.75,1)
 _HL2_Roughness ("High Light Secondary Roughness", Range(0,1)) = 0.5
 _HL2_F0 ("High Light Secondary F0", Range(0,1)) = 0.5
 _OutlineColor ("Outline Color", Color) = (0.5,0.5,0.5,1)
 _OutlineWidth ("Outline Width", Range(0,0.01)) = 0.001
 _LambertScale ("_LambertScale", Range(0,2)) = 0.5
 _LambertOffset ("_LambertOffset", Range(0,1)) = 0.5
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Geometry" "RenderType"="Opaque" }


 // Stats for Vertex shader:
 //       d3d11 : 20 math
 //    d3d11_9x : 20 math
 //        d3d9 : 21 math
 //      opengl : 21 math
 // Stats for Fragment shader:
 //       d3d11 : 76 math, 3 texture, 2 branch
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry" "RenderType"="Opaque" }
  Cull Off
Program "vp" {
SubProgram "opengl " {
// Stats: 21 math
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[15] = { program.local[0],
		state.matrix.mvp,
		program.local[5..14] };
TEMP R0;
TEMP R1;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD R1.xyz, -R0, c[13];
DP3 R0.w, R1, R1;
RSQ R1.w, R0.w;
DP4 R0.w, vertex.position, c[8];
MUL result.texcoord[2].xyz, R1.w, R1;
MOV result.texcoord[3], R0;
DP4 result.texcoord[4].w, R0, c[12];
DP4 result.texcoord[4].z, R0, c[11];
DP4 result.texcoord[4].y, R0, c[10];
DP4 result.texcoord[4].x, R0, c[9];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[14], c[14].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
DP3 result.texcoord[1].z, vertex.normal, c[7];
DP3 result.texcoord[1].y, vertex.normal, c[6];
DP3 result.texcoord[1].x, vertex.normal, c[5];
END
# 21 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 21 math
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_MainTex_ST]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add r1.xyz, -r0, c12
dp3 r0.w, r1, r1
rsq r1.w, r0.w
dp4 r0.w, v0, c7
mul oT2.xyz, r1.w, r1
mov oT3, r0
dp4 oT4.w, r0, c11
dp4 oT4.z, r0, c10
dp4 oT4.y, r0, c9
dp4 oT4.x, r0, c8
mad oT0.xy, v2, c13, c13.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
dp3 oT1.z, v1, c6
dp3 oT1.y, v1, c5
dp3 oT1.x, v1, c4
"
}
SubProgram "d3d11 " {
// Stats: 20 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Matrix 144 [_LightMatrix0]
Vector 16 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecednbneignehjifkakhgbglnhpkaijcgdcdabaaaaaadiafaaaaadaaaaaa
cmaaaaaanmaaaaaajeabaaaaejfdeheokiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaijaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaajbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcjmadaaaaeaaaabaa
ohaaaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadpccabaaa
afaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
abaaaaaaogikcaaaaaaaaaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
acaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaaaaaaaaaadcaaaaakhccabaaa
acaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaaaaaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaaaaaaaaajhcaabaaa
abaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahhccabaaaadaaaaaapgapbaaaabaaaaaa
egacbaaaabaaaaaadgaaaaafpccabaaaaeaaaaaaegaobaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaaakaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaaaaaaaaaajaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaalaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaafaaaaaaegiocaaaaaaaaaaa
amaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 20 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Matrix 144 [_LightMatrix0]
Vector 16 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedehomacennndaedpioocmeepbnolimedfabaaaaaagmahaaaaaeaaaaaa
daaaaaaagaacaaaaaeagaaaaleagaaaaebgpgodjciacaaaaciacaaaaaaacpopp
meabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaabaa
abaaabaaaaaaaaaaaaaaajaaaeaaacaaaaaaaaaaabaaaeaaabaaagaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaacaaamaaaeaaalaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjaafaaaaadaaaaahiaacaaffjaamaaoekaaeaaaaaeaaaaahiaalaaoeka
acaaaajaaaaaoeiaaeaaaaaeabaaahoaanaaoekaacaakkjaaaaaoeiaaeaaaaae
aaaaadoaadaaoejaabaaoekaabaaookaafaaaaadaaaaapiaaaaaffjaamaaoeka
aeaaaaaeaaaaapiaalaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaanaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeiaacaaaaad
abaaahiaaaaaoeibagaaoekaaiaaaaadabaaaiiaabaaoeiaabaaoeiaahaaaaac
abaaaiiaabaappiaafaaaaadacaaahoaabaappiaabaaoeiaafaaaaadabaaapia
aaaaffiaadaaoekaaeaaaaaeabaaapiaacaaoekaaaaaaaiaabaaoeiaaeaaaaae
abaaapiaaeaaoekaaaaakkiaabaaoeiaaeaaaaaeaeaaapoaafaaoekaaaaappia
abaaoeiaabaaaaacadaaapoaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaiaaoeka
aeaaaaaeaaaaapiaahaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaajaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaa
fdeieefcjmadaaaaeaaaabaaohaaaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadpccabaaa
aeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaabaaaaaaogikcaaaaaaaaaaaabaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaa
aaaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaa
acaaaaaaegacbaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
amaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaaaaaaaaajhcaabaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaa
abaaaaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhccabaaa
adaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadgaaaaafpccabaaaaeaaaaaa
egaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
aaaaaaaaakaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaajaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
aaaaaaaaalaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
afaaaaaaegiocaaaaaaaaaaaamaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaa
doaaaaabejfdeheokiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaaijaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaajbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
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
// Stats: 76 math, 3 textures, 2 branches
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ToonRamp] 2D 1
SetTexture 2 [_RimRamp] 2D 2
ConstBuffer "$Globals" 208
Vector 0 [_Color]
Vector 32 [_HL1_Color]
Float 48 [_HL1_Roughness]
Float 52 [_HL1_F0]
Vector 64 [_HL2_Color]
Float 80 [_HL2_Roughness]
Float 84 [_HL2_F0]
Float 88 [_LambertScale]
Float 92 [_LambertOffset]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedgpkdnmbppcpokijgehighafkfcnoambeabaaaaaaoealaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmeakaaaa
eaaaaaaalbacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacafaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaaagaabaaa
aaaaaaaaagbjbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaa
egbcbaaaacaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaaagaabaaaabaaaaaaegbcbaaaacaaaaaabiaaaaaiicaabaaa
abaaaaaadkiacaaaabaaaaaaaaaaaaaaabeaaaaaaaaaaaaabpaaaeaddkaabaaa
abaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaaabaaaaaaaaaaaaaaegiccaaa
abaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaai
hcaabaaaacaaaaaapgapbaaaabaaaaaaegiccaaaabaaaaaaaaaaaaaabcaaaaab
aaaaaaajhcaabaaaadaaaaaaegbcbaiaebaaaaaaaeaaaaaaegiccaaaabaaaaaa
aaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaa
eeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaa
pgapbaaaabaaaaaaegacbaaaadaaaaaabfaaaaabdcaaaaajhcaabaaaadaaaaaa
egbcbaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaaeeaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaaagaabaaaaaaaaaaaegacbaaa
adaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaa
deaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaialpddaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpbacaaaahicaabaaa
abaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabacaaaahccaabaaaaaaaaaaa
jgahbaaaaaaaaaaaegacbaaaabaaaaaabacaaaahecaabaaaaaaaaaaaegacbaaa
adaaaaaaegacbaaaabaaaaaadeaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaaaaaaaaajbcaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaa
afaaaaaaabeaaaaaaaaaiadpaaaaaaaiccaabaaaabaaaaaadkaabaiaebaaaaaa
abaaaaaaabeaaaaaaaaaiadpdiaaaaahecaabaaaabaaaaaabkaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaahecaabaaaabaaaaaackaabaaaabaaaaaackaabaaa
abaaaaaadiaaaaahccaabaaaabaaaaaackaabaaaabaaaaaabkaabaaaabaaaaaa
dcaaaaakbcaabaaaabaaaaaaakaabaaaabaaaaaabkaabaaaabaaaaaabkiacaaa
aaaaaaaaafaaaaaadiaaaaajecaabaaaabaaaaaaakiacaaaaaaaaaaaafaaaaaa
akiacaaaaaaaaaaaafaaaaaadiaaaaahicaabaaaabaaaaaackaabaaaabaaaaaa
ckaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaackaabaaa
aaaaaaaadcaaaaajbcaabaaaacaaaaaackaabaaaabaaaaaackaabaaaabaaaaaa
abeaaaaaaaaaialpdcaaaaajbcaabaaaacaaaaaackaabaaaaaaaaaaaakaabaaa
acaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaaacaaaaaaakaabaaaacaaaaaa
akaabaaaacaaaaaadiaaaaahbcaabaaaacaaaaaaakaabaaaacaaaaaaabeaaaaa
naapejeaaoaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaakaabaaaacaaaaaa
diaaaaahbcaabaaaacaaaaaackaabaaaabaaaaaaabeaaaaaaaaaaadpdcaaaaak
ecaabaaaabaaaaaackaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaiadpdcaaaaajccaabaaaacaaaaaadkaabaaaaaaaaaaackaabaaaabaaaaaa
akaabaaaacaaaaaaaoaaaaakccaabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpbkaabaaaacaaaaaadcaaaaajecaabaaaabaaaaaabkaabaaa
aaaaaaaackaabaaaabaaaaaaakaabaaaacaaaaaaaoaaaaakecaabaaaabaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpckaabaaaabaaaaaadiaaaaah
ecaabaaaabaaaaaackaabaaaabaaaaaabkaabaaaacaaaaaadiaaaaahicaabaaa
abaaaaaadkaabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaadkaabaaaabaaaaaadicaaaahbcaabaaaabaaaaaackaabaaa
abaaaaaaakaabaaaabaaaaaaaaaaaaakpcaabaaaacaaaaaaegiocaiaebaaaaaa
aaaaaaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaakpcaabaaaacaaaaaa
agaabaaaabaaaaaaegaobaaaacaaaaaaegiocaaaaaaaaaaaaaaaaaaaefaaaaaj
pcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadccaaaal
bcaabaaaadaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaaafaaaaaadkiacaaa
aaaaaaaaafaaaaaadgaaaaaikcaabaaaadaaaaaaaceaaaaaaaaaaaaaaaaaaadp
aaaaaaaaaaaaaadpefaaaaajpcaabaaaaeaaaaaaegaabaaaadaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaaaaaaaaajbcaabaaaabaaaaaabkiacaiaebaaaaaa
aaaaaaaaadaaaaaaabeaaaaaaaaaiadpdcaaaaakbcaabaaaabaaaaaaakaabaaa
abaaaaaabkaabaaaabaaaaaabkiacaaaaaaaaaaaadaaaaaadiaaaaajccaabaaa
abaaaaaaakiacaaaaaaaaaaaadaaaaaaakiacaaaaaaaaaaaadaaaaaadiaaaaah
ecaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaajicaabaaa
abaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaialpdcaaaaaj
ecaabaaaaaaaaaaackaabaaaaaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadp
diaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaanaapejeaaoaaaaahecaabaaa
aaaaaaaackaabaaaabaaaaaackaabaaaaaaaaaaadiaaaaahecaabaaaabaaaaaa
bkaabaaaabaaaaaaabeaaaaaaaaaaadpdcaaaaakccaabaaaabaaaaaabkaabaia
ebaaaaaaabaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdcaaaaajicaabaaa
abaaaaaadkaabaaaaaaaaaaabkaabaaaabaaaaaackaabaaaabaaaaaaaoaaaaak
icaabaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpdkaabaaa
abaaaaaadcaaaaajccaabaaaabaaaaaabkaabaaaaaaaaaaabkaabaaaabaaaaaa
ckaabaaaabaaaaaaaoaaaaakccaabaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpbkaabaaaabaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaaakaabaaaabaaaaaackaabaaa
aaaaaaaadicaaaahecaabaaaaaaaaaaabkaabaaaabaaaaaackaabaaaaaaaaaaa
aaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaahecaabaaaadaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaogakbaaaadaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaa
dcaaaaajlcaabaaaaaaaaaaaegaibaaaacaaaaaaegaibaaaaeaaaaaaegaibaaa
abaaaaaadccaaaakhccabaaaaaaaaaaaegiccaaaaaaaaaaaacaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaacaaaaaa
doaaaaab"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 20 math
 // Stats for Fragment shader:
 //       d3d11 : 76 math, 3 texture, 2 branch
 Pass {
  Tags { "LIGHTMODE"="ForwardAdd" "SHADOWSUPPORT"="false" "QUEUE"="Geometry" "RenderType"="Opaque" }
  Blend One One
Program "vp" {
// Platform opengl skipped due to earlier errors
// Platform d3d9 skipped due to earlier errors
// Platform d3d11_9x skipped due to earlier errors
// Platform opengl skipped due to earlier errors
// Platform d3d9 skipped due to earlier errors
// Platform d3d11_9x skipped due to earlier errors
SubProgram "d3d11 " {
// Stats: 20 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Matrix 144 [_LightMatrix0]
Vector 16 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecednbneignehjifkakhgbglnhpkaijcgdcdabaaaaaadiafaaaaadaaaaaa
cmaaaaaanmaaaaaajeabaaaaejfdeheokiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaijaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaajbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcjmadaaaaeaaaabaa
ohaaaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadpccabaaa
afaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
abaaaaaaogikcaaaaaaaaaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
acaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaaaaaaaaaadcaaaaakhccabaaa
acaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaaaaaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaaaaaaaaajhcaabaaa
abaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahhccabaaaadaaaaaapgapbaaaabaaaaaa
egacbaaaabaaaaaadgaaaaafpccabaaaaeaaaaaaegaobaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaaakaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaaaaaaaaaajaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaalaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaafaaaaaaegiocaaaaaaaaaaa
amaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab"
}
}
Program "fp" {
// Platform opengl skipped due to earlier errors
// Platform d3d9 skipped due to earlier errors
// Platform d3d11_9x skipped due to earlier errors
// Platform opengl had shader errors
//   <no keywords>
// Platform d3d9 had shader errors
//   <no keywords>
// Platform d3d11_9x had shader errors
//   <no keywords>
SubProgram "d3d11 " {
// Stats: 76 math, 3 textures, 2 branches
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ToonRamp] 2D 1
SetTexture 2 [_RimRamp] 2D 2
ConstBuffer "$Globals" 208
Vector 0 [_Color]
Vector 32 [_HL1_Color]
Float 48 [_HL1_Roughness]
Float 52 [_HL1_F0]
Vector 64 [_HL2_Color]
Float 80 [_HL2_Roughness]
Float 84 [_HL2_F0]
Float 88 [_LambertScale]
Float 92 [_LambertOffset]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedgpkdnmbppcpokijgehighafkfcnoambeabaaaaaaoealaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmeakaaaa
eaaaaaaalbacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacafaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaaagaabaaa
aaaaaaaaagbjbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaa
egbcbaaaacaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaaagaabaaaabaaaaaaegbcbaaaacaaaaaabiaaaaaiicaabaaa
abaaaaaadkiacaaaabaaaaaaaaaaaaaaabeaaaaaaaaaaaaabpaaaeaddkaabaaa
abaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaaabaaaaaaaaaaaaaaegiccaaa
abaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaai
hcaabaaaacaaaaaapgapbaaaabaaaaaaegiccaaaabaaaaaaaaaaaaaabcaaaaab
aaaaaaajhcaabaaaadaaaaaaegbcbaiaebaaaaaaaeaaaaaaegiccaaaabaaaaaa
aaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaa
eeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaa
pgapbaaaabaaaaaaegacbaaaadaaaaaabfaaaaabdcaaaaajhcaabaaaadaaaaaa
egbcbaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaaeeaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaaagaabaaaaaaaaaaaegacbaaa
adaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaa
deaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaialpddaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpbacaaaahicaabaaa
abaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabacaaaahccaabaaaaaaaaaaa
jgahbaaaaaaaaaaaegacbaaaabaaaaaabacaaaahecaabaaaaaaaaaaaegacbaaa
adaaaaaaegacbaaaabaaaaaadeaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaaaaaaaaajbcaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaa
afaaaaaaabeaaaaaaaaaiadpaaaaaaaiccaabaaaabaaaaaadkaabaiaebaaaaaa
abaaaaaaabeaaaaaaaaaiadpdiaaaaahecaabaaaabaaaaaabkaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaahecaabaaaabaaaaaackaabaaaabaaaaaackaabaaa
abaaaaaadiaaaaahccaabaaaabaaaaaackaabaaaabaaaaaabkaabaaaabaaaaaa
dcaaaaakbcaabaaaabaaaaaaakaabaaaabaaaaaabkaabaaaabaaaaaabkiacaaa
aaaaaaaaafaaaaaadiaaaaajecaabaaaabaaaaaaakiacaaaaaaaaaaaafaaaaaa
akiacaaaaaaaaaaaafaaaaaadiaaaaahicaabaaaabaaaaaackaabaaaabaaaaaa
ckaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaackaabaaa
aaaaaaaadcaaaaajbcaabaaaacaaaaaackaabaaaabaaaaaackaabaaaabaaaaaa
abeaaaaaaaaaialpdcaaaaajbcaabaaaacaaaaaackaabaaaaaaaaaaaakaabaaa
acaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaaacaaaaaaakaabaaaacaaaaaa
akaabaaaacaaaaaadiaaaaahbcaabaaaacaaaaaaakaabaaaacaaaaaaabeaaaaa
naapejeaaoaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaakaabaaaacaaaaaa
diaaaaahbcaabaaaacaaaaaackaabaaaabaaaaaaabeaaaaaaaaaaadpdcaaaaak
ecaabaaaabaaaaaackaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaiadpdcaaaaajccaabaaaacaaaaaadkaabaaaaaaaaaaackaabaaaabaaaaaa
akaabaaaacaaaaaaaoaaaaakccaabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpbkaabaaaacaaaaaadcaaaaajecaabaaaabaaaaaabkaabaaa
aaaaaaaackaabaaaabaaaaaaakaabaaaacaaaaaaaoaaaaakecaabaaaabaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpckaabaaaabaaaaaadiaaaaah
ecaabaaaabaaaaaackaabaaaabaaaaaabkaabaaaacaaaaaadiaaaaahicaabaaa
abaaaaaadkaabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaadkaabaaaabaaaaaadicaaaahbcaabaaaabaaaaaackaabaaa
abaaaaaaakaabaaaabaaaaaaaaaaaaakpcaabaaaacaaaaaaegiocaiaebaaaaaa
aaaaaaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaakpcaabaaaacaaaaaa
agaabaaaabaaaaaaegaobaaaacaaaaaaegiocaaaaaaaaaaaaaaaaaaaefaaaaaj
pcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadccaaaal
bcaabaaaadaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaaafaaaaaadkiacaaa
aaaaaaaaafaaaaaadgaaaaaikcaabaaaadaaaaaaaceaaaaaaaaaaaaaaaaaaadp
aaaaaaaaaaaaaadpefaaaaajpcaabaaaaeaaaaaaegaabaaaadaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaaaaaaaaajbcaabaaaabaaaaaabkiacaiaebaaaaaa
aaaaaaaaadaaaaaaabeaaaaaaaaaiadpdcaaaaakbcaabaaaabaaaaaaakaabaaa
abaaaaaabkaabaaaabaaaaaabkiacaaaaaaaaaaaadaaaaaadiaaaaajccaabaaa
abaaaaaaakiacaaaaaaaaaaaadaaaaaaakiacaaaaaaaaaaaadaaaaaadiaaaaah
ecaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaajicaabaaa
abaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaialpdcaaaaaj
ecaabaaaaaaaaaaackaabaaaaaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadp
diaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaanaapejeaaoaaaaahecaabaaa
aaaaaaaackaabaaaabaaaaaackaabaaaaaaaaaaadiaaaaahecaabaaaabaaaaaa
bkaabaaaabaaaaaaabeaaaaaaaaaaadpdcaaaaakccaabaaaabaaaaaabkaabaia
ebaaaaaaabaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdcaaaaajicaabaaa
abaaaaaadkaabaaaaaaaaaaabkaabaaaabaaaaaackaabaaaabaaaaaaaoaaaaak
icaabaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpdkaabaaa
abaaaaaadcaaaaajccaabaaaabaaaaaabkaabaaaaaaaaaaabkaabaaaabaaaaaa
ckaabaaaabaaaaaaaoaaaaakccaabaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpbkaabaaaabaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaaakaabaaaabaaaaaackaabaaa
aaaaaaaadicaaaahecaabaaaaaaaaaaabkaabaaaabaaaaaackaabaaaaaaaaaaa
aaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaahecaabaaaadaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaogakbaaaadaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaa
dcaaaaajlcaabaaaaaaaaaaaegaibaaaacaaaaaaegaibaaaaeaaaaaaegaibaaa
abaaaaaadccaaaakhccabaaaaaaaaaaaegiccaaaaaaaaaaaacaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaacaaaaaa
doaaaaab"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 28 math
 // Stats for Fragment shader:
 //       d3d11 : 1 math, 1 texture
 Pass {
  Name "OUTLINE"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="false" "QUEUE"="Geometry" "RenderType"="Opaque" }
  Cull Front
Program "vp" {
// Platform opengl skipped due to earlier errors
// Platform d3d9 skipped due to earlier errors
// Platform d3d11_9x skipped due to earlier errors
// Platform opengl skipped due to earlier errors
// Platform d3d9 skipped due to earlier errors
// Platform d3d11_9x skipped due to earlier errors
SubProgram "d3d11 " {
// Stats: 28 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 160
Matrix 96 [_LightMatrix0]
Float 16 [_OutlineWidth]
Vector 32 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityPerFrame" 208
Matrix 0 [glstate_matrix_projection]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityPerFrame" 3
"vs_4_0
eefiecedgggjcbmmefmgpkmepgfglgfggcabmmdfabaaaaaaoiagaaaaadaaaaaa
cmaaaaaanmaaaaaajeabaaaaejfdeheokiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaijaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaajbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcemafaaaaeaaaabaa
fdabaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaafjaaaaaeegiocaaaadaaaaaa
acaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
pccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacacaaaaaadgaaaaag
bcaabaaaaaaaaaaabkiacaaaacaaaaaaaiaaaaaadgaaaaagccaabaaaaaaaaaaa
bkiacaaaacaaaaaaajaaaaaadgaaaaagecaabaaaaaaaaaaabkiacaaaacaaaaaa
akaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
diaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiacaaaadaaaaaaabaaaaaa
dgaaaaagbcaabaaaabaaaaaaakiacaaaacaaaaaaaiaaaaaadgaaaaagccaabaaa
abaaaaaaakiacaaaacaaaaaaajaaaaaadgaaaaagecaabaaaabaaaaaaakiacaaa
acaaaaaaakaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaa
abaaaaaadcaaaaakdcaabaaaaaaaaaaakgakbaaaaaaaaaaaegiacaaaadaaaaaa
aaaaaaaaegaabaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
abaaaaaadeaaaaahecaabaaaaaaaaaaackaabaaaabaaaaaaabeaaaaaaaaaaaaa
ddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaadddddddpdiaaaaah
dcaabaaaaaaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakdccabaaa
aaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaaabaaaaaaegaabaaaabaaaaaa
dgaaaaafmccabaaaaaaaaaaakgaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaacaaaaaaogikcaaaaaaaaaaaacaaaaaa
diaaaaaihcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaacaaaaaa
egacbaaaaaaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgbkbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hccabaaaadaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadgaaaaafpccabaaa
aeaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaaaaaaaaaahaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaa
agaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaaaaaaaaaaiaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pccabaaaafaaaaaaegiocaaaaaaaaaaaajaaaaaapgapbaaaaaaaaaaaegaobaaa
abaaaaaadoaaaaab"
}
}
Program "fp" {
// Platform opengl skipped due to earlier errors
// Platform d3d9 skipped due to earlier errors
// Platform d3d11_9x skipped due to earlier errors
// Platform opengl skipped due to earlier errors
// Platform d3d9 skipped due to earlier errors
// Platform d3d11_9x skipped due to earlier errors
SubProgram "d3d11 " {
// Stats: 1 math, 1 textures
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 160
Vector 0 [_OutlineColor]
BindCB  "$Globals" 0
"ps_4_0
eefiecedanahinhjelcajpodlccicjkcoihchgnaabaaaaaalmabaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcjmaaaaaa
eaaaaaaachaaaaaafjaaaaaeegiocaaaaaaaaaaaabaaaaaafkaaaaadaagabaaa
aaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaipccabaaa
aaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaadoaaaaab"
}
}
 }
}
Fallback "Diffuse"
}