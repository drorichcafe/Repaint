# Repaint
マテリアル設定を上書きします。ゲーム実行時にコンフィグで定義したパラメータで上書きするので、オリジナルのデータを汚さずに見た目を変更することができます。

#### 固有概念の説明
| 名前 | 概要 |
|:-----|:-----|
| Matparam | 使用するシェーダーとパラメータが記述されたデータ |
| Bindset  | マテリアルとMatparamの結び付けが記述されたデータ |

#### フォルダの説明
| フォルダ名 | 概要 |
|:----|:----|
| materials | Matparamファイルを格納します |
| shaders | Shaderファイルを格納します |
| bindings | Bindsetファイルを格納します |

## チュートリアル
### I. Flavorの追加
Flavorを作成して設定環境を用意します
1. Config/Repaint/bindingsに`MyFlavor`フォルダを作成します
1. Config/Repaint/Repaint.xmlの `<Flavor>default</Flavor>` と書かれている箇所を `<Flavor>MyFlavor</Flavor>` に変更して上書き保存します
1. 作成した`MyFlavor`フォルダ内に下記内容を記述したテキストファイルを`hair.xml`というファイル名で保存します
```
<?xml version="1.0" encoding="utf-8"?>
<Bindset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <Bindings>
    <Binding>
      <Material>kayhair_hair</Material>
      <Keywords>
        <Keyword>hair</Keyword>
      </Keywords>
  </Bindings>
</Bindset>
```
1. ゲームを起動してキャラクターの見た目が確認できるシーンに移動します
1. 髪の毛のマテリアルが変化している事を確認してください

Flavorはマテリアル変更の一番大きな単位をあらわします。たとえばリアル調の見た目とトゥーン調の見た目を切り替えたい場合は、Real、Toonの2つのFlavorを用意しておくことで、切り替えを用意にできます

### II. 適用マテリアルの変更
先ほど`MyFlavor`内に作成した`hair.xml`ファイルを変更して髪の毛のマテリアルを変更します。

1. キャラクターを表示して髪の毛の見た目が確認できる状態にします
1. `hair.xml`の`<Material>kayhair_hair</Material>`と書かれている箇所を`<Material>ggxsss_gold</Material>`に変更して上書き保存します
1. Rボタンを押して設定をリロードします
1. 髪の毛の見た目が変更されたのを確認してください

適用するマテリアルは`Config/Repaint/materials`内にある好きなファイルを指定することができます
