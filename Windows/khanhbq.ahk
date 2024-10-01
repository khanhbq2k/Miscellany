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

; Move mouse a little bit left
<#i::
CoordMode, Mouse, Screen
SysGet, VirtualWidth, 78
SysGet, VirtualHeight, 79
MouseGetPos, xpos, ypos, Window, ClassNN
MouseMove,(xpos - VirtualWidth/8),(VirtualHeight/2)
MouseGetPos, xpos2, ypos2, Window, ClassNN
WinActivate, ahk_id %Window%
return

; Move mouse a little bit right
<#o::
CoordMode, Mouse, Screen
SysGet, VirtualWidth, 78
SysGet, VirtualHeight, 79
MouseGetPos, xpos, ypos, Window, ClassNN
MouseMove,(xpos + VirtualWidth/8),(VirtualHeight/2)
MouseGetPos, xpos2, ypos2, Window, ClassNN
WinActivate, ahk_id %Window%
return

; Navigate shorcut in browsers
; #IfWinActive ahk_exe browser.exe
#If WinActive("ahk_exe browser.exe") or WinActive("ahk_exe msedge.exe")
<!j::
Send, ^+{Tab}
return

#If WinActive("ahk_exe browser.exe") or WinActive("ahk_exe msedge.exe")
<!k::
Send, ^{Tab}
return

#If WinActive("ahk_exe datagrip64.exe")
!+P::
    ; Get the dimensions of the active window
    WinGetPos, X, Y, Width, Height, A
    
    ; Calculate position 100px left and 100px down from the top-right corner
    TargetX := X + Width - 1300
    TargetY := Y + 115
    
    ; Move the mouse to the calculated position
    MouseMove, %TargetX%, %TargetY%
    
    ; Perform a left mouse click
    Click
    
    return
#If
