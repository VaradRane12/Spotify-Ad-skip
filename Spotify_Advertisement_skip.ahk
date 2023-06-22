Loop{
Sleep,1000
DetectHiddenWindows, On     ;Detect Spotify even if it's minimized
SetTitleMatchMode, 3    ;Checking for equal title from the statement below
WinGetTitle, Var, Advertisement ahk_exe Spotify.exe ahk_class Chrome_WidgetWin_0    ;Getting title of spotify 
if(Var == "Advertisement")  ;Checking for if Title of Spotify is "Advertisement
{
        Process, Close,Spotify.exe  ;Closeing Spotify
        Sleep, 100
        Run, Spotify path  ;Running Spot from the defined directory 
        Sleep, 500
		WinActivate, ahk_exe Spotify.exe    ;Activating Spotify (like maximizing)
		Loop{   ;Loop for making sure if song is playing 
        Sleep, 1000
        IfWinActive, ahk_exe Spotify.exe 
		{
         Sleep,500
         Send,^{Right}  ;Skipping song as it loads the same which was playing before the restart
         Sleep,200
         WinMinimize,A    ;Minimizing Active Window
         SetTitleMatchMode,2    ;Title matchmode for checking if the title from the below statement exists in Spotify title
         WinGetTitle, var, - ahk_exe Spotify.exe ahk_class Chrome_WidgetWin_0   ;Getting title which contains "-" in it 
         if(var == "Spotify Free")  ;Checking if spot has autoplayed 
        {
         Sleep,500
         WinActivate, ahk_exe Spotify.exe
         Sleep, 1000
         Send,^{Right}          ; Looping the same statements as above for playing song
         Sleep,600
         WinMinimize,A
         Sleep, 400
        }
        else if(var != "Spotify Free")  ;executes if autoplay has worked and then breaks out of the loop
        {
                Sleep, 10000
                 Process, Close, ahk_class Chrome_SystemMessageWindow ahk_exe Spotify.exe
                 Sleep, 100
                 Process, Close, ahk_class GDI+ Hook Window Class ahk_exe Spotify.exe
                 SLeep, 100
                 Process,Close, ahk_class crashpad_SessionEndWatcher
                 SLeep, 100
                break
        }
        
        }
        else
        {
                WinActivate, ahk_exe Spotify.exeWinActivate, ahk_exe Spotify.exe    ;Activating Spotify if the if before wasn't able to activate Spotify 
        }
        
	}
}
}