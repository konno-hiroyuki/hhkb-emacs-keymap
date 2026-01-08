; HHKB 英語配列 Keymap (AutoHotKey v2.0用)

; 数字キーの記号 (Shift + 数字)
+2::Send("@")           ; Shift + 2 → @
+6::Send("{^}")         ; Shift + 6 → ^
+7::Send("&")           ; Shift + 7 → &
+8::Send("*")           ; Shift + 8 → *
+9::Send("(")           ; Shift + 9 → (
+0::Send(")")           ; Shift + 0 → )

; 右上の記号類
-::Send("-")            ; そのまま
+-::Send("_")           ; Shift + - → _
^::Send("=")            ; ^ → =
+^::Send("{+}")         ; Shift + ^ → +
]::Send("\")            ; ] → \
+vkF4::Send("~")        ; Shift + 半角/全角 → ~

; Returnキー周り
@::Send("[")            ; @ → [
+@::Send("{{}")         ; Shift + @ → {
[::Send("]")            ; [ → ]
+[::Send("{}}")         ; Shift + [ → }
+]::Send("|")           ; Shift + ] → |

; セミコロン・コロン・引用符
+;::Send(":")           ; Shift + ; → :
:::Send("'")            ; : → '
*::Send('{"}')          ; Shift + : (つまり *) → "
vkF4::Send("``")        ; 半角/全角 → `

