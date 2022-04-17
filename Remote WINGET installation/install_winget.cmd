@echo off
:menu1
Echo.
Echo.
Echo Which range of IP addresses should we use for WINGET installation?
Echo.
Echo 1 - 192.168.1.0/24
Echo 2 - 172.31.255.0/24
Echo 3 - exit
echo.
Set /p choice="I choose: "
if not defined choice goto menu1
if "%choice%"=="1" (GOTO 192)
if "%choice%"=="2" (GOTO 172)
if "%choice%"=="3" (exit)
Echo.
Echo.
Echo Wrong choice
Echo.
Echo.
goto menu1
:172
Echo.
Echo.
echo Enter the IP-address for UpdatePack7R2 installation
Echo.
set /p input="172.31.255."
REM set /p input=""
Echo.
echo Injecting PsExec to admin$ share...
Echo.
cd /d C:\PSTools
REM xcopy "\\192.168.1.15\distros$\deploy\!MInstAll\MInstAll\Soft\0. Updates\install.cmd" \\172.31.255.%input%\c$\Temp\
call PsExec.exe \\172.31.255.%input% -s -cf "\\Lic1-srv2\distros$\deploy\!MInstAll\MInstAll\Soft\370.winget\install.cmd"
GOTO start
:192
Echo.
Echo.
echo Enter the IP-address for UpdatePack7R2 installation
Echo.
set /p input="192.168.1."
REM set /p input=""
Echo.
echo Injecting PsExec to admin$ share...
Echo.
cd /d C:\PSTools
REM xcopy "\\192.168.1.15\distros$\deploy\!MInstAll\MInstAll\Soft\0. Updates\install.cmd" \\192.168.1.%input%\c$\Temp\
REM call PsExec.exe \\192.168.1.%input% -s -cf "U:\distros\deploy\!MInstAll\MInstAll\Soft\0. Updates\install.cmd"
call PsExec.exe \\192.168.1.%input% -s -cf "\\Lic1-srv2\distros$\deploy\!MInstAll\MInstAll\Soft\370.winget\install.cmd"
GOTO start
:start
goto menu1
