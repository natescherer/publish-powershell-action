if ($env:INPUT_TARGET -eq "gallery") {
    $ResolvedPath = $env:RESOLVED_PATH

    Write-Host "Registering PowerShell Gallery..."
    Register-PSResourceRepository -PSGallery -Trusted

    Write-Host "Publishing to PowerShell Gallery..."
    Publish-PSResource -Path $ResolvedPath -Repository "PSGallery" -ApiKey $env:INPUT_TOKEN

    Write-Host "Done!"
}