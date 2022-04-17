  # Ask for elevated permissions if required
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}
# Boxstarter options
#$Boxstarter.RebootOk=$true # Allow reboots?
#$Boxstarter.NoPassword=$false # Is this a machine with no login password?
#$Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot
#$cred=Get-Credential Admin
Import-Module Boxstarter.Chocolatey
Update-ExecutionPolicy Unrestricted
# Creat TEMP dir
#New-Item -Path "c:\Temp" -ItemType directory -Force
###chocolatey core.extension needed for pyton3###
#choco upgrade chocolatey-core.extension -y -s \\192.168.1.15\distros$\choco
choco upgrade chocolatey-core.extension -y
### Pyton ###
write-host "Python installing..."
#choco upgrade python3 --version 3.9.7 --params "/InstallDir:C:\Python39" -y -s \\192.168.1.15\distros$\choco
#choco upgrade python3 --version 3.9.7 --params "/InstallDir:C:\Python39" --params "Include_pip=1" -y
choco upgrade python3 --version 3.9.7 --params "Include_pip=1" --params "InstallAllUsers=0" -y
Write-Warning "Python installed"
### Python upgrade pip###
write-host "Pyton upgrade pip"
cmd /c "cd /d C:\Python39"
cmd /c "python -m pip install --upgrade pip"
cmd /c "TIMEOUT /T 5"
#cmd /c "python -m pip install wheel numpy scipy matplotlib ipython sympy pandas certifi chardet idna requests six urllib3 vk vk_api attrs backcall bleach colorama cycler decorator defusedxml Django entrypoints ipykernel ipython-genutils ipywidgets jedi Jinja2 joblib jsonschema jupyter jupyter-client jupyter-console jupyter-core kiwisolver lxml MarkupSafe mistune mpmath music nbconvert nbformat notebook pandocfilters parso pickleshare Pillow prometheus-client prompt-toolkit Pygments pyparsing pyrsistent python-dateutil python-docx pytz pywin32 pywinpty pyzmq qtconsole scikit-learn seaborn Send2Trash sklearn termcolor terminado testpath tornado traitlets wcwidth webencodings widgetsnbextension wing click DAWG-Python docopt pymorphy2 pymorphy2-dicts python-dotenv"
python -m pip list
cmd /c "TIMEOUT /T 5"
cmd /c "python -m pip install wheel"
cmd /c "python -m pip install pipenv"
Write-Warning "Pyton pipenv installed"
cmd /c 'copy "\\Lic1-srv2\distros$\deploy\!MInstAll\MInstAll\Soft\199. Python39\python-upgrade-pip.cmd" "C:\Temp" /y'
TIMEOUT /T 5
cmd "/c TIMEOUT /T 65"
