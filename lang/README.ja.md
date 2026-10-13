# MikuMikuDanceQuickLook
macOS用MikuMikuDance QuickLookプラグイン

> [!IMPORTANT]
> **MikuMikuDanceQuickLookの開発は終了しました。** 後継はMac App Storeの **[3D Quick Viewer](https://apps.apple.com/app/id6804688390)** です。[詳しくは下記](#3d-quick-viewerへの移行について)をご覧ください。

## 3D Quick Viewerへの移行について

2017年からMikuMikuDanceQuickLookを使ってくださった皆さま、ありがとうございました。

MikuMikuDanceQuickLookは`.qlgenerator`という古い形式のQuickLookプラグインです。macOS 10.15で後継のQuickLook拡張が用意され、macOS 12でこの形式のAPIは非推奨になり、macOS 15 Sequoiaからは読み込まれなくなりました。そこで、Appleが現在サポートしているQuickLook拡張の仕組みを使って、新しいアプリとして作り直しました。

### [3D Quick Viewer](https://apps.apple.com/app/id6804688390)

<a href="https://apps.apple.com/app/id6804688390"><img src="../3dquickviewer-ja.png" alt="3D Quick ViewerでQuickLook表示した3Dモデル" width="400"></a>

- **使い方は同じ:** Finderでファイルを選んでスペースキーを押すだけ。Finderのアイコンもモデルのサムネイルになります。
- **インストールが簡単:** Mac App Storeから入れて一度起動するだけ。ターミナルでの操作は要りません。
- **MMDの対応を強化:** .pmx / .pmdのトゥーン、スフィアマップ、輪郭線、表情、物理演算（モーション再生中は髪やスカートが揺れます）。モーション（.vmd）、ポーズ（.vpd）、MMDプロジェクト（.pmm）、アクセサリ（.x）も開けます。
- **ほかの形式も:** glTF、VRM、FBX、USD、STL、OBJ、3MFなど全22形式。
- **ビューアアプリとしても:** 軌道カメラと、頂点・材質・ボーン・モーフを確認できる情報欄。

**macOS 15以降**が必要です。**買い切りの有料アプリ**です。売り上げは、新しいmacOSへの対応を含む今後の開発に充てます。

### このリポジトリについて

- リポジトリは公開したままにします。ソースコードと過去のリリースは引き続き入手できます。
- 新しいリリースは出しません。Issueとプルリクエストへの対応も終了します。
- macOS 14以前のIntel Macでは、これまでどおり動作します。そのための手順は下に残してあります。

---

*ここから下は、macOS 14以前のために残しているMikuMikuDanceQuickLookの元の説明です。*

![ScreenShot](https://github.com/magicien/MikuMikuDanceQuickLook/blob/master/screenshot.png)

## 対応システム

- macOS 10.13 (High Sierra) 〜 macOS 14 (Sonoma)
- Intel Mac。配布しているビルドはIntel（x86_64）用のコードだけを含み、Appleシリコン搭載のMacでは動作を確認していません。
- macOS 15 (Sequoia) 以降では動作しません。[3D Quick Viewer](https://apps.apple.com/app/id6804688390)をお使いください。

## 対応ファイル形式

- .pmd (Polygon Model Data)
- .pmx (Polygon Model eXtended)
- .x (DirectX File)

## インストール方法

### 手動インストール

1. [Releases](https://github.com/magicien/MikuMikuDanceQuickLook/releases/latest)ページから最新の「**MikuMikuDanceQuickLook_vX.X.X.zip**」をダウンロードする
2. ZIPファイル中の「**MikuMikuDanceQuickLook.qlgenerator**」を `/Library/QuickLook` (全ユーザ用) か`~/Library/QuickLook` (使用中のユーザ用)にコピーする
3. ターミナルで`qlmanage -r`を実行してQuickLookプラグインの再読み込みをする

## アンインストール方法

3D Quick Viewerに切り替えたら、古いプラグインは削除できます。

1. `/Library/QuickLook` か `~/Library/QuickLook` から「**MikuMikuDanceQuickLook.qlgenerator**」を削除する
2. ターミナルで`qlmanage -r`を実行してQuickLookプラグインの再読み込みをする

## 関連リポジトリ

- [3D Quick Viewer](https://apps.apple.com/app/id6804688390) - このプラグインの後継。MMD、VRM、glTF、FBX、USD、STL、OBJなどに対応したQuickLook拡張つきの3Dビューア
- [MMDSceneKit](https://github.com/magicien/MMDSceneKit/)
