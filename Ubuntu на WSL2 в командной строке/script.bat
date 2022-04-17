REM Delete old distrs
start /wait "" %WinDir%\system32\windowspowershell\v1.0\powershell.exe -NoProfile -ExecutionPolicy UnRestricted wsl --unregister Legacy
start /wait "" %WinDir%\system32\windowspowershell\v1.0\powershell.exe -NoProfile -ExecutionPolicy UnRestricted wsl --unregister ubuntu-20.04
REM Enable Needed Virtualization
REM start /wait "" %WinDir%\system32\windowspowershell\v1.0\powershell.exe -NoProfile -ExecutionPolicy UnRestricted dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
REM start /wait "" %WinDir%\system32\windowspowershell\v1.0\powershell.exe -NoProfile -ExecutionPolicy UnRestricted dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
REM start /wait "" %WinDir%\system32\windowspowershell\v1.0\powershell.exe -NoProfile -ExecutionPolicy UnRestricted Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
REM start /wait "" wsl_update_x64.msi /q
REM Go to v2
wsl --set-default-version 2
start /wait "" %WinDir%\system32\windowspowershell\v1.0\powershell.exe -NoProfile -ExecutionPolicy UnRestricted wsl --install -d Ubuntu-20.04
REM Update all the things
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean && sudo apt install mc -y
REM Python and Sphinx-related prereqs
sudo apt install make python3-venv python3-dev -y
REM Bash git prompt
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
REM Adding bash git prompt to user bash profile
echo '
# Adds the git branch status info to the shell prompt
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
fi' >> ~/.bashrc
exit
