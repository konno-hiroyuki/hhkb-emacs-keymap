# Keyboard Layout Switcher with AutoHotkey
英語配列キーボード（HHKB）と日本語配列キーボードを、**Windows の再起動なしで切り替えて使用するための AutoHotkey スクリプト**です。
リモートデスクトップ環境でも安定して動作し、Emacs キーバインドにも対応しています。

## 📝 背景
PCに **英語配列の外付けキーボード（Happy Hacking Keyboard）** を接続して使用しています。
しかし、別のPC（日本語配列）から **リモートデスクトップ接続**して作業する場合に、
以下の問題が発生しました。

- 英語配列と日本語配列では**記号位置の差が大きく**、打鍵したキーと出力される文字が一致せず操作が困難
- Windows の設定でキーボード配列を切り替えられるが、**反映には再起動が必要**
- リモートデスクトップからPCを再起動すると、**設定と実際の配列がずれる OS の不具合**も存在

## 🎯 解決策
そこで、**[AutoHotkey](https://www.autohotkey.com/)** を導入し、以下の課題をまとめて解決しました。

- ✔ キーボード配列の入れ替え（英語 ↔ 日本語）を即時切り替え
- ✔ リモートデスクトップ環境でも配列のズレが発生しない
- ✔ Emacs キーバインドの同時実現

AutoHotKeyのコンパイラ（Ahk2Exe）によって生成した実行ファイルも用意しました。

## 📂 ファイル構成

### AutoHotKey v2.0 用（推奨）
```
HHKBKeymap2.ahk     - HHKB Keymap（本体読み込み用）
hhkb2.ahk           - HHKB Keymap 定義ファイル（本体）
HHKBKeymap2.exe     - HHKB Keymap コンパイル済み実行ファイル

EmacsKeymap2.ahk    - Emacs Keymap（本体読み込み用）
emacs2.ahk          - Emacs Keymap 定義ファイル（本体）
EmacsKeymap2.exe    - Emacs Keymap コンパイル済み実行ファイル
```

### AutoHotKey v1.1 用
```
HHKBKeymap.ahk      - HHKB Keymap 定義ファイル
HHKBKeymap.exe      - HHKB Keymap コンパイル済み実行ファイル
EmacsKeymap.ahk     - Emacs Keymap 定義ファイル
EmacsKeymap.exe     - Emacs Keymap コンパイル済み実行ファイル
```

### 共通
```
HHKBKeymap.ico      - HHKB 用アイコン
EmacsKeymap.ico     - Emacs 用アイコン
README.md           - 本ファイル
```

## 🚀 使い方
### コンパイル済み実行ファイルを使用（推奨）
- `HHKBKeymap2.exe` または `EmacsKeymap2.exe` を実行

### AutoHotKey v2.0を使用
1. [AutoHotkey v2.0](https://www.autohotkey.com/download/ahk-v2.exe) をインストール
2. `HHKBKeymap2.ahk` または `EmacsKeymap2.ahk` を実行

### AutoHotKey v1.1を使用
1. [AutoHotkey v1.1](https://www.autohotkey.com/download/ahk-install.exe) をインストール
2. `HHKBKeymap.ahk` または `EmacsKeymap.ahk` を実行

## 🔧 カスタマイズ
- HHKB用には、以下のようなカスタマイズを行っています。
  - 右◇ → 半角/全角
  - 左◇ → Windowsキー
  - Ctrl + \\ → 半角/全角
- Emacs用には、以下のようなカスタマイズを行っています。
  - 変換 → 半角/全角
- xyzzy および TeraTerm では、Emacs キーバインドを無効にします。
- その他、自由に `.ahk` を編集して配列やキーバインドを拡張・変更できます。
