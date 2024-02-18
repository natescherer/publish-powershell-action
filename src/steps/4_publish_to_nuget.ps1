if ($env:IMPORT_STRING) {
    Write-Host "Resource has dependencies, now importing them into the current session..."
    Invoke-Expression -Command $env:IMPORT_STRING
}

$PSRepositoryName = "Nuget-$(New-GUID)"
Write-Host "Registering NuGet repository..."
Register-PSResourceRepository -Name $PSRepositoryName -Uri $env:INPUT_NUGETURL -Trusted

Write-Host "Publishing to NuGet repository...."
$PublishSplat = @{
    Path = $env:RESOLVED_PATH
    Repository = $PSRepositoryName
    ApiKey = $env:INPUT_TOKEN
    SkipDependenciesCheck = $true
}
if ($env:RESOLVED_PATH -like "*.psd1") {
    $ManifestData = Import-PowerShellDataFile $env:RESOLVED_PATH
    if ($ManifestData.RequiredModules) {
        $PublishSplat += @{
            SkipModuleManifestValidate = $true
        }
    }
}
Publish-PSResource @PublishSplat

Unregister-PSResourceRepository -Name $PSRepositoryName

Write-Host "Done!"