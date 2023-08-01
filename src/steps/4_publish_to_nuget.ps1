if ($env:IMPORT_STRING) {
    Write-Host "Resource has dependencies, now importing them into the current session..."
    Invoke-Expression -Command $env:IMPORT_STRING
}

Write-Host "Registering NuGet repository..."
Register-PSResourceRepository -Name "NuGet" -Uri $env:INPUT_NUGETURL -Trusted

Write-Host "Publishing to NuGet repository...."
Publish-PSResource -Path $env:RESOLVED_PATH -Repository "NuGet" -ApiKey $env:INPUT_TOKEN

Unregister-PSResourceRepository -Name "NuGet"

Write-Host "Done!"