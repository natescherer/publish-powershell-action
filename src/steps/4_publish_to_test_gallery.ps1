if ($env:INPUT_TARGET -eq "gallery") {
    $ResolvedPath = $env:RESOLVED_PATH

    Write-Host "Registering PoshTest Gallery..."
    Register-PSResourceRepository -Name "PoshTestGallery" -URL "https://www.poshtestgallery.com/api/v2/package/" -Trusted

    Write-Host "Publishing to PoshTest Gallery..."
    Publish-PSResource -Path $ResolvedPath -Repository "PoshTestGallery" -ApiKey $env:INPUT_TOKEN

    Write-Host "Done!"
}