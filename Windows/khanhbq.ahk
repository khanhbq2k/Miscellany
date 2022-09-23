#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

<#W::WinMinimize, A
<#<+W::WinMaximize, A

; Change focus on other screen windows
<#k::
CoordMode, Mouse, Screen
SysGet, VirtualWidth, 78
SysGet, VirtualHeight, 79
MouseMove,(VirtualWidth*3/4),(VirtualHeight/2)
MouseGetPos, xpos, ypos, Window, ClassNN
WinActivate, ahk_id %Window%
return

; Change focus on other screen windows
<#j::
CoordMode, Mouse, Screen
SysGet, VirtualWidth, 78
SysGet, VirtualHeight, 79
MouseMove,(VirtualWidth/4),(VirtualHeight/2)
MouseGetPos, xpos, ypos, Window, ClassNN
WinActivate, ahk_id %Window%
return

; Manipulate screen brightness
<#0::
    GetBrightness := Monitor.GetBrightness()
    MsgBox % "Red:`t" GetBrightness.Red "`nGreen:`t" GetBrightness.Green "`nBlue:`t" GetBrightness.Blue
<#+1::Monitor.SetBrightness(128,128,128)
<#+2::Monitor.SetBrightness(100,100,100)
<#+3::Monitor.SetBrightness(85,85,85)
<#+4::Monitor.SetBrightness(70,70,70)
<#+5::Monitor.SetBrightness(45,45,45)
<#+6::Monitor.SetBrightness(25,25,25)