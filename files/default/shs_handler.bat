@ECHO OFF
SET /P serf_payload=[Console]::In.ReadLine()
PowerShell.exe -ExecutionPolicy Bypass -Command "C:\serf\shs_handler.ps1 %serf_payload%"
