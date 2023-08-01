if ($env:IMPORT_STRING) {
    Write-Host "Resource has dependencies, now importing them into the current session..."
    Invoke-Expression -Command $env:IMPORT_STRING
}

Write-Host "Publishing to PowerShell Gallery..."
Publish-PSResource -Path $env:RESOLVED_PATH -Repository "PSGallery" -ApiKey $env:INPUT_TOKEN

Write-Host "Done!"