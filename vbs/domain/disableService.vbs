'shutdown the update service
Dim serv,tm,logfile
serv="wuausery"
tm=Cstr(date()) &" "& Cstr(time())
logfile="c:\runlog.log"
dim wsnet
set wsnet=wscript.createobject("wscript.network")

'msgbox("hello world")

'change name
Set args = WScript.Arguments
If args.Count = 1 Then
serv= WScript.Arguments(0)
'MsgBox "test "+test
End If

set a=CreateObject("WScript.Shell")
a.run("net stop "+serv)
a.run("sc config "+serv+" start=disabled")

function logw(str)
Set ObjFSO = CreateObject("Scripting.FileSystemObject")
Set objLog = objFSO.OpenTextFile(logfile, 8, true)
objLog.WriteLine tm&" "&str
end function


'objLog.WriteLine wsnet.username& " login"
'objLog.WriteLine tm&" service "&serv&" disabled"
logw(wsnet.username& " login")
logw( "service "&serv&" disabled")


