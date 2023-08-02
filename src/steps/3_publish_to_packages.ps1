if ($env:IMPORT_STRING) {
    Write-Host "Resource has dependencies, now importing them into the current session..."
    Invoke-Expression -Command $env:IMPORT_STRING
}

Write-Host "Registering GitHub Packages repository..."
Register-PSResourceRepository -Name "GitHubPackages" -Uri "https://nuget.pkg.github.com/$env:GITHUB_REPOSITORY_OWNER/index.json"

Write-Host "Publishing to Packages..."
$PublishSplat = @{
    Path = $env:RESOLVED_PATH
    Repository = "GitHubPackages"
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

Write-Host "Unregistering GitHub Packages repository..."
Unregister-PSResourceRepository -Name "GitHubPackages"

Write-Host "Done!"