#########################
##### Sophia Script  ####
#########################
#
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
###############
###Winconfig###
###############
#
write-host "Win config"
Disable-InternetExplorerESC
Disable-BingSearch
Disable-GameBarTips
#Disable-UAC
#
#
Import-Module -Name C:\Temp\Sophia.psd1 -PassThru -Force
#
#
Clear-Host
$Host.UI.RawUI.WindowTitle = 'Windows Sophia Script | Copyright farag2 & Inestic, 2014 to 2021'
Remove-Module -Name Sophia -Force -ErrorAction Ignore
Import-Module -Name $PSScriptRoot\Manifest\Sophia.psd1 -PassThru -Force
Import-LocalizedData -BindingVariable Global:Localization -FileName Sophia -BaseDirectory $PSScriptRoot\Localizations
#
#region Protection
Checkings
Logging
CreateRestorePoint
