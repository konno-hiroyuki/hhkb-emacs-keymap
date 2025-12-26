; Emacs keymap (AutoHotKey V2мя)

InstallKeybdHook()
#UseHook
SetKeyDelay(0)
SetTitleMatchMode(2)

global m_Mark := 0

m_IsEnabled() {
    m_IgnoreList := ["Emacs", "Vim", "mintty"]
    for element in m_IgnoreList {
        if WinActive("ahk_class " . element)
            return 0
    }
    if WinActive("ahk_class ConsoleWindowClass") {
        if WinActive("ahk_exe bash.exe")
            return 0
    }
    return 1
}

m_IsMSExcel() {
    return WinActive("ahk_class XLMAIN")
}

m_IsGoogleSheets() {
    if WinActive("ahk_class MozillaWindowClass")
        return 1
    if WinActive("Google Sheets ahk_class Chrome_WidgetWin_1")
        return 1
    return 0
}

m_IsMSWord() {
    return WinActive("ahk_class OpusApp")
}

m_EnableControlCPrefix() {
    return
}

m_EnableControlXPrefix() {
    return
}

m_EnableControlQPrefix() {
    return
}

m_FindFile() {
    Send("^o")
    global m_Mark := 0
}

m_SaveBuffer() {
    Send("^s")
    global m_Mark := 0
}

m_WriteFile() {
    Send("!fa")
    global m_Mark := 0
}

m_KillBuffer() {
    m_KillEmacs()
}

m_KillEmacs() {
    Send("!{F4}")
    global m_Mark := 0
}

m_ForwardChar() {
    global m_Mark
    Send(m_Mark ? "+{Right}" : "{Right}")
}

m_BackwardChar() {
    global m_Mark
    Send(m_Mark ? "+{Left}" : "{Left}")
}

m_NextLine() {
    global m_Mark
    Send(m_Mark ? "+{Down}" : "{Down}")
}

m_PreviousLine() {
    global m_Mark
    Send(m_Mark ? "+{Up}" : "{Up}")
}

m_ForwardWord() {
    global m_Mark
    Loop 5
        Send(m_Mark ? "+{Right}" : "{Right}")
}

m_BackwardWord() {
    global m_Mark
    Loop 5
        Send(m_Mark ? "+{Left}" : "{Left}")
}

m_MoreNextLines() {
    global m_Mark
    Loop 5
        Send(m_Mark ? "+{Down}" : "{Down}")
}

m_MorePreviousLines() {
    global m_Mark
    Loop 5
        Send(m_Mark ? "+{Up}" : "{Up}")
}

m_MoveBeginningOfLine() {
    global m_Mark
    Send(m_Mark ? "+{Home}" : "{Home}")
}

m_MoveEndOfLine() {
    global m_Mark
    Send(m_Mark ? "+{End}" : "{End}")
}

m_ScrollDown() {
    global m_Mark
    Send(m_Mark ? "+{PgDn}" : "{PgDn}")
}

m_ScrollUp() {
    global m_Mark
    Send(m_Mark ? "+{PgUp}" : "{PgUp}")
}

m_BeginningOfBuffer() {
    global m_Mark
    Send(m_Mark ? "^+{Home}" : "^{Home}")
}

m_EndOfBuffer() {
    global m_Mark
    Send(m_Mark ? "^+{End}" : "^{End}")
}

m_SetMarkCommand() {
    global m_Mark
    if (m_Mark) {
        m_Mark := 0
        m_ForwardChar()
        m_BackwardChar()
        m_Mark := 1
    } else {
        m_Mark := 1
    }
}

m_MarkWholeBuffer() {
    Send("^{End}^+{Home}")
    global m_Mark := 1
}

m_MarkPage() {
    m_MarkWholeBuffer()
}

m_DeleteChar() {
    Send("{Del}")
    global m_Mark := 0
}

m_DeleteBackwardChar() {
    Send("{BS}")
    global m_Mark := 0
}

m_KillLine() {
    if (m_IsMSWord()) {
        Send("+{End}+{Left}^x")
    } else {
        Send("+{End}^x")
    }
    global m_Mark := 0
}

m_KillRegion() {
    Send("^x")
    global m_Mark := 0
}

m_KillRingSave() {
    Send("^c")
    global m_Mark := 0
}

m_Yank() {
    Send("^v")
    global m_Mark := 0
}

m_ISearchForward() {
    Send("^f")
    global m_Mark := 0
}

m_ISearchBackward() {
    m_ISearchForward()
}

m_Undo() {
    Send("^z")
    global m_Mark := 0
}

m_KeyboardQuit() {
    Send("{Esc}")
    global m_Mark := 0
}

m_ToggleInputMethod() {
    Send("{vkF3sc029}")
    global m_Mark := 0
}

m_NewLine() {
    Send("{Enter}")
    global m_Mark := 0
}

m_OpenLine() {
    Send("{Enter}{Up}")
    global m_Mark := 0
}

m_IndentForTabCommand() {
    Send("{Tab}")
    global m_Mark := 0
}

m_TransposeChars() {
    m_SetMarkCommand()
    m_ForwardChar()
    m_KillRegion()
    m_BackwardChar()
    m_Yank()
}

m_RawSelectAll() {
    Send(A_ThisHotkey)
}

m_RawNewWindow() {
    Send(A_ThisHotkey)
}

m_RawPrintBuffer() {
    Send(A_ThisHotkey)
}

^Space:: {
    if (m_IsEnabled())
        m_SetMarkCommand()
    else
        Send("{CtrlDown}{Space}{CtrlUp}")
}

^/:: {
    if (m_IsEnabled())
        m_Undo()
    else
        Send(A_ThisHotkey)
}

!<:: {
    if (m_IsEnabled())
        m_BeginningOfBuffer()
    else
        Send(A_ThisHotkey)
}

!>:: {
    if (m_IsEnabled())
        m_EndOfBuffer()
    else
        Send(A_ThisHotkey)
}

^\:: {
    if (m_IsEnabled())
        m_ToggleInputMethod()
    else
        Send(A_ThisHotkey)
}

a:: {
    if (m_IsMSExcel() || m_IsGoogleSheets()) {
        if (A_PriorHotkey = "^c")
            Send("{F2}")
        else
            Send(A_ThisHotkey)
    } else {
        Send(A_ThisHotkey)
    }
}

^a:: {
    if (m_IsEnabled()) {
        if (A_PriorHotkey = "^q")
            m_RawSelectAll()
        else
            m_MoveBeginningOfLine()
    } else {
        Send(A_ThisHotkey)
    }
}

^b:: {
    if (m_IsEnabled())
        m_BackwardChar()
    else
        Send(A_ThisHotkey)
}

!b:: {
    if (m_IsEnabled())
        m_BackwardWord()
    else
        Send(A_ThisHotkey)
}

^c:: {
    if (m_IsEnabled()) {
        if (A_PriorHotkey = "^x")
            m_KillEmacs()
        else if (m_IsMSExcel() || m_IsGoogleSheets())
            m_EnableControlCPrefix()
        else
            Send(A_ThisHotkey)
    } else {
        Send(A_ThisHotkey)
    }
}

^d:: {
    if (m_IsEnabled())
        m_DeleteChar()
    else
        Send(A_ThisHotkey)
}

^e:: {
    if (m_IsEnabled())
        m_MoveEndOfLine()
    else
        Send(A_ThisHotkey)
}

^f:: {
    if (m_IsEnabled()) {
        if (A_PriorHotkey = "^x")
            m_FindFile()
        else
            m_ForwardChar()
    } else {
        Send(A_ThisHotkey)
    }
}

!f:: {
    if (m_IsEnabled())
        m_ForwardWord()
    else
        Send(A_ThisHotkey)
}

^g:: {
    if (m_IsEnabled())
        m_KeyboardQuit()
    else
        Send(A_ThisHotkey)
}

h:: {
    if (m_IsEnabled()) {
        if (A_PriorHotkey = "^x")
            m_MarkWholeBuffer()
        else
            Send(A_ThisHotkey)
    } else {
        Send(A_ThisHotkey)
    }
}

^h:: {
    if (m_IsEnabled())
        m_DeleteBackwardChar()
    else
        Send(A_ThisHotkey)
}

i:: {
    if (m_IsMSExcel() || m_IsGoogleSheets()) {
        if (A_PriorHotkey = "^c")
            Send("{F2}{Home}")
        else
            Send(A_ThisHotkey)
    } else {
        Send(A_ThisHotkey)
    }
}

^j:: {
    if (m_IsEnabled()) {
        if (A_PriorHotkey = "^x")
            m_ToggleInputMethod()
        else
            m_NewLine()
    } else {
        Send(A_ThisHotkey)
    }
}

k:: {
    if (m_IsEnabled()) {
        if (A_PriorHotkey = "^x")
            m_KillBuffer()
        else
            Send(A_ThisHotkey)
    } else {
        Send(A_ThisHotkey)
    }
}

^k:: {
    if (m_IsEnabled())
        m_KillLine()
    else
        Send(A_ThisHotkey)
}

^m:: {
    if (m_IsEnabled())
        m_NewLine()
    else
        Send(A_ThisHotkey)
}

^n:: {
    if (m_IsEnabled()) {
        if (A_PriorHotkey = "^q")
            m_RawNewWindow()
        else
            m_NextLine()
    } else {
        Send(A_ThisHotkey)
    }
}

!n:: {
    if (m_IsEnabled())
        m_MoreNextLines()
    else
        Send(A_ThisHotkey)
}

^o:: {
    if (m_IsEnabled())
        m_OpenLine()
    else
        Send(A_ThisHotkey)
}

^p:: {
    if (m_IsEnabled()) {
        if (A_PriorHotkey = "^x")
            m_MarkPage()
        else if (A_PriorHotkey = "^q")
            m_RawPrintBuffer()
        else
            m_PreviousLine()
    } else {
        Send(A_ThisHotkey)
    }
}

!p:: {
    if (m_IsEnabled())
        m_MorePreviousLines()
    else
        Send(A_ThisHotkey)
}

^q:: {
    if (m_IsEnabled())
        m_EnableControlQPrefix()
    else
        Send(A_ThisHotkey)
}

^r:: {
    if (m_IsEnabled())
        m_ISearchBackward()
    else
        Send(A_ThisHotkey)
}

^s:: {
    if (m_IsEnabled()) {
        if (A_PriorHotkey = "^x")
            m_SaveBuffer()
        else
            m_ISearchForward()
    } else {
        Send(A_ThisHotkey)
    }
}

^t:: {
    if (m_IsEnabled())
        m_TransposeChars()
    else
        Send(A_ThisHotkey)
}

u:: {
    if (m_IsEnabled()) {
        if (A_PriorHotkey = "^x")
            m_Undo()
        else
            Send(A_ThisHotkey)
    } else {
        Send(A_ThisHotkey)
    }
}

^v:: {
    if (m_IsEnabled())
        m_ScrollDown()
    else
        Send(A_ThisHotkey)
}

!v:: {
    if (m_IsEnabled())
        m_ScrollUp()
    else
        Send(A_ThisHotkey)
}

^w:: {
    if (m_IsEnabled()) {
        if (A_PriorHotkey = "^x")
            m_WriteFile()
        else
            m_KillRegion()
    } else {
        Send(A_ThisHotkey)
    }
}

!w:: {
    if (m_IsEnabled())
        m_KillRingSave()
    else
        Send(A_ThisHotkey)
}

^x:: {
    if (m_IsEnabled())
        m_EnableControlXPrefix()
    else
        Send(A_ThisHotkey)
}

^y:: {
    if (m_IsEnabled())
        m_Yank()
    else
        Send(A_ThisHotkey)
}

^!q::Suspend(-1)

^!z:: {
    if (m_IsEnabled())
        MsgBox("AutoHotkey emacs keymap is Enabled.")
    else
        MsgBox("AutoHotkey emacs keymap is Disabled.")
}

