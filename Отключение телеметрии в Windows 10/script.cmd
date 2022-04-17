@echo off
::Отключение телеметрии в реестре
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Data Collection" /f /v AllowTelemetry /t REG_DWORD /d 0
::Отключение служб телеметрии
net stop bits
net stop dosvc
net stop DiagTrack
net stop dmwappushservice
sc config bits start= disabled
sc config dosvc start= disabled
sc config DiagTrack start= disabled
sc config dmwappushservice start= disabled
::Отключение задач телеметрии в планировщике
SchTasks /Change /TN "\Microsoft\Windows\Application Experience\StartupAppTask" /Disable
SchTasks /Change /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
SchTasks /Change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
SchTasks /Change /TN "\Microsoft\Windows\Autochk\Proxy" /Disable
SchTasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
SchTasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCEIP" /Disable
SchTasks /Change /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
SchTasks /Change /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /Disable
::Перезагрузка компьютера, чтобы изменения вступили в силу
shutdown -r -t 000
