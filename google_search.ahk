#SingleInstance,Force

^+x::
{
	Send, ^c
    ClipWait, 5 ; Wait for data to fill clipboard
	if ErrorLevel
	{
		MsgBox, The attempt to copy text onto the clipboard failed.
		MsgBox, clipboard = %clipboard%
		return
	}
	Run, http://www.google.com/search?q=%clipboard%
	Return
}
