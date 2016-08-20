# Repaint
マテリアル設定を上書きします。ゲーム実行時にコンフィグで定義したパラメータで上書きするので、オリジナルのデータを汚さずに見た目を変更することができます。

#### 固有概念
| 名前 | 概要 |
|:-----|:-----|
| Matparam | 使用するシェーダーとパラメータが記述されたデータ |
| Bindset  | マテリアルとMatparamの結び付けが記述されたデータ |

#### フォルダ構成
| フォルダ名 | 概要 |
|:----|:----|
| materials | Matparamファイルを格納します |
| shaders | Shaderファイルを格納します |
| bindings | Bindsetファイルを格納します |
| textures | テクスチャファイルを格納します |

#### サンプルシェーダー
| シェーダー名   | 概要                                                   | パラメータの説明と記述例                             |
|:---------------|:-------------------------------------------------------|:-----------------------------------------------------|
| GGXSSS         | リアルなスペキュラ反射と簡易的な表面下散乱             | Config/Repaint/materials/_explain_ggxsss.xml         |
| GGXSSS_PlusTex | GGXSSSのパラメータ調整にテクスチャを使用するバージョン | Config/Repaint/materials/_explain_ggxsss_plustex.xml |
| KAYHAIR        | Kajiya-Kayモデルを使用したシェーダー                   | Config/Repaint/materials/_explain_kayhair.xml        |
| DISTORT        | ステルスメイ彩                                         | Config/Repaint/materials/_explain_distort.xml        |

## チュートリアル
### I. Flavorの追加

Flavorを作成して設定環境を用意します

1. *Config/Repaint/bindings* に *MyFlavor* フォルダを作成します
1. *Config/Repaint/Repaint.xml* の `<Flavor>default</Flavor>` と書かれている箇所を `<Flavor>MyFlavor</Flavor>` に変更して上書き保存します
1. 作成した *MyFlavor* フォルダ内に下記内容を記述したテキストファイルを *hair.xml* というファイル名で保存します
1. ゲームを起動してキャラクターの見た目が確認できるシーンに移動します
1. 髪の毛のマテリアルが変化している事を確認してください

hair.xml
```
<?xml version="1.0" encoding="utf-8"?>
<Bindset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <Bindings>
    <Binding>
      <Material>kayhair_hair</Material>
      <Keywords>
        <Keyword>hair</Keyword>
      </Keywords>
    </Binding>
  </Bindings>
</Bindset>
```

Flavorはマテリアル変更の一番大きな単位をあらわします。たとえばリアル調の見た目とトゥーン調の見た目を切り替えたい場合は、Real、Toonの2つのFlavorを用意しておくことで、切り替えを用意にできます

### II. 適用するMatparamの変更

先ほど *MyFlavor* フォルダ内に作成した *hair.xml* ファイルを変更して髪の毛のマテリアルを変更します。

1. キャラクターを表示して髪の毛の見た目が確認できる状態にします
1. *hair.xml* の`<Material>kayhair_hair</Material>`と書かれている箇所を`<Material>ggxsss_gold</Material>`に変更して上書き保存します
1. Rボタンを押して設定をリロードします
1. 髪の毛の見た目が変更されたのを確認してください

適用するマテリアルは`Config/Repaint/materials`内にある好きなファイルを指定することができます

### III. Bindingの修正

髪の毛のマテリアルが変更できたら、キャラクターの衣服を脱がしてみてください。マテリアル変更の結果が股間のあたりにあるオブジェクトにまで影響していませんか？これは *hair.xml* で指定したBindingのキーワード`<Keyword>hair</Keyword>`の検索に**underhair**というマテリアルが含まれてしまうことで起こっています（※Dキーを押すことでシーンに存在するマテリアルをコンソール出力することができます）。 *hair.xml* を下記のように修正して髪の毛だけ変更されるようにしましょう。

hair.xml
```
<?xml version="1.0" encoding="utf-8"?>
<Bindset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <Bindings>
    <Binding>
      <Material>kayhair_hair</Material>
      <Keywords>
        <Keyword>hair</Keyword>
      </Keywords>
      <Ignores>
        <Ignore>underhair</Ignore>
        <Ignore>chair</Ignore><!-- 椅子も検索に引っ掛かる -->
      </Ignores>
    </Binding>
  </Bindings>
</Bindset>
```

さて、Reptainプラグインは変更したマテリアルを覚えていないため、このまま **Rキーを押してリロードしても変更したマテリアルを元に戻すことはできません** 。こういった場合は、キャラクターやシーンを再読み込みして一度オリジナルのデータをロードしなおす必要があります。

### IV. Matparamの追加

次に、Matparamを追加する方法について説明します。執務室に戻ってください。ちょっと椅子がボロくないですか？私はもっとしっかりしてそうな椅子で仕事がしたいので、この椅子のマテリアルを作成してみることにします。

まずは *hair.xml* と同じ要領で、bindingデータを作成しておきましょう。*MyFlavor* フォルダ内に下記内容を記述したテキストファイルを *office.xml* というファイル名で保存します。

office.xml
```
<?xml version="1.0" encoding="utf-8"?>
<Bindset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <Bindings>
    <Binding>
      <Material>mychair</Material>
      <Transparent>false</Transparent>
      <Keywords>
        <Keyword>shitumurm_chair</Keyword><!-- Dキーでシーン内の椅子の名前を調べる -->
      </Keywords>
    </Binding>
  </Bindings>
</Bindset>
```

*mychair* というMatparamデータはmaterialsフォルダに存在しないので、このままではマテリアルは変更されません。早速下記の手順で *mychair* のデータを作成してみましょう。

1. materialsフォルダに移動
1. *_explain_ggxsss.xml* ファイルを同じフォルダにコピー＆ペーストする
1. コピーしたファイルの名前を *mychair.xml* に変更する

これでMatparamデータが準備できました。変化をわかりやすくするために、 *mychair.xml* を開いて一番下に書いてある `<Property><Name>_Metalness</Name><Type>Float</Type><Float>0</Float></Property>` の **0** の部分を **1** に書き換えて上書き保存しておきましょう。それでは、Rキーを押して見た目が変更されるのを確認してください。

Matparamは無事に追加できましたが、この椅子では仕事に集中できなさそうです。各項目の説明を見ながら、パラメータを調整して自分好みの見た目にしてみましょう。

mychair.xml パラメータ調整の例（見やすくするためにコメントは削除しています）
```
<?xml version="1.0" encoding="utf-8"?>
<Matparam xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <Shader>GGXSSS</Shader>
  <Properties>
    <Property><Name>_Color</Name><Type>Color</Type><Color><r>0.25</r><g>0.75</g><b>0.75</b><a>1</a></Color></Property>
    <Property><Name>_Roughness</Name><Type>Float</Type><Float>0.4</Float></Property>
    <Property><Name>_F0</Name><Type>Float</Type><Float>0.02</Float></Property>
    <Property><Name>_RimColor</Name><Type>Color</Type><Color><r>0.5</r><g>0.5</g><b>0.5</b></Color></Property>
    <Property><Name>_RimPower</Name><Type>Float</Type><Float>5</Float></Property>
    <Property><Name>_RimShift</Name><Type>Float</Type><Float>0</Float></Property>
    <Property><Name>_TranslucentColor</Name><Type>Color</Type><Color><r>0</r><g>0</g><b>0</b></Color></Property>
    <Property><Name>_TranslucentPower</Name><Type>Float</Type><Float>1</Float></Property>
    <Property><Name>_TranslucentTilt</Name><Type>Float</Type><Float>0</Float></Property>
    <Property><Name>_SpecularColor</Name><Type>Color</Type><Color><r>1</r><g>1</g><b>1.0</b></Color></Property>
    <Property><Name>_Metalness</Name><Type>Float</Type><Float>0.1</Float></Property>
  </Properties>
</Matparam>
```

机や棚の見た目も変えたいという人は *office.xml* にbindingを追加して、椅子と同じ要領でMatparamを作成してみてください。

office.xml
```
<?xml version="1.0" encoding="utf-8"?>
<Bindset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <Bindings>
    <!-- 椅子 -->
    <Binding>
      <Material>mychair</Material>
      <Transparent>false</Transparent>
      <Keywords>
        <Keyword>shitumurm_chair</Keyword>
      </Keywords>
    </Binding>
    <!-- 机と棚は同じマテリアルらしい -->
    <Binding>
      <Material>myfurniture</Material>
      <Transparent>false</Transparent>
      <Keywords>
        <Keyword>shitumurm_furniture</Keyword>
      </Keywords>
    </Binding>
  </Bindings>
</Bindset>
```

### V. シェーダーの追加

1. CM3D2と同じバージョンのUnityをインストールします (2016/08/20現時点では4.7.1)
1. UnityをDirectX11モードで起動します
1. Unityでシェーダーを作成します
1. シェーダーの inspector で show current ボタンを押してコンパイル済みのコードを表示します
1. コンパイル済みのコードを適当なテキストにペーストして shaders 以下に.shaderファイルとして保存します
1. Matparamファイルのshaderタグを追加したシェーダーのファイル名にするとシェーダーが適用されます
