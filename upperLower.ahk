#Include %A_ScriptDir%\common\editor.ahk


#SingleInstance,Force
SendMode Input
SetWorkingDir, %A_ScriptDir%


#If GetKeyState("Capslock", "P")

$Up:: ; Convert text to upper
    selection := GetSelection()
    StringUpper selection, selection
    Send %selection%
    SetStoreCapsLockMode Off
    return

$Down:: ; Convert text to lower
    selection := GetSelection()
    StringLower selection, selection
    Send %selection%
    SetStoreCapsLockMode Off
    return

Up & Down:: ; Convert text to capitalized
    selection := GetSelection()
    StringUpper selection, selection, T
    Send %selection%
