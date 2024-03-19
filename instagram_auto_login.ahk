; Author: Harshwardhan Patil
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force  ; Ensures only one instance of the script is running.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; Prompt the user for a PIN using a GUI
Gui, Add, Text, x12 y12 w150 h20 , Enter PIN:
Gui, Add, Edit, x12 y32 w150 h20 vPINPassword Password, 

; Add OK and Cancel buttons
Gui, Add, Button, x12 y62 w70 h30 Default, OK
Gui, Add, Button, x92 y62 w70 h30, Cancel

; Set GUI options
Gui, Show, w180 h110, PIN Input
return

; Button actions
ButtonOK:
    Gui, Submit
    PIN := PINPassword
    Gui, Destroy  ; Close GUI window
    ; Verify the PIN
    if (PIN = "create a pin") { ; create a PIN to secure the code

        ; Open Chrome in incognito mode
        Run, chrome.exe --incognito

        ; Wait for Chrome to open (adjust the delay as needed)
        Sleep, 3000

        ; Navigate to Instagram login page
        Send, https://www.instagram.com/accounts/login{Enter}

        ; Wait for the page to load (adjust the delay as needed)
        Sleep, 5000

        ; Fill in username and password (replace "username" and "password" with actual credentials)
        Send, {Tab}{Tab}username{Tab}password{Enter}

        ExitApp
    }
    else {
        MsgBox, Wrong Pin. ; Closes the app
        ExitApp
    }
return

ButtonCancel:
    Gui, Destroy  ; Close GUI window
    ExitApp
return
