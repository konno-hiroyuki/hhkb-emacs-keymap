#Requires AutoHotkey v2.0
#SingleInstance Force

; HHKBKeymap2.exeが実行中なら終了させる
if ProcessExist("HHKBKeymap2.exe") {
    ProcessClose("HHKBKeymap2.exe")
}

#UseHook

; 変換 → 半角/全角
sc079::Send("{vkF3sc029}")

; Emacsキーバインドの対象外アプリを判定
#HotIf !WinActive("ahk_exe xyzzy.exe") && !WinActive("ahk_exe ttermpro.exe")

; Emacsキーバインド設定をインクルード
#Include "emacs2.ahk"

#HotIf
