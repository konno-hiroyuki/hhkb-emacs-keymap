#Requires AutoHotkey v2.0
#SingleInstance Force

; EmacsKeymap2.exeが実行中なら終了させる
if ProcessExist("EmacsKeymap2.exe") {
    ProcessClose("EmacsKeymap2.exe")
}

#UseHook

; 右◇ → 半角/全角
sc079::Send("{vkF3sc029}")  

; 左◇ (sc07B) → Windowsキー (LWin)
sc07B::Send("{vk5Bsc15B}")

; 左◇ + v → クリップボード履歴 (Windows + v)
sc07B & v:: {
    Send("{vk5Bsc15B down}{v down}")
    Send("{v up}{vk5Bsc15B up}")
}

; Ctrl + ] → 半角/全角
^]::Send("{vkF3sc029}")

; HHKBキーバインド
#Include "hhkb2.ahk"

; 対象外アプリの判定
#HotIf !WinActive("ahk_exe xyzzy.exe") && !WinActive("ahk_exe ttermpro.exe")

; Emacsキーバインド
#Include "emacs2.ahk"

#HotIf
