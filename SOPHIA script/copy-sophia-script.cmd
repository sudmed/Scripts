xcopy "\\Lic1-srv2\distros$\deploy\!MInstAll\MInstAll\Soft\225. Sophia\" "C:\Temp\" /H /Y /C /R /S
REM RD /S /Q C:\Temp\Manifest\
REM MD C:\Temp\Manifest\
REM MD C:\Temp\Localization\
REM xcopy "\\Lic1-srv2\distros$\deploy\!MInstAll\MInstAll\Soft\225. Sophia\choco-sophia-script.ps1" "C:\Temp\" /Y
REM xcopy "\\Lic1-srv2\distros$\deploy\!MInstAll\MInstAll\Soft\225. Sophia\Sophia.psd1" "C:\Temp\" /Y
REM xcopy "\\Lic1-srv2\distros$\deploy\!MInstAll\MInstAll\Soft\225. Sophia\Sophia.psd1" "C:\Temp\Manifest\" /H /Y /C /R /S
REM xcopy "\\Lic1-srv2\distros$\deploy\!MInstAll\MInstAll\Soft\225. Sophia\Sophia.psm1" "C:\Temp\" /Y
REM xcopy "\\Lic1-srv2\distros$\deploy\!MInstAll\MInstAll\Soft\225. Sophia\Localizations\" "C:\Temp\Localizations\" /H /Y /C /R /S
TIMEOUT /T 10
start /wait "" %WinDir%\system32\windowspowershell\v1.0\powershell.exe -NoProfile -ExecutionPolicy UnRestricted -File "C:\Temp\choco-sophia-script.ps1"
TIMEOUT /T 10
del /f /q C:\Temp\choco-sophia-script.ps1
del /f /q C:\Temp\copy-sophia-script.cmd
del /f /q C:\Temp\Sophia.psd1
del /f /q C:\Temp\Sophia.psm1
RD /S /Q C:\Temp\Manifest\
RD /S /Q C:\Temp\Localizations\
RD /S /Q C:\Temp\Module\
TIMEOUT /T 10
exit
