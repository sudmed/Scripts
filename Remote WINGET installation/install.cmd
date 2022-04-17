chcp 1251 >nul
if not exist c:\Temp\ mkdir c:\Temp\
xcopy "\\Lic1-srv2\distros$\deploy\!MInstAll\MInstAll\Soft\370.winget\winget.msixbundle" "c:\Temp\" /Y
cd /d c:\Temp
start %WinDir%\system32\windowspowershell\v1.0\powershell.exe "-NoProfile -ExecutionPolicy UnRestricted Get-AppXPackage *WindowsStore* -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}"
call %WinDir%\system32\windowspowershell\v1.0\powershell.exe -NoProfile -ExecutionPolicy UnRestricted Get-AppxLog >> C:\Temp\winget.log
call %WinDir%\system32\windowspowershell\v1.0\powershell.exe -NoProfile -ExecutionPolicy UnRestricted Add-AppxPackage -Path "C:\Temp\winget.appxbundle"
call %WinDir%\system32\windowspowershell\v1.0\powershell.exe -NoProfile -ExecutionPolicy UnRestricted Get-AppxLog >> C:\Temp\winget.log
mkdir \\192.168.1.15\distros$\LOGS\winget\%COMPUTERNAME%\%DATE%\
xcopy "C:\Temp\winget.log" "\\192.168.1.15\distros$\LOGS\winget\%COMPUTERNAME%\%DATE%\" /Y
del C:\Temp\winget.msixbundle
del C:\Temp\winget.log
exit
