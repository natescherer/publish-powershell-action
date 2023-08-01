if ($env:IMPORT_STRING) {
    Write-Host "Resource has dependencies, now importing them into the current session..."
    Invoke-Expression -Command $env:IMPORT_STRING
}

Write-Host "Registering GitHub Packages repository..."
Register-PSResourceRepository -Name "GitHubPackages" -Uri "https://nuget.pkg.github.com/$env:GITHUB_REPOSITORY_OWNER/index.json"

Write-Host "Publishing to Packages..."
Publish-PSResource -Path $env:RESOLVED_PATH -Repository "GithubPackages" -ApiKey $env:INPUT_TOKEN

Write-Host "Unregistering GitHub Packages repository..."
Unregister-PSResourceRepository -Name "GitHubPackages"

Write-Host "Done!"