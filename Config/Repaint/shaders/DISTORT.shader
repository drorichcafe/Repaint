// Compiled shader for PC, Mac & Linux Standalone, uncompressed size: 13.2KB

Shader "DISTORT" {
Properties {
 _Refraction ("Refraction", Range(0,1)) = 0.98
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 GrabPass {
  "_GrabTexture"
 }


 // Stats for Vertex shader:
 //       d3d11 : 14 math
 //    d3d11_9x : 14 math
 //        d3d9 : 16 math
 //      opengl : 16 math
 // Stats for Fragment shader:
 //       d3d11 : 14 math, 1 texture
 //    d3d11_9x : 14 math, 1 texture
 //        d3d9 : 19 math, 1 texture
 //      opengl : 17 math, 1 texture
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
Program "vp" {
SubProgram "opengl " {
// Stats: 16 math
Bind "vertex" Vertex
Bind "normal" Normal
Vector 9 [_ProjectionParams]
"!!ARBvp1.0
PARAM c[10] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.texture[0],
		program.local[9] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[9].x;
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[3].zw, R0;
DP4 result.texcoord[0].w, vertex.position, c[8];
DP4 result.texcoord[0].z, vertex.position, c[7];
DP4 result.texcoord[0].y, vertex.position, c[6];
DP4 result.texcoord[0].x, vertex.position, c[5];
DP3 result.texcoord[2].z, vertex.normal, c[3];
DP3 result.texcoord[2].y, vertex.normal, c[2];
DP3 result.texcoord[2].x, vertex.normal, c[1];
END
# 16 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 16 math
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_texture0]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
"vs_2_0
def c10, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c10.x
mul r1.y, r1, c8.x
mad oT3.xy, r1.z, c9.zwzw, r1
mov oPos, r0
mov oT3.zw, r0
dp4 oT0.w, v0, c7
dp4 oT0.z, v0, c6
dp4 oT0.y, v0, c5
dp4 oT0.x, v0, c4
dp3 oT2.z, v1, c2
dp3 oT2.y, v1, c1
dp3 oT2.x, v1, c0
"
}
SubProgram "d3d11 " {
// Stats: 14 math
Bind "vertex" Vertex
Bind "normal" Normal
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityPerDrawTexMatrices" 768
Matrix 512 [glstate_matrix_texture0]
BindCB  "UnityPerCamera" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityPerDrawTexMatrices" 2
"vs_4_0
eefiecedaocoboikndplhbihmlmkgononmdehnkbabaaaaaaomadaaaaadaaaaaa
cmaaaaaakaaaaaaaciabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
heaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaaheaaaaaaadaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklfdeieefclmacaaaaeaaaabaakpaaaaaafjaaaaaeegiocaaa
aaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaaeaaaaaafjaaaaaeegiocaaa
acaaaaaaceaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaacbaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaacaaaaaaa
agbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaccaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
abaaaaaaegiocaaaacaaaaaacdaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaa
diaaaaaihcaabaaaabaaaaaafgbfbaaaabaaaaaaegiccaaaabaaaaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaaaaaaaaaaagbabaaaabaaaaaa
egacbaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaabaaaaaaacaaaaaa
kgbkbaaaabaaaaaaegacbaaaabaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaa
adaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 14 math
Bind "vertex" Vertex
Bind "normal" Normal
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityPerDrawTexMatrices" 768
Matrix 512 [glstate_matrix_texture0]
BindCB  "UnityPerCamera" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityPerDrawTexMatrices" 2
"vs_4_0_level_9_1
eefiecedfkmigbbhnpdignaceniahacncjankkhmabaaaaaaliafaaaaaeaaaaaa
daaaaaaapiabaaaalmaeaaaadaafaaaaebgpgodjmaabaaaamaabaaaaaaacpopp
heabaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaafaa
abaaabaaaaaaaaaaabaaaaaaaeaaacaaaaaaaaaaacaacaaaaeaaagaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafakaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjaafaaaaadaaaaapia
aaaaffjaahaaoekaaeaaaaaeaaaaapiaagaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaaiaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapoaajaaoekaaaaappja
aaaaoeiaafaaaaadaaaaahiaabaaffjaadaaoekaaeaaaaaeaaaaahiaacaaoeka
abaaaajaaaaaoeiaaeaaaaaeabaaahoaaeaaoekaabaakkjaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaadaaoekaaeaaaaaeaaaaapiaacaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaafaaoeka
aaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaabaaaakaafaaaaadabaaaiia
abaaaaiaakaaaakaafaaaaadabaaafiaaaaapeiaakaaaakaacaaaaadacaaadoa
abaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeiappppaaaafdeieefclmacaaaa
eaaaabaakpaaaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaaaeaaaaaafjaaaaaeegiocaaaacaaaaaaceaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaabaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaa
abaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaacbaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaacaaaaaacaaaaaaaagbabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaccaaaaaakgbkbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpccabaaaabaaaaaaegiocaaaacaaaaaacdaaaaaa
pgbpbaaaaaaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaa
abaaaaaaegiccaaaabaaaaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
abaaaaaaaaaaaaaaagbabaaaabaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaa
acaaaaaaegiccaaaabaaaaaaacaaaaaakgbkbaaaabaaaaaaegacbaaaabaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaa
diaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaadpdgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaah
dccabaaaadaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheo
gmaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaafjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahahaaaagaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaafaepfdejfeejepeoaaeoepfc
enebemaafeeffiedepepfceeaaklklklepfdeheoiaaaaaaaaeaaaaaaaiaaaaaa
giaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaiaaaaheaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 17 math, 1 textures
Float 0 [_Refraction]
SetTexture 0 [_GrabTexture] 2D 0
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, -1, 1 } };
TEMP R0;
TEMP R1;
DP3 R0.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[2];
DP3 R0.z, R0, c[1].xxyw;
MAD R1.x, -R0.z, R0.z, c[1].z;
MUL R0.w, c[0].x, c[0].x;
MAD R0.w, -R0, R1.x, c[1].z;
ABS R1.x, R0.w;
RSQ R1.x, R1.x;
RCP R1.x, R1.x;
MAD R0.z, R0, c[0].x, -R1.x;
MUL R0.xy, R0.z, R0;
SLT R0.w, c[1].x, R0;
MUL R0.zw, R0.xyxy, R0.w;
RCP R0.x, fragment.texcoord[3].w;
MAD R0.xy, fragment.texcoord[3], R0.x, R0.zwzw;
TEX result.color, R0, texture[0], 2D;
END
# 17 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 19 math, 1 textures
Float 0 [_Refraction]
SetTexture 0 [_GrabTexture] 2D 0
"ps_2_0
dcl_2d s0
def c1, 0.00000000, -1.00000000, 1.00000000, 0
dcl t2.xyz
dcl t3.xyzw
dp3 r0.x, t2, t2
rsq r0.x, r0.x
mul r3.xyz, r0.x, t2
mov r0.z, c1.y
mov r0.xy, c1.x
dp3_pp r0.x, r3, r0
mad_pp r2.x, -r0, r0, c1.z
mul_pp r1.x, c0, c0
mad_pp r1.x, -r1, r2, c1.z
abs_pp r2.x, r1
rsq_pp r2.x, r2.x
rcp_pp r2.x, r2.x
mad_pp r2.x, r0, c0, -r2
cmp_pp r0.x, -r1, c1, c1.z
mul_pp r1.xy, r2.x, r3
mul_pp r1.xy, r1, r0.x
rcp r0.x, t3.w
mad r0.xy, t3, r0.x, r1
texld r0, r0, s0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 14 math, 1 textures
SetTexture 0 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 32
Float 16 [_Refraction]
BindCB  "$Globals" 0
"ps_4_0
eefieceddllgaofkliidpjbfggnignkpebdogalhabaaaaaabiadaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaheaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcciacaaaaeaaaaaaaikaaaaaafjaaaaaeegiocaaa
aaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaadiaaaaajbcaabaaaaaaaaaaaakiacaaa
aaaaaaaaabaaaaaaakiacaaaaaaaaaaaabaaaaaabaaaaaahccaabaaaaaaaaaaa
egbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaa
aaaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagbjbaaaacaaaaaa
dcaaaaakbcaabaaaabaaaaaadkaabaiaebaaaaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaiadpdcaaaaakbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
akaabaaaabaaaaaaabeaaaaaaaaaiadpelaaaaafbcaabaaaabaaaaaaakaabaaa
aaaaaaaabnaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaa
dcaaaaakicaabaaaaaaaaaaaakiacaaaaaaaaaaaabaaaaaadkaabaaaaaaaaaaa
akaabaaaabaaaaaadiaaaaahgcaabaaaaaaaaaaafgagbaaaaaaaaaaapgapbaaa
aaaaaaaadgaaaaaggcaabaaaaaaaaaaafgagbaiaebaaaaaaaaaaaaaaabaaaaah
dcaabaaaaaaaaaaajgafbaaaaaaaaaaaagaabaaaaaaaaaaaaoaaaaahmcaabaaa
aaaaaaaaagbebaaaadaaaaaapgbpbaaaadaaaaaaaaaaaaahdcaabaaaaaaaaaaa
egaabaaaaaaaaaaaogakbaaaaaaaaaaaefaaaaajpccabaaaaaaaaaaaegaabaaa
aaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 14 math, 1 textures
SetTexture 0 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 32
Float 16 [_Refraction]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedlepmenffgkodngkamjpbidgapmbkblbmabaaaaaaimaeaaaaaeaaaaaa
daaaaaaakaabaaaanaadaaaafiaeaaaaebgpgodjgiabaaaagiabaaaaaaacpppp
deabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaiadpaaaaaaaa
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaabaaahlabpaaaaacaaaaaaiaacaaapla
bpaaaaacaaaaaajaaaaiapkaafaaaaadaaaaaiiaaaaaaakaaaaaaakaceaaaaac
aaaaahiaabaaoelaaeaaaaaeabaaaiiaaaaakkiaaaaakkibabaaaakaaeaaaaae
aaaaaiiaaaaappiaabaappibabaaaakafiaaaaaeabaaabiaaaaappiaabaaaaka
abaaffkaafaaaaadaaaaaiiaaaaappiaabaaaaiaafaaaaadabaaabiaabaaaaia
aaaaaakaahaaaaacaaaaaiiaaaaappiaagaaaaacaaaaaiiaaaaappiaaeaaaaae
aaaaaeiaabaaaaiaaaaakkiaaaaappiaafaaaaadaaaacdiaaaaaoeiaaaaakkia
agaaaaacaaaaaeiaacaapplaaeaaaaaeaaaaadiaacaaoelaaaaakkiaaaaaoeib
ecaaaaadaaaacpiaaaaaoeiaaaaioekaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefcciacaaaaeaaaaaaaikaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaa
fkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacacaaaaaadiaaaaajbcaabaaaaaaaaaaaakiacaaaaaaaaaaaabaaaaaa
akiacaaaaaaaaaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaacaaaaaa
egbcbaaaacaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaah
ocaabaaaaaaaaaaafgafbaaaaaaaaaaaagbjbaaaacaaaaaadcaaaaakbcaabaaa
abaaaaaadkaabaiaebaaaaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadp
dcaaaaakbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaakaabaaaabaaaaaa
abeaaaaaaaaaiadpelaaaaafbcaabaaaabaaaaaaakaabaaaaaaaaaaabnaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaadcaaaaakicaabaaa
aaaaaaaaakiacaaaaaaaaaaaabaaaaaadkaabaaaaaaaaaaaakaabaaaabaaaaaa
diaaaaahgcaabaaaaaaaaaaafgagbaaaaaaaaaaapgapbaaaaaaaaaaadgaaaaag
gcaabaaaaaaaaaaafgagbaiaebaaaaaaaaaaaaaaabaaaaahdcaabaaaaaaaaaaa
jgafbaaaaaaaaaaaagaabaaaaaaaaaaaaoaaaaahmcaabaaaaaaaaaaaagbebaaa
adaaaaaapgbpbaaaadaaaaaaaaaaaaahdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
ogakbaaaaaaaaaaaefaaaaajpccabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadoaaaaabejfdeheoiaaaaaaaaeaaaaaaaiaaaaaa
giaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaaheaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
}