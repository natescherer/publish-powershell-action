Write-Host "Registering NuGet repository..."
Register-PSResourceRepository -Name "NuGet" -Uri $env:INPUT_NUGETURL -Trusted

Write-Host "Publishing to NuGet repository...."
Publish-PSResource -Path $env:RESOLVED_PATH -Repository "NuGet" -ApiKey $env:INPUT_TOKEN

Write-Host "Done!"