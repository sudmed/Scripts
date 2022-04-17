REM @ECHO OFF
cls
%~d0
cd "%~dp0"
if exist "C:\Python27" (
start "" /wait "C:\Python27\python.exe" /uninstall /passive
RD /S /Q "C:\Python27"
)
if exist "C:\Python35" (
python -m pip freeze >C:\Temp\requirements.txt
start "" /wait "C:\Python35\python.exe" /uninstall /passive
RD /S /Q "C:\Python35"
)
if exist "C:\Program Files (x86)\Python35-32" (
python -m pip freeze >C:\Temp\requirements.txt
start "" /wait "C:\Program Files (x86)\Python35-32\python.exe" /uninstall /passive
RD /S /Q "C:\Program Files (x86)\Python35-32"
)
if exist "C:\Python36" (
python -m pip freeze >C:\Temp\requirements.txt
start "" /wait "C:\Python36\python.exe" /uninstall /passive
RD /S /Q "C:\Python36"
)
if exist "C:\Program Files (x86)\Python36-32" (
python -m pip freeze >C:\Temp\requirements.txt
start "" /wait "C:\Program Files (x86)\Python36-32\python.exe" /uninstall /passive
RD /S /Q "C:\Program Files (x86)\Python36-32"
)
if exist "C:\Python37" (
python -m pip freeze >C:\Temp\requirements.txt
start "" /wait "C:\Python37\python.exe" /uninstall /passive
RD /S /Q "C:\Python37"
)
if exist "C:\Program Files (x86)\Python37-32" (
python -m pip freeze >C:\Temp\requirements.txt
start "" /wait "C:\Program Files (x86)\Python37-32\python.exe" /uninstall /passive
RD /S /Q "C:\Program Files (x86)\Python37-32"
)
if exist "C:\Python38" (
python -m pip freeze >C:\Temp\requirements.txt
start "" /wait "C:\Python38\python.exe" /uninstall /passive
RD /S /Q "C:\Python38"
)
if exist "C:\Python39" (
python -m pip freeze >C:\Temp\requirements.txt
start "" /wait "C:\Python39\python.exe" /uninstall /passive
REM RD /S /Q "C:\Python39"
)
call python-3.9.7.exe /passive /uninstall
call choco uninstall python
call choco uninstall python3
call python-3.9.7.exe /passive InstallAllUsers=0 Include_pip=1 PrependPath=1 Shortcuts=0
REM call python-3.9.7.exe /passive InstallAllUsers=1 PrependPath=1 Shortcuts=0 TargetDir="C:\Python39"
REM python-3.9.7.exe /quiet InstallAllUsers=1 PrependPath=1 /log C:\Temp\Python39-Install.log TargetDir="C:\Python39" Shortcuts=0
del /f /q python-3.9.7.exe
del /f /q launcher.msi
del /f /q path.msi
del /f /q pip.msi
del /f /q tools.msi
del /f /q ucrt.msi
del /f /q tcltk.msi
del /f /q tcltk_d.msi
del /f /q tcltk_pdb.msi
del /f /q test.msi
del /f /q test_d.msi
del /f /q test_pdb.msi
del /f /q lib.msi
del /f /q lib_d.msi
del /f /q lib_pdb.msi
del /f /q exe.msi
del /f /q exe_d.msi
del /f /q exe_pdb.msi
del /f /q dev.msi
del /f /q dev_d.msi
del /f /q core.msi
del /f /q core_d.msi
del /f /q core_pdb.msi
TIMEOUT /T 50
REM icacls C:\Python39 /grant Builtin\Пользователи:(GR,GE,GW,RD,WD,REA,WEA,X)
REM Proxy Off
taskkill /f /im iexplore.exe
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\InternetSettings" /v ProxyEnable /t REG_DWORD /d 0 /f
start /w /b iexplore.exe
taskkill /f /im iexplore.exe
REM Updating pip manager
call python -m ensurepip --upgrade
call python -m pip install --upgrade pip
call pip install wheel
call pip install pipenv
call pip list
call copy "\\Lic1-srv2\distros$\deploy\!MInstAll\MInstAll\Soft\199. Python39\python-upgrade-pip.cmd" "C:\Temp" /y
TIMEOUT /T 5
call del /f /q python-3.9.7-install.cmd
TIMEOUT /T 15
Exit
