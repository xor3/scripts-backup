;#include<Misc.au3>
; Press Esc to terminate script, Pause/Break to "pause"

; c_program_files = c:/Program Files
; d_program_files = d:/Program Files
; everything_path = %d_program_files%/Everything/Everything.exe
; youdaodict_path = %c_program_files%/Youdao/Dict4/YodaoDict.exe
; xuetr_path = %d_program_files%/Tools/XueTr/XueTr.exe
; cygwin_path = d:/cygwin/Cygwin
; emacs_path = %d_program_files%/emacs/bin/runemacs.exe

	;; xuetr_path=%D_PROGRAM_FILES_DIR%\Tools\XueTr\XueTr.exe
	;; total_commander_path=%D_PROGRAM_FILES_DIR%\Total Commander\TOTALCMD.EXE
	;; tor_path=%D_PROGRAM_FILES_DIR%\Vidalia Bundle\Vidalia\vidalia.exe
	;; evernote_path=%D_PROGRAM_FILES_DIR%\Evernote\Evernote\Evernote.exe
	;; everything_path=%D_PROGRAM_FILES_DIR%\Everything\Everything.exe
	;; foobar_path=%D_PROGRAM_FILES_DIR%\foobar2000\foobar2000.exe
	;; qq_path=%C_PROGRAM_FILES_DIR%\Tencent\QQ\Bin\QQ.exe
	;; youdao_path=%C_PROGRAM_FILES_DIR%\Youdao\Dict4\Rundict.exe
	;; ie_path=%C_PROGRAM_FILES_DIR%\Internet Explorer\iexplore.exe
	;; comodo_path=%D_PROGRAM_FILES_DIR%\COMODO\COMODO Internet Security\cfp.exe
	;; emacs_path=%D_PROGRAM_FILES_DIR%\emacs-23.3\bin\emacsclientw_exe.lnk
	;; antimalware_path=%D_PROGRAM_FILES_DIR%\Emsisoft Anti-Malware\a2start.exe
	;; truecrypt_path=%D_PROGRAM_FILES_DIR%\TrueCrypt\TrueCrypt.exe
	;; xnview_path=%D_PROGRAM_FILES_DIR%\XnView\xnview.exe
	;; irfanview_path=%D_PROGRAM_FILES_DIR%\IrfanViewPortable\IrFanViewPortable.exe

AutoItSetOption("WinDetectHiddenText", 1) 
Opt("WinTextMatchMode", 2)      ;1=完全匹配, 2=快速匹配


; Flag variable 'start/pause' the script
Global $Paused

$d_pro_files = 'D:/Program Files'
$au3_dir = $d_pro_files & "/autoit3"
$everything_path = $d_pro_files&"/Everything/Everything.exe"
; $xuetr_path = $d_pro_files& "/Tools/XueTr/XueTr.exe"
$xuetr_path = $d_pro_files& "/Tools/PCHunter_free/PCHunter32.exe"
$emacs_path = $d_pro_files& "/emacs/bin/runemacs.exe"
$hotkeys_dir = @ScriptDir
$scite_path = $au3_dir & "/SciTe/SciTe.exe"
$au3info_path = $au3_dir & "/Au3Info.exe"
$qq_path = $d_pro_files &"/Tencent/QQIntl/Bin/QQ.exe"
HotKeySet("#+e", "RunEverything")
HotKeySet("#+x", "RunXuetr")
HotKeySet("#o", "RunEmacs")
HotKeySet("#+s", "RunScite")
HotKeySet("#+i", "RunAu3Info")
HotKeySet("#+a", "OpenAu3Dir")
HotKeySet("#+q", "RunQQ")
HotKeySet("#+l", "ShowWinList")
HotKeySet("#+w", "GetCurWin")
HotKeySet("#+{PGUP}", "IncTrans")
HotKeySet("#+{PGDN}", "DecTrans")
HotKeySet("#{F12}", "SetOnTop")
HotKeySet("#+{F12}", "CancleSetOnTop")
; HotKeySet("{ESC}", "Terminate")
; {DOWN} -> Move down a menu
; HotKeySet("{PAUSE}", "TogglePause") 

;;;; Body of program would go here ;;;;
While 1
    Sleep(200)
    $curWin = WinGetText("");
	
	If WinExists("QQ International Today") Then
	   WinClose("QQ International Today")	
   EndIf
WEnd
;;;;;;;;


Func TogglePause()
    $Paused = Not $Paused
    While $Paused
        Sleep(100)
        ToolTip('Script is "Paused"', 2)
    WEnd
    ToolTip("")
EndFunc   ;==>TogglePause

Func RunEverything()
   Run($everything_path)
EndFunc


Func RunXuetr()
   $handle = WinGetHandle("[CLASS:#32770]","应用层不可访问")
;   WinList("[REGEXPCLASS:#\d+]")
   If WinExists("[CLASS:#32770]","应用层不可访问") Then
	  WinActivate("[CLASS:#32770]","应用层不可访问")
   ;;MsgBox(0,"debug", "" &WinGetText($handle))
	;; MsgBox(0,"winexist xuetr","xutr")
   Else
	  Run($xuetr_path)
;;	  MsgBox(0,"run","run")
   EndIf
EndFunc

Func RunEmacs()
   If WinExists("[CLASS:Emacs]") Then
	  WinActivate("[CLASS:Emacs]")
   Else
	  Run($emacs_path)
   EndIf
EndFunc
Func IsVisible($handle)
    If BitAND(WinGetState($handle), 2) Then
        Return 1
    Else
        Return 0
    EndIf

EndFunc   ;==>IsVisible

Func RunScite()
   If WinExists("{CLASS:SciTEWindow]") Then
	  WinActivate("[CLASS:SciTEWindow]" 
   Else
	  Run($scite_path)
   EndIf
EndFunc
Func RunAu3Info()
   Local $au3info_title = "AutoIt v3 Window"
   If WinExists($au3info_title) Then
	  WinActivate($au3info_title)
   Else
	  Run($au3info_path)
   EndIf
EndFunc

Func OpenAu3Dir()
   ;dbg("au3 dir is " & $au3_dir)
   ShellExecute($au3_dir)
EndFunc
; Terminate the demo
Func Terminate()
    Exit 0
EndFunc   ;==>Terminate

Func RunQQ()
    $class = "[CLASS:TXGuiFoundation]"
    If WinExists($class) Then
	WinActivate($class)
    Else
	Run($qq_path)
   EndIf
EndFunc

Func IncTrans()
   local $win = WinGetTitle("")
   WinSetTrans($win,"", 150)
EndFunc


Func DecTrans()
   local $win = WinGetTitle("")
   WinSetTrans($win,"", 255)
EndFunc

Func ShowWinList()
;Local $var = WinList("[REGEXPCLASS:#\d+]")
;Local $var = WinList("[CLASS:#32770]")
Local $var = WinList()
For $i = 1 To $var[0][0]
  ; 只显示带有标题的可见窗口
    If $var[$i][0] <> "" And IsVisible($var[$i][1]) Then
        MsgBox(0, "详细信息", "标题=" & $var[$i][0] & @LF & "句柄=" & $var[$i][1])
		;MsgBox(0, "","文本"&WinGetText($var[$i][1]))
    EndIf
Next
EndFunc

Func SetOnTop()
   local $win = WinGetTitle("")
   WinSetOnTop($win,"", 1);
EndFunc

Func CancelSetOnTop()
   local $win = WinGetTitle("")
   WinSetOnTop($win,"", 0);
EndFunc


Func GetCurWin()
   local $win = WinGetTitle("")
   MsgBox(0, "Current Window", $win)
EndFunc
Func dbg($msg)
    DllCall("kernel32.dll", "none", "OutputDebugString", "str", $msg)
EndFunc
