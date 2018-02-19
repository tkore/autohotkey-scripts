; CTRL+ALT+L - Open my localhost directory
^!L::
Run d:\xampp\htdocs
return

; CTRL+ALT+D - Open desktop directory
^!D::
Run c:\Users\%computername%\Desktop
return

; CTRL+ALT+X - Run Cmder
^!X::
Run C:\cmder\Cmder.exe
return

; --- For keyboards without media controls ---
; CTRL+F3 - Play/Pause music
^F3::
Send {Media_Play_Pause}
return

; CTRL+F8 - Previous track
^F8::
Send {Media_Prev}
return

; CTRL+F9 - Next track
^F9::
Send {Media_Next}
return

; CTRL+F10 - Volume down
^F10::setVolume("-5")

; CTRL+F11 - Volume up
^F11::setVolume("+5")

; CTRL+F1 - Mute
^F1::Send {VOLUME_MUTE}

; function for controlling the volume
SetVolume(whatvolume){
    soundset, %whatvolume%
    soundplay, *-1
}

; Alt+tilde - Move window from current monitor to the next (replace 'Right' with 'Left' to change the direction).
; To make it run properly, make sure your keyboard is using the English layout when enabling the script
!`::
Send {LWin down}{LShift down}{Right down}
Sleep 0 ; Yes, this is necessary
Send {LWin up}{LShift up}{Right up}
return

; Type /shrug and you'll get ¯\_(ツ)_/¯
::/shrug::
    SendInput, ¯\_(ツ)_/¯
return

; Facepalm emoji, WhatsApp only
::/facepalm::
    SendInput, 🤦🏻‍♂
return

; Ponder emoji, WhatsApp only
::/ponder::
    SendInput, 🤔
return

; "lol" emoji. Facebook & WhatsApp
::/rofl::
    IfWinActive, WhatsApp
    {
        SendInput, 🤣
    } else {
        SendInput, 😂
    }
return

; Take a wild guess
::/poop::
    SendInput, 💩
return

; Sad face. WhatsApp only
::/sad::
    IfWinActive, WhatsApp
    {
        SendInput, ☹
    }
return

; Metal. WhatsApp only
::/metal::
    SendInput, 🤘🏻😎🤘🏻
return

; Up to no good :P
::/:P::
    SendInput, 😜
return

; Some audio tweaks. Use NirSoft's nircmdc.exe (get from http://www.nirsoft.net/utils/nircmd.html)
; Switch audio output between speakers and headset
^!R::
    if device != 'headset'
    {
        Run "nircmdc.exe" "setdefaultsounddevice" "Headset Earphone" "0" , , Hide
        Run "nircmdc.exe" "setdefaultsounddevice" "Headset Earphone" "1" , , Hide
        Run "nircmdc.exe" "setdefaultsounddevice" "Headset Earphone" "2" , , Hide
        device = 'headset'
    } else {
        Run "nircmdc.exe" "setdefaultsounddevice" "Speakers" "0" , , Hide
        Run "nircmdc.exe" "setdefaultsounddevice" "Speakers" "1" , , Hide
        Run "nircmdc.exe" "setdefaultsounddevice" "Speakers" "2" , , Hide
        device = 'speakers'
    }
return

; Toggle microphone volume between 0 and 50
^!E::
    IfEqual, muted, true
    {
        Run "nircmdc.exe" "setsysvolume" "33000" "Headset Microphone" , , Hide
        muted = false
        TrayTip, Microphone status, Unmuted
    } else {
        Run "nircmdc.exe" "setsysvolume" "0" "Headset Microphone" , , Hide
        muted = true
        TrayTip, Microphone status, Muted
    }
return