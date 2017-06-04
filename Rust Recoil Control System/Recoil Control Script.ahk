; Rust Recoil Control System | GUI Version | By Weeke
;
; Use Sensitivity 0.90, and 800 dpi
; To run the script you must download http://www.autohotkey.com/

#NoEnv
#SingleInstance Force

SetBatchLines, -1

SetWorkingDir %A_ScriptDir%

; GUI Design
Gui Show, x600 y325 w481 h381, Rust Recoil Control System
Gui, Color, blue
Gui, Font, caqua

; GUI Group Box
Gui Add, GroupBox, x3 y-1 w475 h354 +0x7, Weapons

; GUI Buttons
Gui Add, Button, vReload gReload x1 y357 w80 h23, Reload
Gui Add, Button, vExit gExit x81 y357 w80 h23, Exit
Gui Add, Button, vCrosshairToggle gCrosshairToggle x161 y357 w80 h23, Crosshair
Gui Add, Button, vTaskBarToggle gTaskBarToggle x241 y357 w100 h23, TaskBar Toggle

; GUI Radio Buttons
Gui Add, Radio, vThompson gThompson  x8 y18 w120 h23, Thompson
Gui Add, Radio, vSemiRifleNoAttachments gSemiRifleNoAttachments x8 y43 w120 h23, Semi-Rifle No Attachments
Gui Add, Radio, vSemiRifle4xScope gSemiRifle4xScope x8 y69 w120 h23, Semi-Rifle 4x Scope
Gui Add, Radio, vSemiRifleSilenced gSemiRifleSilenced x8 y95 w120 h23, Semi-Rifle Silenced
Gui Add, Radio, vAK47NoAttachments gAK47NoAttachments x8 y120 w120 h23, Ak47 No Attachments
Gui Add, Radio, vM249 gM249 x8 y144 w120 h23, M249
Gui Add, Radio, vAK474xScope gAK474xScope x8 y168 w120 h23, AK47 4x Scope
Gui Add, Radio, vLR300 gLR300 x8 y192 w120 h23, LR-300
Gui Add, Radio, vMP5 gMP5 x8 y216 w120 h23, MP5
Gui Add, Radio, vAK47Laser gAK47Laser x8 y240 w120 h23, Ak47 Laser
Gui Add, Radio, vp250NoAttachments gp250NoAttachments x8 y287 w120 h23, p250 No Attachments
Gui Add, Radio, vAutofire gAutofire x8 y266, Auto Fire
Gui Add, Radio, vSemiRifleHolo gSemiRifleHolo x8 y309 w120 h23, Semi-Rifle Holo Sight
Gui Add, Radio, vakSilencer gakSilencer x150 y18, Ak47 Silencer
Gui Add, Radio, vakSilencerLaser gakSilencerLaser x150 y36, Ak47 Silencer and Laser
Gui Add, Radio, vDisableAll gDisableAll x150 y50 w120 h23, Disable All

Return

; Global Variables
_thompson := false
_semiNoAttachments := false
_semi4x := false
_semiSilenced := false
_ak47NoAttachments := false
_m249 := false
_auto := false
_lr300 := false
_ak474x := false
_akLaser := false
_akSilencer := false
_akSilencerLaser := false
_mp5 := false
_p250 := false
_semiHolo := false

; Configurations
    ; Crosshair Config						
        ;crsLocation 	:= "Cross.png"
        ;crsHeight 	:= "10"
        ;crsWidth 	:= "10"
        ;invsColor	:= "ffffff"
        ;locCompensator	:= "4"	
        ;locX		:= "960"
        ;locY		:= "540"
        ; -----------------------------------------------------------
        ;diflocX := locX - locCompensator
        ;diflocY := locY - locCompensator
        ;setCross = 0

; HotKeys
Insert::
    Gui % (MainGui:=!MainGui) ? "Hide" : "Show"

Delete::
    _auto := ! _auto
    
; Labels
Autofire:
    _auto := ! _auto
    return
    
Reload:
    Reload
    return
    
Exit:
    ExitApp
    return
    
CrosshairToggle:
    If _CrosshairToggle := ! _CrosshairToggle
        Loop
        {
            ;Config						
            crsLocation 	:= "Cross.png"
            crsHeight 	:= "7"
            crsWidth 	:= "7"
            invsColor	:= "ffffff"
            locCompensator	:= "4"	
            locX		:= "960"
            locY		:= "540"
            ;End of config
  
            diflocX := locX - locCompensator
            diflocY := locY - locCompensator
            setCross = 0
            
            ~XButton2::
                if (setCross = 0) {
                    Gui, chscript: New
                    Gui, Add, Picture, x0 y0 h%crsHeight% w%crsWidth%, %crsLocation%
                    Gui +LastFound +AlwaysOnTop -Caption +ToolWindow +E0x00000020
                    Gui, Show, x%diflocX% y%diflocY% h%crsHeight% w%crsWidth%
	
                    ; original middle of screen = 960 540 
                    Gui, Color, %invsColor%
                    WinSet, TransColor, %invsColor%
	
                    setCross = 1;
                }
                else {
                    Gui, chscript: Destroy
                    setCross = 0	
                }	
                Return
        }
	Return
Return
	
TaskBarToggle:
	If _TaskBarToggle := ! _TaskBarToggle
		WinHide ahk_class Shell_TrayWnd
	else
		WinShow ahk_class Shell_TrayWnd
	Return

Thompson:
    _thompson := ! _thompson
    return
    
SemiRifleNoAttachments:
    _semiNoAttachments := ! _semiNoAttachments
    return
    
SemiRifleHolo:
    _semiHolo := ! _semiHolo
    return

SemiRifle4xScope:
    _semi4x := ! _semi4x
    return
    
SemiRifleSilenced:
    _semiSilenced := ! _semiSilenced
    return

AK47NoAttachments:
    _ak47NoAttachments := ! _ak47NoAttachments
    return
    
akSilencer:
    _akSilencer := ! _akSilencer
    return
    
akSilencerLaser:
    _akSilencerLaser := ! _akSilencerLaser
    return

M249:
    _m249 := ! _m249
    return

AK474xScope:
    _ak474x := ! _ak474x
    return

LR300:
    _lr300 := !_lr300
    return

MP5:
    _mp5 := ! _mp5
    return

AK47Laser:
    _akLaser := ! _akLaser
    return
    
p250NoAttachments:
    _p250 := ! _p250
    return

DisableAll:
    _thompson := false
    _semiNoAttachments := false
    _semi4x := false
    _semiSilenced := false
    _ak47NoAttachments := false
    _m249 := false
    _auto := false
    _lr300 := false
    _ak474x := false
    _akLaser := false
    _akSilencer := false
    _akSilencerLaser := false
    _mp5 := false
    _p250 := false
    _semiHolo := false
    
    return

~LButton::
	If (_auto = true) {
		autofire()
	}

~RButton & ~LButton::
    If (_semiNoAttachments = true) {
        semi_noatt() ; semi-rifle or p250
    }
    else
        If (_semi4x = true) {
            semi_4times()
        }
        else
            If (_semiSilenced = true) {
                semi_silenced()
            }
            else
                If (_ak47NoAttachments = true) {
                    ak47()
                }
                else
                    If (_m249 = true) {
                        m249()
                    }
					else
						If (_lr300 = true) {
							lr300()
						}
						else
							If (_mp5 = true) {
								mp5()
							}
							else
								If (_ak474x = true) {
									ak474x()
								}
                                else
                                    If (_p250 = true) {
                                        p250()
                                    }
                                    else
                                        If (_semiHolo = true) {
                                            semiHolo()
                                        }
                                        else
                                            If (_akSilencer = true) {
                                                akSilencer()
                                            }
                                            else
                                                If (_akSilencerLaser = true) {
                                                    akSilencerLaser()
                                                }
                                
~LCtrl & ~LButton::
    If (_thompson = true) {
        thompson()
    }
    else      
        If (_semiNoAttachments = true) {       
            semi_noatt() ; semi-rifle or p250
        }
        else
            If (_semi4x = true) {
                semi_4times()
            }
            else
                If (_semiSilenced = true) {
                    semi_silenced()
                }
                else
                    If (_ak47NoAttachments = true) {
                        ak47()
                    }
                    else
                        If (_m249 = true) {
                            m249()
                        }
						else
							If (_lr300 = true) {
								lr300()
							}
							else
								If (_mp5 = true) {
									mp5()
								}
								else
									If (_ak474x = true) {
										ak474x()
									}
									else
										If (_akLaser = true) {
											akLaser()
										}
										else
											If (_auto = true) {
												autofire()
											}
                                            else
                                                If (_p250 = true) {
                                                    p250()
                                                }
                                                else
                                                    If (_semiHolo = true) {
                                                        semiHolo()
                                                    }
                                                    else
                                                        If (_akSilencer = true) {
                                                            akSilencer()
                                                        }
                                                        else
                                                            If (_akSilencerLaser = true) {
                                                                akSilencerLaser()
                                                            }

; Functions
thompson()
{
    global _thompson

    If _thompson 
    {
        Loop
        {
            If GetKeyState("LCtrl", "LButton")
            {
                Sleep, 6
                    Y( moveAmount, 1.38 )
                    X( moveAmount, 0.35 )
                    X( moveAmount, -0.4 )
            }
            
            If Not GetKeyState( "LButton" ) 
            {
                Break
            }
        }
    }
}

semi_noatt()
{
    global _semiNoAttachments
    
    If _semiNoAttachments
    {
        Loop
        {
            If GetKeyState("LCtrl", "LButton")
            {
                Sleep, 51.3
                    Y(moveAmount, 9.82)
                    X(moveAmount, -5.82)
                    X( moveAmount, 4.95 )
            }
			else
				If GetKeyState("RButton", "LButton")
				{
					Sleep, 54
						Y(moveAmount, 18.5)
						X(moveAmount, -3.8)
						X(moveAmount, 2)
				}
			
				If Not GetKeyState( "LButton" ) 
				{
                    Break
                }
        }
    }
}

semiHolo()
{
    global _semiHolo
    
    If _semiHolo
    {
        Loop
        {
            If GetKeyState("LCtrl", "LButton")
            {
                Sleep, 51.3
                    Y(moveAmount, 9.82)
                    X(moveAmount, -5.82)
                    X( moveAmount, 4.95 )
            }
			else
				If GetKeyState("RButton", "LButton")
				{
					Sleep, 54
						Y(moveAmount, 18.5)
						X(moveAmount, -3.8)
						X(moveAmount, 2)
				}
			
				If Not GetKeyState( "LButton" ) 
				{
                    Break
                }
        }
    }
}

semi_4times()
{
    global _semi4x
    
    If _semi4x
    {
        Loop
        {
            If GetKeyState("LCtrl", "LButton")
            {
                Sleep, 64
                    Y( moveAmount, 48 )
            }
            else
                If GetKeyState("RButton", "LButton")
                {
                    Sleep, 64
					Y( moveAmount, 72 )
                }
                
                If Not GetKeyState( "LButton" ) 
                {
                    Break
                }
        }
    }
}

semi_silenced()
{
    global _semiSilenced
    
    If _semiSilenced
    {
        Loop
        {
            If GetKeyState("LCtrl", "LButton")
            {
               Sleep, 64
                    Y( moveAmount, 9 )
                    X( moveAmount, -6 )
                    X( moveAmount, 3.1)
            }
            else
                If GetKeyState("RButton", "LButton")
                {
                    Sleep, 64
                        Y( moveAmount, 15.9 )
                        X( moveAmount, -6 )
                        X( moveAmount, 2 )
                }
                
                If Not GetKeyState( "LButton" ) 
                {
                    Break
                }
        }
    }
}

ak47()
{
    global _ak47NoAttachments
    
    If _ak47NoAttachments
    {
        Loop
        {
            If GetKeyState("LCtrl", "LButton")
            {
                Sleep, 1
                    Y( moveAmount, 2.8 )
                    X( moveAmount, -0.1 )
            }
			else
				If GetKeyState("RButton", "LButton")
				{
					Sleep, 1
						Y( moveAmount, 4 )
                        X( moveAmount, -0.1 )
				}
                
                If Not GetKeyState( "LButton" ) 
                {
                    Break
                }
        }
    }
}

akLaser()
{
	global _akLaser
    
    If _akLaser
    {
        Loop
        {
            If GetKeyState("LCtrl", "LButton")
            {
                Sleep, 1
                    moveAmount := (moveAmount = 2) ? 1 : 0
                    mouseXY(moveAmount, 2.5)
            }
            else
                If GetKeyState("RButton", "LButton")
                {
                    Sleep, 1
                        Y( moveAmount, 4 )
                        X( moveAmount, -0.1 )
                }
			
            If Not GetKeyState("LButton")
            {
                break
            }
		}
	}
}

akSilencer()
{
	global _akSilencer
    
    If _akSilencer
    {
        Loop
        {
            If GetKeyState("LCtrl", "LButton")
            {
                Sleep, 1
                    Y( moveAmount, 2 )
                    X( moveAmount, -0.1105 )
            }
            else
                If GetKeyState("RButton", "LButton")
                {
                    Sleep, 1
                        Y( moveAmount, 3.563 )
                        X( moveAmount, -0.1 )
                }
			
            If Not GetKeyState("LButton")
            {
                break
            }
		}
	}
}

akSilencerLaser()
{
	global _akSilencerLaser
    
    If _akSilencerLaser
    {
        Loop
        {
            If GetKeyState("LCtrl", "LButton")
            {
                Sleep, 1
                    moveAmount := (moveAmount = 2) ? 1 : 0
                    mouseXY(moveAmount, 2)
                    Y( moveAmount, -0.175 )
            }
            else
                If GetKeyState("RButton", "LButton")
                {
                    Sleep, 1
                        Y( moveAmount, 4 )
                        X( moveAmount, -0.1 )
                }
			
            If Not GetKeyState("LButton")
            {
                break
            }
		}
	}
}

ak474x()
{
    global _ak474x
    
    If _ak474x
    {
        Loop
        {
            If GetKeyState("LCtrl", "LButton")
            {
                Sleep, 1
                    Y( moveAmount, 8 )
            }
			else
				If GetKeyState("RButton", "LButton")
				{
					Sleep, 1
						Y( moveAmount, 15 )
						X( moveAmount, 1 )
				}
                
                If Not GetKeyState( "LButton" ) 
                {
                    Break
                }
        }
    }
}

m249()
{
    global _m249
    
    If _m249
    {
        Loop
        {
            If GetKeyState("LCtrl", "LButton")
            {
			Sleep, 1
				Y( moveAmount, 3.505 )
                X( moveAmount, -1.03 )
                X( moveAmount, 1 )
            }
            else
                If GetKeyState("RButton", "LButton")
                {
                    Sleep, 1
                        Y( moveAmount, 6 )
                        X( moveAmount, -3 )
                        X( moveAmount, 3.5 )
                }
                
                If Not GetKeyState( "LButton" ) 
                {
                    Break
                }
        }
    }
}

autofire()
{
	global _auto
	
	If _auto
	{
		Loop
		{	
			If GetKeyState("LButton", "P")
			{
				SendInput {LButton DownTemp}
					Sleep 1
						Y( moveAmount, 17.4 )
						X(moveAmount, -6 )
					Sleep 1
				
				SendInput {LButton Up}
					Sleep 25
			}
			else
				Break
		}
	}
}

lr300()
{
    global _lr300
    
    If _lr300
    {
        Loop
        {
            If GetKeyState("LCtrl", "LButton")
            {
                Sleep, 1
                    Y( moveAmount, 2.48 )
                    X( moveAmount, 0 )
                    X( moveAmount, 0)
            }
            else
                If GetKeyState("RButton", "LButton")
                {
                    Sleep, 1
                        Y( moveAmount, 4.9 )
                        X( moveAmount, -0.4 )
                        X( moveAmount, 0.5 )
                }
                
                If Not GetKeyState( "LButton" ) 
                {
                    Break
                }

        }
    }
}

mp5()
{
    global _mp5
    
    If _mp5
    {
        Loop
        {
            If GetKeyState("LCtrl", "LButton")
            {
                Sleep, 1
                    Y( moveAmount, 1.2 )
            }
            else
                If GetKeyState("RButton", "LButton")
                {
                    Sleep, 1
                        Y( moveAmount, 3 )
                        X( moveAmount, -1.4 )
                        X( moveAmount, 1 )
                }
                
                If Not GetKeyState( "LButton" ) 
                {
                    Break
                }
        }
    }
}

p250()
{
    global _p250
    
    If _p250
    {
        Loop
        {
            If GetKeyState("LCtrl", "LButton")
            {
                Sleep, 1
                    Y( moveAmount, 3.5 )
            }
            else
                If GetKeyState("RButton", "LButton")
                {
                    Sleep, 1
                        Y( moveAmount, 6 )
                }
                
                If Not GetKeyState( "LButton" ) 
                {
                    Break
                }
        }
    }
}

mouseXY( x, y )
{
    DllCall( "mouse_event", int, 1, int, x, int, y, uint, 0, uint, 0 )
}

Y( a, y ) ; Value with a minus sign - move the mouse up.
{         ; Value without a minus sign - move the mouse down.
    DllCall( "mouse_event", int, 1, int, x, int, y, uint, 0, uint, 0 )
}

X( b, x ) ; Value with a minus sign - move the mouse to the left.
{         ; Value without a minus sign - move the mouse to the right.
    DllCall( "mouse_event", int, 1, int, x, int, y, uint, 0, uint, 0 )
}
