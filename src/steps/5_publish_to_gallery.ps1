if ($env:IMPORT_STRING) {
    Write-Host "Resource has dependencies, now importing them into the current session..."
    Invoke-Expression -Command $env:IMPORT_STRING
}

Write-Host "Publishing to PowerShell Gallery..."
$PublishSplat = @{
    Path = $env:RESOLVED_PATH
    Repository = "NuGet"
    ApiKey = $env:INPUT_TOKEN
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

Write-Host "Done!"