#Region ;**** ���������� AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_outfile_type=a3x
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <GUIConstants.au3>

Opt("TrayMenuMode", 1)
Opt("WinTitleMatchMode", 2)
Opt("GUICloseOnESC", 0)

$xianshi = TrayCreateItem("��ʾ����")
TrayCreateItem("")
$zhiding = TrayCreateItem("�ö�   F8")
$qxzhiding = TrayCreateItem("ȡ���ö� F9")
TrayCreateItem("")
$guanyu = TrayCreateItem("����")
TrayCreateItem("")
$_exit = TrayCreateItem("�˳�")
TraySetState()

Dim $i = 1, $bck, $dqck = "1", $ck, $dqtmd, $cftmd

HotKeySet("", "zhiding");;�ö�
HotKeySet("", "qxzhiding");;ȡ���ö�
HotKeySet("!1", "tmd");;��ȫ͸��
HotKeySet("!2", "tmd");;��͸��
HotKeySet("!3", "tmd");;��͸��
HotKeySet("!4", "zjtm");;���ٲ�͸��
HotKeySet("!5", "jstm");;���Ӳ�͸��

GUICreate("�ö���͸��", 420, 200, 100, 200)
$slider1 = GUICtrlCreateSlider(10, 70, 400, 40)
GUICtrlSetLimit(-1, 255, 0)
$Label1 = GUICtrlCreateLabel("����һ��Ҫ�����Ĵ���", 40, 35, 360, 35)
GUICtrlSetColor(-1, 0x0000FF)
$Label2 = GUICtrlCreateLabel("�������ڣ�", 15, 15, 100, 17)
$Label3 = GUICtrlCreateLabel("Alt+1��ȫ͸��   " & @TAB & @TAB & "Alt+2��͸��     " & @TAB & @TAB & " Alt+3��͸��", 20, 112, 380, 17)
GUICtrlSetColor(-1, 0x806080)
$Label4 = GUICtrlCreateLabel('Alt+"4" ����͸����         Alt+"5" ���Ӳ�͸����', 50, 130, 350, 17)
GUICtrlSetColor(-1, 0xFF0000)
$button1 = GUICtrlCreateButton("��     ��   (F8)", 50, 150, 130, 30)
$button2 = GUICtrlCreateButton("ȡ���ö�   (F9)", 230, 150, 130, 30)
GUISetState()
GUICtrlSetData($slider1, 255)     ; set cursor
WinSetOnTop(WinGetTitle(""), "", $i)
$bck = WinGetTitle("")
While 1
     $msg = TrayGetMsg()
     $nMsg = GUIGetMsg()    
     If $nMsg = $GUI_EVENT_CLOSE or $msg=$_exit Then Exit
     If $nMsg = $GUI_EVENT_MINIMIZE Then WinSetState($bck,"",@SW_HIDE)
     If $msg = $xianshi Then WinSetState ($bck,"",@SW_RESTORE)
     if $msg=$guanyu then MsgBox(64,"����","���ߣ��ǳ��� "&@CRLF&"�����2008��5��21��")
     If $nMsg = $button1 Or $msg = $zhiding Then zhiding()
     If $nMsg = $button2 Or $msg = $qxzhiding Then qxzhiding()
     $dqtmd = GUICtrlRead($slider1)
     If $dqtmd <> $cftmd And GUICtrlRead($Label1) <> "" Then
         WinSetTrans($dqck, "", $dqtmd)
         $cftmd = $dqtmd
     EndIf
     $ck = WinGetTitle("")
     If $ck <> $bck And $ck <> $dqck and $ck<> "AutoIt V3" Then
         $dqck = $ck
         GUICtrlSetData($Label1, $dqck)
     EndIf
     Sleep(20)
WEnd
Func zhiding()
     WinSetOnTop($dqck, "", 1)
     GUICreate("�ö���͸��", 420, 200, 100, 200, "", "", $dqck)
     WinSetOnTop($bck, "", 1)
EndFunc   ;==>zhiding
Func qxzhiding()
     WinSetOnTop($dqck, "", 0)
EndFunc   ;==>qxzhiding
Func tmd()
     If @HotKeyPressed = "!1"   Then WinSetTrans($dqck, "", 0)
     If @HotKeyPressed = "!2"   Then WinSetTrans($dqck, "", 150)
     If @HotKeyPressed = "!3"   Then WinSetTrans($dqck, "", 255)
     GUICtrlSetData($slider1, $dqtmd)
EndFunc   ;==>tmd
Func wqtm()
     WinSetTrans($dqck, "", 0)
EndFunc   ;==>wqtm
Func bantm()
     WinSetTrans($dqck, "", 150)
EndFunc   ;==>bantm
Func butm()
     WinSetTrans($dqck, "", 255)
EndFunc   ;==>butm
Func zjtm()
     If $dqtmd >= 5 Then
         $dqtmd = $dqtmd - 5
         GUICtrlSetData($slider1, $dqtmd)
         WinSetTrans($dqck, "", $dqtmd)
     EndIf
EndFunc   ;==>zjtm
Func jstm()
     If $dqtmd < 251 Then
         $dqtmd = $dqtmd + 5
         GUICtrlSetData($slider1, $dqtmd)
         WinSetTrans($dqck, "", $dqtmd)
     EndIf
EndFunc   ;==>jstm 