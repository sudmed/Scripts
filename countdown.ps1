# Countdown after Start-Sleep in PowerShell

for ($d=10; $d -gt 0; $d--)
{
write-host "`rTimeout: " $d "  " -NoNewLine
start-sleep -Seconds 1
}

# or CMD-like way
TIMEOUT /T (Get-Random -Maximum 50)
