// Compiled shader for PC, Mac & Linux Standalone, uncompressed size: 29.3KB

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
 _TranslucentTilt ("Translucent Tilt", Range(0,1)) = 0
 _SpecularColor ("Specular Color", Color) = (1,1,1,1)
 _Metalness ("Metalness", Range(0,1)) = 0
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Geometry" "RenderType"="Opaque" }


 // Stats for Vertex shader:
 //       d3d11 : 24 math
 //    d3d11_9x : 24 math
 //        d3d9 : 21 math
 //      opengl : 21 math
 // Stats for Fragment shader:
 //       d3d11 : 95 math, 4 texture, 4 branch
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
// Stats: 24 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 256
Matrix 192 [_LightMatrix0]
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
eefiecedabnkeegpgbbfnohhahagpjjignmjjoifabaaaaaanaafaaaaadaaaaaa
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
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcdeaeaaaaeaaaabaa
anabaaaafjaaaaaeegiocaaaaaaaaaaabaaaaaaafjaaaaaeegiocaaaabaaaaaa
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
diaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaa
aaaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaadaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaeaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaaaaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaaaaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaaaaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpccabaaaafaaaaaaegiocaaaaaaaaaaaapaaaaaapgapbaaa
aaaaaaaaegaobaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 24 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 256
Matrix 192 [_LightMatrix0]
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
eefiecedllphobgeliaggpnaelngophcabejlgcgabaaaaaafaaiaaaaaeaaaaaa
daaaaaaakmacaaaaoiagaaaajiahaaaaebgpgodjheacaaaaheacaaaaaaacpopp
baacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaabaa
abaaabaaaaaaaaaaaaaaamaaaeaaacaaaaaaaaaaabaaaeaaabaaagaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaacaaamaaaeaaalaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaafaaaaadaaaaahia
acaaffjaamaaoekaaeaaaaaeaaaaahiaalaaoekaacaaaajaaaaaoeiaaeaaaaae
abaaahoaanaaoekaacaakkjaaaaaoeiaafaaaaadaaaaahiaaaaaffjaamaaoeka
aeaaaaaeaaaaahiaalaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiaanaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaappjaaaaaoeiaacaaaaad
aaaaahiaaaaaoeibagaaoekaaiaaaaadaaaaaiiaaaaaoeiaaaaaoeiaahaaaaac
aaaaaiiaaaaappiaafaaaaadacaaahoaaaaappiaaaaaoeiaafaaaaadaaaaapia
aaaaffjaamaaoekaaeaaaaaeaaaaapiaalaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaanaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappja
aaaaoeiaafaaaaadabaaapiaaaaaffiaadaaoekaaeaaaaaeabaaapiaacaaoeka
aaaaaaiaabaaoeiaaeaaaaaeabaaapiaaeaaoekaaaaakkiaabaaoeiaaeaaaaae
aeaaapoaafaaoekaaaaappiaabaaoeiaabaaaaacadaaapoaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaakaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiappppaaaafdeieefcdeaeaaaaeaaaabaaanabaaaafjaaaaae
egiocaaaaaaaaaaabaaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaabaaaaaaogikcaaa
aaaaaaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiccaaa
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
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aeaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaaaaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaaaaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pccabaaaafaaaaaaegiocaaaaaaaaaaaapaaaaaapgapbaaaaaaaaaaaegaobaaa
abaaaaaadoaaaaabejfdeheokiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaaijaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaajbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfe
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
// Stats: 95 math, 4 textures, 4 branches
SetTexture 0 [_LightTextureB0] 2D 3
SetTexture 1 [_LightTexture0] 2D 2
SetTexture 2 [_MainTex] 2D 0
SetTexture 3 [_Reflection] CUBE 1
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
Vector 160 [_LightColor0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedmdgdjloanogojnlkmelefnjpopmkcpidabaaaaaaiiaoaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcgianaaaa
eaaaaaaafkadaaaafjaaaaaeegiocaaaaaaaaaaabaaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafidaaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacajaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahocaabaaa
aaaaaaaaagaabaaaaaaaaaaaagbjbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaabaaaaaaegbcbaaaacaaaaaa
biaaaaaiicaabaaaabaaaaaadkiacaaaabaaaaaaaaaaaaaaabeaaaaaaaaaaaaa
bpaaaeaddkaabaaaabaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaaabaaaaaa
aaaaaaaaegiccaaaabaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaaihcaabaaaacaaaaaapgapbaaaabaaaaaaegiccaaaabaaaaaa
aaaaaaaadgaaaaafbcaabaaaadaaaaaaabeaaaaaaaaaiadpbcaaaaabaaaaaaaj
hcaabaaaaeaaaaaaegbcbaiaebaaaaaaaeaaaaaaegiccaaaabaaaaaaaaaaaaaa
djaaaaaiicaabaaaabaaaaaadkiacaaaaaaaaaaaapaaaaaaabeaaaaaaaaaiadp
bpaaaeaddkaabaaaabaaaaaabaaaaaahicaabaaaabaaaaaaegbcbaaaafaaaaaa
egbcbaaaafaaaaaaefaaaaajpcaabaaaafaaaaaapgapbaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaadaaaaaaaoaaaaahgcaabaaaafaaaaaaagbbbaaaafaaaaaa
pgbpbaaaafaaaaaaaaaaaaakgcaabaaaafaaaaaafgagbaaaafaaaaaaaceaaaaa
aaaaaaaaaaaaaadpaaaaaadpaaaaaaaaefaaaaajpcaabaaaagaaaaaajgafbaaa
afaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaadbaaaaahicaabaaaabaaaaaa
abeaaaaaaaaaaaaackbabaaaafaaaaaaabaaaaahicaabaaaabaaaaaadkaabaaa
abaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaaabaaaaaadkaabaaaagaaaaaa
dkaabaaaabaaaaaadiaaaaahbcaabaaaadaaaaaaakaabaaaafaaaaaadkaabaaa
abaaaaaabcaaaaabbaaaaaahicaabaaaabaaaaaaegbcbaaaafaaaaaaegbcbaaa
afaaaaaaefaaaaajpcaabaaaadaaaaaapgapbaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaacaaaaaabfaaaaabbaaaaaahicaabaaaabaaaaaaegacbaaaaeaaaaaa
egacbaaaaeaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaaaeaaaaaabfaaaaabdcaaaaaj
ocaabaaaadaaaaaaagbjbaaaadaaaaaaagaabaaaaaaaaaaaagajbaaaacaaaaaa
baaaaaahbcaabaaaaaaaaaaajgahbaaaadaaaaaajgahbaaaadaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahocaabaaaadaaaaaaagaabaaa
aaaaaaaafgaobaaaadaaaaaabaaaaaaibcaabaaaaaaaaaaajgahbaiaebaaaaaa
aaaaaaaaegacbaaaabaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaalhcaabaaaaeaaaaaaegacbaaaabaaaaaaagaabaia
ebaaaaaaaaaaaaaajgahbaiaebaaaaaaaaaaaaaabacaaaahbcaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaabaaaaaabacaaaahicaabaaaabaaaaaaegacbaaa
acaaaaaajgahbaaaadaaaaaabacaaaahbcaabaaaacaaaaaaegacbaaaacaaaaaa
egacbaaaaeaaaaaabacaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaaegacbaaa
abaaaaaabacaaaahecaabaaaaaaaaaaajgahbaaaadaaaaaaegacbaaaabaaaaaa
aaaaaaaiicaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
aacaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaabkiacaaaaaaaaaaaaeaaaaaa
dccaaaalccaabaaaacaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaaiaaaaaa
bkiacaaaaaaaaaaaaiaaaaaaaaaaaaajecaabaaaacaaaaaabkiacaiaebaaaaaa
aaaaaaaaacaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaabaaaaaadkaabaia
ebaaaaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaaacaaaaaadkaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahicaabaaaacaaaaaadkaabaaaacaaaaaa
dkaabaaaacaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaa
acaaaaaadcaaaaakicaabaaaabaaaaaackaabaaaacaaaaaadkaabaaaabaaaaaa
bkiacaaaaaaaaaaaacaaaaaadiaaaaaihcaabaaaadaaaaaaagaabaaaadaaaaaa
egiccaaaaaaaaaaaakaaaaaadiaaaaajecaabaaaacaaaaaaakiacaaaaaaaaaaa
acaaaaaaakiacaaaaaaaaaaaacaaaaaadiaaaaahicaabaaaacaaaaaackaabaaa
acaaaaaackaabaaaacaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
ckaabaaaaaaaaaaadcaaaaajicaabaaaadaaaaaackaabaaaacaaaaaackaabaaa
acaaaaaaabeaaaaaaaaaialpdcaaaaajecaabaaaaaaaaaaackaabaaaaaaaaaaa
dkaabaaaadaaaaaaabeaaaaaaaaaiadpdiaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
abeaaaaanaapejeaaoaaaaahecaabaaaaaaaaaaadkaabaaaacaaaaaackaabaaa
aaaaaaaadiaaaaahicaabaaaacaaaaaackaabaaaacaaaaaaabeaaaaaaaaaaadp
dcaaaaakecaabaaaacaaaaaackaabaiaebaaaaaaacaaaaaaabeaaaaaaaaaaadp
abeaaaaaaaaaiadpdcaaaaajicaabaaaadaaaaaaakaabaaaaaaaaaaackaabaaa
acaaaaaadkaabaaaacaaaaaaaoaaaaakicaabaaaadaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpdkaabaaaadaaaaaadcaaaaajecaabaaaacaaaaaa
bkaabaaaaaaaaaaackaabaaaacaaaaaadkaabaaaacaaaaaaaoaaaaakecaabaaa
acaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpckaabaaaacaaaaaa
diaaaaahecaabaaaacaaaaaackaabaaaacaaaaaadkaabaaaadaaaaaadiaaaaah
bcaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaa
aaaaaaaadkaabaaaabaaaaaaakaabaaaaaaaaaaadicaaaahbcaabaaaaaaaaaaa
ckaabaaaacaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakiacaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaafaaaaaaegacbaaa
adaaaaaaagaabaaaaaaaaaaaefaaaaajpcaabaaaagaaaaaaegbabaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaaaaaaaaadiaaaaaipcaabaaaagaaaaaaegaobaaa
agaaaaaaegiocaaaaaaaaaaaaaaaaaaaeiaaaaalpcaabaaaahaaaaaaegacbaaa
abaaaaaaeghobaaaadaaaaaaaagabaaaabaaaaaaabeaaaaaaaaaiaebdiaaaaah
hcaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaahaaaaaacpaaaaafecaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaaiecaabaaaaaaaaaaackaabaaaaaaaaaaa
akiacaaaaaaaaaaaaeaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaaihcaabaaaahaaaaaakgakbaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaa
diaaaaahhcaabaaaahaaaaaapgapbaaaabaaaaaaegacbaaaahaaaaaadcaaaaam
hcaabaaaaiaaaaaaegiccaaaaaaaaaaaafaaaaaaegacbaaaagaaaaaaegiccaia
ebaaaaaaaaaaaaaaafaaaaaadcaaaaalhcaabaaaaiaaaaaafgifcaaaaaaaaaaa
agaaaaaaegacbaaaaiaaaaaaegiccaaaaaaaaaaaafaaaaaacpaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaaaaaaaaaagaaaaaabjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaaaiaaaaaadeaaaaah
ocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaaahaaaaaadiaaaaahocaabaaa
aaaaaaaaagajbaaaadaaaaaafgaobaaaaaaaaaaadiaaaaaiicaabaaaabaaaaaa
akiacaaaaaaaaaaaacaaaaaaabeaaaaaaaaahaebeiaaaaalpcaabaaaaeaaaaaa
egacbaaaaeaaaaaaeghobaaaadaaaaaaaagabaaaabaaaaaadkaabaaaabaaaaaa
dcaaaaakicaabaaaabaaaaaaakiacaaaaaaaaaaaacaaaaaaabeaaaaaaaaamgec
abeaaaaaaaaaiadpaoaaaaahicaabaaaabaaaaaaabeaaaaaaaaamiecdkaabaaa
abaaaaaacpaaaaafbcaabaaaacaaaaaaakaabaaaacaaaaaadiaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaaakaabaaaacaaaaaabjaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadeaaaaahncaabaaaacaaaaaapgapbaaaabaaaaaaagajbaaa
aeaaaaaadiaaaaaincaabaaaacaaaaaaagaobaaaacaaaaaaagijcaaaaaaaaaaa
ahaaaaaadiaaaaahhcaabaaaaeaaaaaafgafbaaaacaaaaaaegacbaaaadaaaaaa
deaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaadcaaaaaj
ocaabaaaaaaaaaaaagajbaaaagaaaaaaagajbaaaabaaaaaafgaobaaaaaaaaaaa
dcaaaaajhcaabaaaaaaaaaaaagaabaaaaaaaaaaaegacbaaaadaaaaaajgahbaaa
aaaaaaaadcaaaaajhcaabaaaabaaaaaaigadbaaaacaaaaaaegacbaaaadaaaaaa
egacbaaaafaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhccabaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaa
egacbaaaabaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaa
agaaaaaadoaaaaab"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 24 math
 // Stats for Fragment shader:
 //       d3d11 : 64 math, 4 texture, 4 branch
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
// Stats: 24 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 256
Matrix 192 [_LightMatrix0]
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
eefiecedabnkeegpgbbfnohhahagpjjignmjjoifabaaaaaanaafaaaaadaaaaaa
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
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcdeaeaaaaeaaaabaa
anabaaaafjaaaaaeegiocaaaaaaaaaaabaaaaaaafjaaaaaeegiocaaaabaaaaaa
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
diaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaa
aaaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaadaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaeaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaaaaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaaaaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaaaaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpccabaaaafaaaaaaegiocaaaaaaaaaaaapaaaaaapgapbaaa
aaaaaaaaegaobaaaabaaaaaadoaaaaab"
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
// Stats: 64 math, 4 textures, 4 branches
SetTexture 0 [_LightTextureB0] 2D 2
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_MainTex] 2D 0
ConstBuffer "$Globals" 256
Matrix 192 [_LightMatrix0]
Vector 0 [_Color]
Float 32 [_Roughness]
Float 36 [_F0]
Vector 112 [_SpecularColor] 3
Float 124 [_Metalness]
Float 128 [_LambertScale]
Float 132 [_LambertOffset]
Vector 160 [_LightColor0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedidnlmafnclkbdcleppdailhocdkdgljcabaaaaaahiakaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfiajaaaa
eaaaaaaafgacaaaafjaaaaaeegiocaaaaaaaaaaabaaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacahaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaa
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
eghobaaaaaaaaaaaaagabaaaacaaaaaaaoaaaaahgcaabaaaafaaaaaaagbbbaaa
afaaaaaapgbpbaaaafaaaaaaaaaaaaakgcaabaaaafaaaaaafgagbaaaafaaaaaa
aceaaaaaaaaaaaaaaaaaaadpaaaaaadpaaaaaaaaefaaaaajpcaabaaaagaaaaaa
jgafbaaaafaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadbaaaaahicaabaaa
abaaaaaaabeaaaaaaaaaaaaackbabaaaafaaaaaaabaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaaabaaaaaadkaabaaa
agaaaaaadkaabaaaabaaaaaadiaaaaahbcaabaaaadaaaaaaakaabaaaafaaaaaa
dkaabaaaabaaaaaabcaaaaabbaaaaaahicaabaaaabaaaaaaegbcbaaaafaaaaaa
egbcbaaaafaaaaaaefaaaaajpcaabaaaadaaaaaapgapbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaabfaaaaabbaaaaaahicaabaaaabaaaaaaegacbaaa
aeaaaaaaegacbaaaaeaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahhcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaaaeaaaaaabfaaaaab
dcaaaaajocaabaaaadaaaaaaagbjbaaaadaaaaaaagaabaaaaaaaaaaaagajbaaa
acaaaaaabaaaaaahbcaabaaaaaaaaaaajgahbaaaadaaaaaajgahbaaaadaaaaaa
eeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahocaabaaaadaaaaaa
agaabaaaaaaaaaaafgaobaaaadaaaaaabacaaaahbcaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaabacaaaahicaabaaaabaaaaaaegacbaaaacaaaaaa
jgahbaaaadaaaaaabacaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaaegacbaaa
abaaaaaabacaaaahecaabaaaaaaaaaaajgahbaaaadaaaaaaegacbaaaabaaaaaa
dccaaaalicaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaaiaaaaaa
bkiacaaaaaaaaaaaaiaaaaaaaaaaaaajbcaabaaaabaaaaaabkiacaiaebaaaaaa
aaaaaaaaacaaaaaaabeaaaaaaaaaiadpaaaaaaaiccaabaaaabaaaaaadkaabaia
ebaaaaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahecaabaaaabaaaaaabkaabaaa
abaaaaaabkaabaaaabaaaaaadiaaaaahecaabaaaabaaaaaackaabaaaabaaaaaa
ckaabaaaabaaaaaadiaaaaahccaabaaaabaaaaaackaabaaaabaaaaaabkaabaaa
abaaaaaadcaaaaakbcaabaaaabaaaaaaakaabaaaabaaaaaabkaabaaaabaaaaaa
bkiacaaaaaaaaaaaacaaaaaadiaaaaaiocaabaaaabaaaaaaagaabaaaadaaaaaa
agijcaaaaaaaaaaaakaaaaaadiaaaaajbcaabaaaacaaaaaaakiacaaaaaaaaaaa
acaaaaaaakiacaaaaaaaaaaaacaaaaaadiaaaaahccaabaaaacaaaaaaakaabaaa
acaaaaaaakaabaaaacaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
ckaabaaaaaaaaaaadcaaaaajecaabaaaacaaaaaaakaabaaaacaaaaaaakaabaaa
acaaaaaaabeaaaaaaaaaialpdcaaaaajecaabaaaaaaaaaaackaabaaaaaaaaaaa
ckaabaaaacaaaaaaabeaaaaaaaaaiadpdiaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
abeaaaaanaapejeaaoaaaaahecaabaaaaaaaaaaabkaabaaaacaaaaaackaabaaa
aaaaaaaadiaaaaahccaabaaaacaaaaaaakaabaaaacaaaaaaabeaaaaaaaaaaadp
dcaaaaakbcaabaaaacaaaaaaakaabaiaebaaaaaaacaaaaaaabeaaaaaaaaaaadp
abeaaaaaaaaaiadpdcaaaaajecaabaaaacaaaaaaakaabaaaaaaaaaaaakaabaaa
acaaaaaabkaabaaaacaaaaaaaoaaaaakecaabaaaacaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpckaabaaaacaaaaaadcaaaaajccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaacaaaaaabkaabaaaacaaaaaaaoaaaaakccaabaaa
aaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpbkaabaaaaaaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaackaabaaaacaaaaaadiaaaaah
bcaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaabaaaaaaakaabaaaaaaaaaaadicaaaahbcaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakiacaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaacaaaaaajgahbaaa
abaaaaaaagaabaaaaaaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaaaaaaaaadiaaaaaipcaabaaaadaaaaaaegaobaaa
adaaaaaaegiocaaaaaaaaaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaapgapbaaa
aaaaaaaafgaobaaaabaaaaaadcaaaaajocaabaaaaaaaaaaaagajbaaaadaaaaaa
fgaobaaaaaaaaaaaagajbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaagaabaaa
aaaaaaaajgahbaaaabaaaaaajgahbaiaebaaaaaaaaaaaaaadcaaaaakhccabaaa
aaaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaaabaaaaaajgahbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaadkaabaaaadaaaaaadoaaaaab"
}
}
 }
}
Fallback "Diffuse"
}