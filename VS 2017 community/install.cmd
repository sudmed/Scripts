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
#########################
### VS 2017 community ###
#########################
#
cmd /c "echo Installing w/o Chocolatey"
write-host "VS 2017 community"
certutil.exe -addstore -f "Root" "\\192.168.1.15\distros$\choco\VS2017offline\certificates\manifestRootCertificate.cer"
certutil.exe -addstore -f "Root" "\\192.168.1.15\distros$\choco\VS2017offline\certificates\manifestCounterSignRootCertificate.cer"
certutil.exe -addstore -f "Root" "\\192.168.1.15\distros$\choco\VS2017offline\certificates\vs_installer_opc.RootCertificate.cer"
start-process "\\192.168.1.15\distros$\choco\VS2017offline\vs_Community_2017_Ru.exe" -Argumentlist "--add Microsoft.VisualStudio.Workload.Universal;includeRecommended --add Microsoft.VisualStudio.Workload.ManagedDesktop;includeRecommended --add Microsoft.VisualStudio.Workload.NativeDesktop;includeRecommended --add Microsoft.VisualStudio.Workload.NetCoreTools;includeRecommended --add Microsoft.VisualStudio.Workload.Data;includeRecommended --add Microsoft.VisualStudio.Workload.NetWeb;includeRecommended --add Microsoft.VisualStudio.Workload.Node;includeRecommended --add Microsoft.VisualStudio.Workload.VisualStudioExtension;includeRecommended -p --wait --norestart --noWeb" -Wait
Write-Warning "VS 2017 community installed"
cmd /c "timeout /t 5 /nobreak"
