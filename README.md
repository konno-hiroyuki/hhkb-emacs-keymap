# HHKB/Emacs Keyboard Layout Switcher

英語配列キーボード（HHKB）と日本語配列キーボードを、**Windows の再起動なしで切り替えて使用するための AutoHotkey スクリプト**です。
リモートデスクトップ環境でも安定して動作し、Emacs キーバインドにも対応しています。

## 📝 背景

PCに **英語配列の外付けキーボード（Happy Hacking Keyboard）** を接続して使用しています。  
しかし、別のPC（日本語配列）から **リモートデスクトップ接続**して作業する場合に、以下の問題が発生していました。

- 英語配列と日本語配列では**記号位置の差が大きく**、打鍵したキーと出力される文字が一致せず操作が困難
- Windows の設定でキーボード配列を切り替えられるが、**反映には再起動が必要**
- リモートデスクトップからPCを再起動すると、**キーボード設定と実際の配列がずれる OS の不具合**も存在

## 🎯 解決策

そこで、**[AutoHotkey](https://www.autohotkey.com/)** を導入し、以下の課題をまとめて解決しました。

- ✔ キーボード配列（英語 ↔ 日本語）を再起動なしに即時に切り替え
- ✔ Emacs キーバインドを同時実現
- ✔ リモートデスクトップ環境でもキーボード配列のズレが発生しない

Emacs キーバインドについては、以下のサイトで公開されているものをベースにしています。(感謝)

- [AutoHotkey を使って Windows で Emacs キーバインド](https://github.com/oneh/autohotkey_emacs_keymap)

AutoHotKeyのコンパイラ（Ahk2Exe）によって生成したコンパイル済み実行ファイルも用意しました。

## 📂 ファイル構成

### AutoHotKey v2.0 用

```text
HHKBKeymap2.ahk     - HHKB Keymap（本体読み込み用）
hhkb2.ahk           - HHKB Keymap 定義ファイル（本体）
HHKBKeymap2.exe     - HHKB Keymap コンパイル済み実行ファイル

EmacsKeymap2.ahk    - Emacs Keymap（本体読み込み用）
emacs2.ahk          - Emacs Keymap 定義ファイル（本体）
EmacsKeymap2.exe    - Emacs Keymap コンパイル済み実行ファイル

HHKBKeymap.ico      - HHKB Keymap 用アイコン
EmacsKeymap.ico     - Emacs Keymap 用アイコン
README.md           - 本ファイル
```

## 🚀 使い方

### コンパイル済み実行ファイルを使用（推奨）

- `HHKBKeymap2.exe` または `EmacsKeymap2.exe` を実行

### AutoHotKey v2.0を使用

1. [AutoHotkey v2.0](https://www.autohotkey.com/download/ahk-v2.exe) をインストール
2. `HHKBKeymap2.ahk` または `EmacsKeymap2.ahk` を実行

## 🔧 カスタマイズ

- HHKB キーバインドでは、追加で以下のようなカスタマイズを行っています。
  - 右◇ → 半角/全角
  - 左◇ → Windowsキー
  - Ctrl + \\ → 半角/全角
- Emacs キーバインドでは、追加で以下のようなカスタマイズを行っています。
  - 変換 → 半角/全角
- `HHKBKeymap2.exe` と `EmacsKeymap2.exe` は、排他動作するようになっており、後から起動した方だけが有効になります。
- 特定のアプリ、ここでは xyzzy（`xyzzy.exe`）および TeraTerm（`ttermpro.exe`）では、Emacs キーバインドを無効にしています。
- その他、ご自由に `.ahk` を編集して配列やキーバインドを拡張・変更してください。

