Set wshShell = CreateObject("wScript.Shell")
wshShell.Run chr(34) & "C:\serf\serf_service.bat" & Chr(34), 0
Set wshShell = Nothing