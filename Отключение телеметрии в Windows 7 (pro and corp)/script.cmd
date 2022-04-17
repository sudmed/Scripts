@echo off
::Отключение функции "Участие в программе улучшения качества ПО"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /f /v CEIPEnable /t REG_DWORD /d 0
::Отключение службы "Diagnostics Tracking Service"
net stop DiagTrack
sc config DiagTrack start= disabled
::Отключение задач телеметрии в планировщике
SchTasks /Change /TN "\Microsoft\Windows\Application Experience\AITAgent" /Disable
SchTasks /Change /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
SchTasks /Change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
SchTasks /Change /TN "\Microsoft\Windows\Autochk\Proxy" /Disable
SchTasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
SchTasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\KernelCEIPTask" /Disable
SchTasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCEIP" /Disable
SchTasks /Change /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
::Удаление обновлений телеметрии
start /w wusa.exe /uninstall /kb:3075249 /quiet /norestart
start /w wusa.exe /uninstall /kb:3080149 /quiet /norestart
start /w wusa.exe /uninstall /kb:3021917 /quiet /norestart
start /w wusa.exe /uninstall /kb:3022345 /quiet /norestart
start /w wusa.exe /uninstall /kb:3068708 /quiet /norestart
start /w wusa.exe /uninstall /kb:3022345 /quiet /norestart
start /w wusa.exe /uninstall /kb:2976978 /quiet /norestart
::Перезагрузка компьютера, чтобы изменения вступили в силу
shutdown -r -t 000
