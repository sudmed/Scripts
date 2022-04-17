# Ask for elevated permissions if required
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}
#
# Boxstarter options
#$Boxstarter.RebootOk=$true # Allow reboots?
#$Boxstarter.NoPassword=$false # Is this a machine with no login password?
#$Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot
#$cred=Get-Credential Admin
#
Import-Module Boxstarter.Chocolatey
Update-ExecutionPolicy Unrestricted
#
#
#
################################
# Uninstall McAfee Security App#
################################
#
cmd /c "echo Uninstalling w/o Chocolatey"
write-host "McAfee Security App"
$mcafee = gci "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" | foreach { gp $_.PSPath } | ? { $_ -match "McAfee Security" } | select UninstallString
if ($mcafee) {
    $mcafee = $mcafee.UninstallString -Replace "C:\Program Files\McAfee\MSC\mcuihost.exe",""
    Write "Uninstalling McAfee..."
    start-process "C:\Program Files\McAfee\MSC\mcuihost.exe" -arg "$mcafee" -Wait
}
Write-Warning "McAfee uninstalled"
cmd /c "timeout /t 5 /nobreak"
#
#
###################################
### Uninstall McAfee WebAdvisor ###
###################################
#
write-host "Uninstall McAfee WebAdvisor"
start-process "C:\Program Files\McAfee\WebAdvisor\Uninstaller.exe" -arg "/s" -Wait
Write-Warning "McAfee WebAdvisor uninstalled"
#
#
#################################
### Uninstall McAfee Security ###
#################################
#
write-host "Uninstall McAfee Security"
start-process "C:\Program Files\McAfee\MSC\mcuihost.exe" -arg "/body:misp://MSCJsRes.dll::uninstall.html /id:uninstall" -Wait
Write-Warning "McAfee Security uninstalled"
#
#
##############################################
### Uninstall with McAfee Removal Tool (mcpr)#
##############################################
#
write-host "McAfee Removal Tool"
copy-item "\\192.168.1.15\distros$\choco\McAfee_uninst\MCPR.exe" C:\Temp
#start-process "C:\Temp\MCPR.exe" -Wait
Write-Warning "McAfee totaly removed"
cmd /c "timeout /t 5 /nobreak"
