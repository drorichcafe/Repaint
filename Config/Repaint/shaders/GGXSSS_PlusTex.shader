// Compiled shader for PC, Mac & Linux Standalone, uncompressed size: 19.0KB

Shader "GGXSSS_PlusTex" {
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
 _BumpMap ("Bump Map", 2D) = "bump" {}
 _BumpScale ("Bump Scale", Range(0,5)) = 1
 _SpecularMap ("Specular Map", 2D) = "white" {}
 _RoughnessMap ("Roughness Map", 2D) = "white" {}
 _RimMap ("Rim Map", 2D) = "white" {}
 _TranslucentMap ("Translucent Map", 2D) = "white" {}
 _FresnelMap ("Fresnel Map", 2D) = "white" {}
 _MetalnessMap ("Metalness Map", 2D) = "white" {}
 _AOMap ("AO Map", 2D) = "white" {}
}
SubShader { 
 LOD 200
 Tags { "LIGHTMODE"="ForwardBase" "QUEUE"="Geometry" "RenderType"="Opaque" }


 // Stats for Vertex shader:
 //       d3d11 : 20 math
 //    d3d11_9x : 20 math
 // Stats for Fragment shader:
 //       d3d11 : 94 math, 9 texture
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry" "RenderType"="Opaque" }
Program "vp" {
// Platform opengl had shader errors
//   <no keywords>
// Platform d3d9 had shader errors
//   <no keywords>
SubProgram "d3d11 " {
// Stats: 20 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "UnityPerCamera" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedmbpmgeofocjmececmgpohpcgljkplmapabaaaaaaniafaaaaadaaaaaa
cmaaaaaanmaaaaaajeabaaaaejfdeheokiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaijaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapahaaaajbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaakeaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaakeaaaaaaagaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcdmaeaaaaeaaaabaa
apabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaa
baaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaa
giaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
abaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhccabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaacaaaaaacgijcaaaabaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaacgijcaaaabaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaacgijcaaaabaaaaaaaoaaaaaakgbkbaaa
acaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaaabaaaaaa
jgiecaaaabaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaajgiecaaaabaaaaaa
amaaaaaaagbabaaaabaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaa
jgiecaaaabaaaaaaaoaaaaaakgbkbaaaabaaaaaaegacbaaaabaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
acaaaaaacgajbaaaaaaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
dgaaaaafcccabaaaadaaaaaaakaabaaaacaaaaaadgaaaaafbccabaaaadaaaaaa
ckaabaaaabaaaaaadgaaaaafeccabaaaadaaaaaabkaabaaaaaaaaaaadgaaaaaf
bccabaaaaeaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaaafaaaaaabkaabaaa
abaaaaaadgaaaaafeccabaaaaeaaaaaackaabaaaaaaaaaaadgaaaaafeccabaaa
afaaaaaaakaabaaaaaaaaaaadgaaaaafcccabaaaaeaaaaaabkaabaaaacaaaaaa
dgaaaaafcccabaaaafaaaaaackaabaaaacaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 20 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "UnityPerCamera" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedhmibjllimmhnhhkmnafhnppipggdbndiabaaaaaagiaiaaaaaeaaaaaa
daaaaaaalmacaaaaaaahaaaalaahaaaaebgpgodjieacaaaaieacaaaaaaacpopp
diacaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaaeaa
abaaabaaaaaaaaaaabaaaaaaaeaaacaaaaaaaaaaabaaamaaaeaaagaaaaaaaaaa
aaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaafaaaaadaaaaahia
aaaaffjaahaaoekaaeaaaaaeaaaaahiaagaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaahiaaiaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaappja
aaaaoeiaacaaaaadaaaaahiaaaaaoeibabaaoekaaiaaaaadaaaaaiiaaaaaoeia
aaaaoeiaahaaaaacaaaaaiiaaaaappiaafaaaaadabaaahoaaaaappiaaaaaoeia
afaaaaadaaaaapiaaaaaffjaadaaoekaaeaaaaaeaaaaapiaacaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaaeaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
afaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejaafaaaaadaaaaahia
abaaffjaahaamjkaaeaaaaaeaaaaahiaagaamjkaabaaaajaaaaaoeiaaeaaaaae
aaaaahiaaiaamjkaabaakkjaaaaaoeiaabaaaaacacaaaboaaaaakkiaafaaaaad
abaaahiaacaaffjaahaanckaaeaaaaaeabaaahiaagaanckaacaaaajaabaaoeia
aeaaaaaeabaaahiaaiaanckaacaakkjaabaaoeiaafaaaaadacaaahiaaaaaoeia
abaaoeiaaeaaaaaeacaaahiaabaanciaaaaamjiaacaaoeibabaaaaacacaaacoa
acaaaaiaabaaaaacacaaaeoaabaaffiaabaaaaacadaaaboaaaaaaaiaabaaaaac
aeaaaboaaaaaffiaabaaaaacadaaacoaacaaffiaabaaaaacaeaaacoaacaakkia
abaaaaacadaaaeoaabaakkiaabaaaaacaeaaaeoaabaaaaiappppaaaafdeieefc
dmaeaaaaeaaaabaaapabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaae
egiocaaaabaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhccabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaacaaaaaacgijcaaaabaaaaaa
anaaaaaadcaaaaakhcaabaaaaaaaaaaacgijcaaaabaaaaaaamaaaaaaagbabaaa
acaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaacgijcaaaabaaaaaa
aoaaaaaakgbkbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgbfbaaaabaaaaaajgiecaaaabaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaa
jgiecaaaabaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaabaaaaaajgiecaaaabaaaaaaaoaaaaaakgbkbaaaabaaaaaaegacbaaa
abaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaacaaaaaacgajbaaaaaaaaaaajgaebaaaabaaaaaaegacbaia
ebaaaaaaacaaaaaadgaaaaafcccabaaaadaaaaaaakaabaaaacaaaaaadgaaaaaf
bccabaaaadaaaaaackaabaaaabaaaaaadgaaaaafeccabaaaadaaaaaabkaabaaa
aaaaaaaadgaaaaafbccabaaaaeaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaa
afaaaaaabkaabaaaabaaaaaadgaaaaafeccabaaaaeaaaaaackaabaaaaaaaaaaa
dgaaaaafeccabaaaafaaaaaaakaabaaaaaaaaaaadgaaaaafcccabaaaaeaaaaaa
bkaabaaaacaaaaaadgaaaaafcccabaaaafaaaaaackaabaaaacaaaaaadoaaaaab
ejfdeheokiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaaijaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapahaaaa
jbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
keaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaagaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
}
Program "fp" {
// Platform opengl skipped due to earlier errors
// Platform d3d9 skipped due to earlier errors
// Platform opengl had shader errors
//   <no keywords>
// Platform d3d9 had shader errors
//   <no keywords>
// Platform d3d11_9x had shader errors
//   <no keywords>
SubProgram "d3d11 " {
// Stats: 94 math, 9 textures
SetTexture 0 [_BumpMap] 2D 1
SetTexture 1 [_RoughnessMap] 2D 3
SetTexture 2 [_FresnelMap] 2D 6
SetTexture 3 [_SpecularMap] 2D 2
SetTexture 4 [_Reflection] CUBE 9
SetTexture 5 [_MainTex] 2D 0
SetTexture 6 [_RimMap] 2D 4
SetTexture 7 [_TranslucentMap] 2D 5
SetTexture 8 [_MetalnessMap] 2D 7
SetTexture 9 [_AOMap] 2D 8
ConstBuffer "$Globals" 336
Vector 16 [_LightColor0]
Vector 48 [_Color]
Float 80 [_Roughness]
Float 84 [_F0]
Vector 96 [_RimColor]
Float 112 [_RimPower]
Float 116 [_RimShift]
Vector 128 [_TranslucentColor]
Float 144 [_TranslucentPower]
Float 148 [_TranslucentTilt]
Vector 160 [_SpecularColor] 3
Float 172 [_Metalness]
Vector 176 [_BumpMap_ST]
Float 192 [_BumpScale]
Vector 208 [_SpecularMap_ST]
Vector 224 [_RoughnessMap_ST]
Vector 240 [_RimMap_ST]
Vector 256 [_TranslucentMap_ST]
Vector 272 [_FresnelMap_ST]
Vector 288 [_MetalnessMap_ST]
Vector 304 [_AOMap_ST]
Float 320 [_LambertScale]
Float 324 [_LambertOffset]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedcajnlkoeoedeekgggpgcaggbabebjoibabaaaaaacabaaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
afaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaagaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcaaapaaaa
eaaaaaaamaadaaaafjaaaaaeegiocaaaaaaaaaaabfaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaaagaaaaaafkaaaaad
aagabaaaahaaaaaafkaaaaadaagabaaaaiaaaaaafkaaaaadaagabaaaajaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
fidaaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaa
fibiaaaeaahabaaaagaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaa
fibiaaaeaahabaaaaiaaaaaaffffaaaafibiaaaeaahabaaaajaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacahaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
acaaaaaaegbcbaaaacaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
baaaaaajccaabaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaaegiccaaaabaaaaaa
aaaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaaiocaabaaa
aaaaaaaafgafbaaaaaaaaaaaagijcaaaabaaaaaaaaaaaaaadcaaaaajhcaabaaa
abaaaaaaegbcbaaaacaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaaagaabaaaaaaaaaaaegbcbaaaacaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaabacaaaahbcaabaaaaaaaaaaajgahbaaaaaaaaaaaegacbaaaabaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaahicaabaaaabaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
icaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadkaabaaaabaaaaaadcaaaaaldcaabaaaadaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaabbaaaaaaogikcaaaaaaaaaaabbaaaaaa
efaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaacaaaaaaaagabaaa
agaaaaaadiaaaaaiicaabaaaabaaaaaaakaabaaaadaaaaaabkiacaaaaaaaaaaa
afaaaaaadcaaaaalicaabaaaacaaaaaabkiacaiaebaaaaaaaaaaaaaaafaaaaaa
akaabaaaadaaaaaaabeaaaaaaaaaiadpdcaaaaajbcaabaaaaaaaaaaadkaabaaa
acaaaaaaakaabaaaaaaaaaaadkaabaaaabaaaaaadcaaaaaldcaabaaaadaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaa
efaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaadgaaaaagbcaabaaaaeaaaaaaakiacaaaaaaaaaaaamaaaaaadgaaaaaf
ecaabaaaaeaaaaaaabeaaaaaaaaaiadpdiaaaaahhcaabaaaadaaaaaaegacbaaa
adaaaaaaagacbaaaaeaaaaaabaaaaaahbcaabaaaaeaaaaaaegbcbaaaadaaaaaa
egacbaaaadaaaaaabaaaaaahccaabaaaaeaaaaaaegbcbaaaaeaaaaaaegacbaaa
adaaaaaabaaaaaahecaabaaaaeaaaaaaegbcbaaaafaaaaaaegacbaaaadaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaa
abaaaaaaegacbaaaaeaaaaaabacaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaadaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaa
abaaaaaadcaaaaalgcaabaaaabaaaaaaagbbbaaaabaaaaaaagibcaaaaaaaaaaa
aoaaaaaakgilcaaaaaaaaaaaaoaaaaaaefaaaaajpcaabaaaaeaaaaaajgafbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaadaaaaaadiaaaaaiccaabaaaabaaaaaa
akaabaaaaeaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaahecaabaaaabaaaaaa
bkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaajicaabaaaabaaaaaackaabaaa
abaaaaaackaabaaaabaaaaaaabeaaaaaaaaaialpdcaaaaajbcaabaaaabaaaaaa
akaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahjcaabaaa
abaaaaaaagaibaaaabaaaaaaagaibaaaabaaaaaadiaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaabeaaaaanaapejeaaoaaaaahbcaabaaaabaaaaaadkaabaaa
abaaaaaaakaabaaaabaaaaaabacaaaahicaabaaaabaaaaaajgahbaaaaaaaaaaa
egacbaaaadaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaa
diaaaaahicaabaaaacaaaaaackaabaaaabaaaaaaabeaaaaaaaaaaadpdcaaaaak
ecaabaaaabaaaaaackaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaiadpdcaaaaajicaabaaaadaaaaaadkaabaaaabaaaaaackaabaaaabaaaaaa
dkaabaaaacaaaaaadccaaaalicaabaaaabaaaaaadkaabaaaabaaaaaaakiacaaa
aaaaaaaabeaaaaaabkiacaaaaaaaaaaabeaaaaaaaoaaaaakicaabaaaadaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpdkaabaaaadaaaaaabacaaaah
bcaabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadcaaaaajecaabaaa
abaaaaaaakaabaaaaeaaaaaackaabaaaabaaaaaadkaabaaaacaaaaaaaoaaaaak
ecaabaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpckaabaaa
abaaaaaadiaaaaahecaabaaaabaaaaaackaabaaaabaaaaaadkaabaaaadaaaaaa
dicaaaahbcaabaaaabaaaaaackaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaal
gcaabaaaaeaaaaaaagbbbaaaabaaaaaaagibcaaaaaaaaaaaanaaaaaakgilcaaa
aaaaaaaaanaaaaaaefaaaaajpcaabaaaafaaaaaajgafbaaaaeaaaaaaeghobaaa
adaaaaaaaagabaaaacaaaaaadiaaaaaiocaabaaaaeaaaaaaagajbaaaafaaaaaa
agijcaaaaaaaaaaaakaaaaaadiaaaaahhcaabaaaafaaaaaaagaabaaaabaaaaaa
jgahbaaaaeaaaaaabaaaaaaiecaabaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
egacbaaaadaaaaaaaaaaaaahecaabaaaabaaaaaackaabaaaabaaaaaackaabaaa
abaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaaadaaaaaakgakbaiaebaaaaaa
abaaaaaaegacbaiaebaaaaaaacaaaaaaeiaaaaalpcaabaaaadaaaaaaegacbaaa
adaaaaaaeghobaaaaeaaaaaaaagabaaaajaaaaaaabeaaaaaaaaaiaebdeaaaaah
ecaabaaaabaaaaaadkaabaaaabaaaaaaakaabaaaadaaaaaabacaaaahccaabaaa
aaaaaaaajgahbaaaaaaaaaaaegacbaaaacaaaaaacpaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaabkaabaaaabaaaaaaabeaaaaa
aaaamgecabeaaaaaaaaaiadpdiaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaa
abeaaaaaaaaahaebeiaaaaalpcaabaaaacaaaaaaegacbaaaacaaaaaaeghobaaa
aeaaaaaaaagabaaaajaaaaaadkaabaaaaaaaaaaaaoaaaaahecaabaaaaaaaaaaa
abeaaaaaaaaamiecckaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaackaabaaaaaaaaaaabjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
deaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaaacaaaaaadcaaaaak
ocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaakaaaaaaagajbaaa
afaaaaaaaaaaaaaiccaabaaaabaaaaaaakaabaiaebaaaaaaaeaaaaaaabeaaaaa
aaaaiadpcpaaaaaficaabaaaabaaaaaaakaabaaaaeaaaaaadiaaaaaiicaabaaa
abaaaaaadkaabaaaabaaaaaaakiacaaaaaaaaaaaajaaaaaabjaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaaaacaaaaiccaabaaaabaaaaaabkaabaaaabaaaaaa
bkiacaaaaaaaaaaaahaaaaaacpaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaa
diaaaaaiccaabaaaabaaaaaabkaabaaaabaaaaaaakiacaaaaaaaaaaaahaaaaaa
bjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaaldcaabaaaacaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaa
efaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaagaaaaaaaagabaaa
aeaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaa
agaaaaaadiaaaaahhcaabaaaacaaaaaafgafbaaaabaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaacaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaal
dcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaabaaaaaaaogikcaaa
aaaaaaaabaaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
ahaaaaaaaagabaaaafaaaaaaefaaaaajpcaabaaaafaaaaaaegbabaaaabaaaaaa
eghobaaaafaaaaaaaagabaaaaaaaaaaadiaaaaaipcaabaaaafaaaaaaegaobaaa
afaaaaaaegiocaaaaaaaaaaaadaaaaaadcaaaaamhcaabaaaagaaaaaaegiccaaa
aaaaaaaaaiaaaaaaegacbaaaafaaaaaaegiccaiaebaaaaaaaaaaaaaaaiaaaaaa
dcaaaaalhcaabaaaagaaaaaafgifcaaaaaaaaaaaajaaaaaaegacbaaaagaaaaaa
egiccaaaaaaaaaaaaiaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaa
egacbaaaagaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaa
adaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaa
dcaaaaajocaabaaaabaaaaaaagajbaaaafaaaaaakgakbaaaabaaaaaaagajbaaa
acaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaafaaaaaadcaaaaajhcaabaaa
abaaaaaajgahbaaaaeaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaaaaaaaaai
hcaabaaaaaaaaaaajgahbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaal
dcaabaaaacaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaabcaaaaaaogikcaaa
aaaaaaaabcaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaa
aiaaaaaaaagabaaaahaaaaaadiaaaaaiicaabaaaaaaaaaaaakaabaaaacaaaaaa
dkiacaaaaaaaaaaaakaaaaaadcaaaaajhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaabaaaaaadcaaaaaldcaabaaaabaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaabdaaaaaaogikcaaaaaaaaaaabdaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaajaaaaaaaagabaaaaiaaaaaa
diaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaagaabaaaabaaaaaadoaaaaab
"
}
}
 }
}
Fallback "Diffuse"
}