if ($env:IMPORT_STRING) {
    Write-Host "Resource has dependencies, now importing them into the current session..."
    Invoke-Expression -Command $env:IMPORT_STRING
}

Write-Host "Registering NuGet repository..."
Register-PSResourceRepository -Name "NuGet" -Uri $env:INPUT_NUGETURL -Trusted

Write-Host "Publishing to NuGet repository...."
$PublishSplat = @{
    Path = $env:RESOLVED_PATH
    Repository = "NuGet"
    ApiKey = $env:INPUT_TOKEN
    SkipDependenciesCheck = $true
}
if ($env:RESOLVED_PATH -like "*.psd1") {
    $ManifestData = Import-PowerShellDataFile $ResolvedPath
    if ($ManifestData.RequiredModules) {
        $PublishSplat += @{
            SkipModuleManifestValidate = $true
        }
    }
}
Publish-PSResource @PublishSplat

Unregister-PSResourceRepository -Name "NuGet"

Write-Host "Done!"