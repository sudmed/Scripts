@Echo off
REM chcp 1251 >nul
chcp 65001 >nul
if not exist c:\Temp\Audit\. mkdir c:\Temp\Audit\
if exist c:\Temp\Audit\query_ID1149.txt del c:\Temp\Audit\query_ID1149.txt
call wevtutil qe "Microsoft-Windows-TerminalServices-RemoteConnectionManager/Operational" /q:"*[System[(EventID=1149)]]" /f:text /rd:true /c:1 > c:\Temp\Audit\query_ID1149.txt
call %WinDir%\system32\windowspowershell\v1.0\powershell.exe -NoProfile -ExecutionPolicy UnRestricted "Get-WinEvent -FilterXPath '*[System[EventID = 1149]]' -LogName "Microsoft-Windows-TerminalServices-RemoteConnectionManager/Operational" | ? {$_.TimeCreated -gt $Last_Event} >> c:\Temp\Audit\query_ID1149.txt"
exit
