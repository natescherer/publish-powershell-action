Write-Host "Now uninstalling temporarily installed packages..."

Invoke-Expression -Command $env:UNINSTALL_STRING

Write-Host "Done!"