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

## チュートリアル
### I. Flavorの追加

Flavorを作成して設定環境を用意します

1. *Config/Repaint/bindings* に *MyFlavor* フォルダを作成します
1. *Config/Repaint/Repaint.xml* の `<Flavor>default</Flavor>` と書かれている箇所を `<Flavor>MyFlavor</Flavor>` に変更して上書き保存します
1. 作成した`MyFlavor`フォルダ内に下記内容を記述したテキストファイルを *hair.xml* というファイル名で保存します
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

さて、このまま**Rキーを押してリロードしても変更したマテリアルを元に戻すことはできません
**。検索条件が変更されてしまうと、変更したマテリアルがわからなくなってしまうためです。こういった場合は、キャラクターやシーンを再読み込みすれば最新の状態に反映されます。

### IV. Matparamの追加
Comming soon

### V. シェーダーの追加
Comming soon
