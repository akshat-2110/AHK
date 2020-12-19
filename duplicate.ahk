#SingleInstance,Forces

Ctrl & d:: ; Ctrl + Shift + d
    if GetKeyState("Shift") ; Check if Shift is pressed
    {
        #IfWinNotActive ahk_exe Code.exe ; Run everywhere except on vscode
            Duplicate()
    }
    Else
    {
        Send ^d
    }
return

Duplicate()
{
    selection := GetSelection()
    if !selection ; if anything is not selected, then copy-paste line
        CopyPasteLine()
    Else
        Send {Right}%selection% ; else paste selection on right
}

CopyPasteLine()
{
    SetKeyDelay, -1
    Clipboard := "" ; Clear clipboard for ClipWait to function.
    Send {End}+{home}^c ; Copy entire line
    ClipWait, 2 ; Wait for data to fill clipboard
    Send {End}{Enter}%Clipboard% ; Paste Clipboard in next line
}

GetSelection(timeoutSeconds := 0.5)
{
    Clipboard := "" ; Clear clipboard for ClipWait to function.
    Send ^c ; Send Ctrl+C to get selection on clipboard.
    ClipWait %timeoutSeconds% ; Wait for the copied text to arrive at the clipboard. 
return Clipboard
}