Write-Host "Registering GitHub Packages repository..."
Register-PSResourceRepository -Name "GitHubPackages" -Uri "https://nuget.pkg.github.com/$env:GITHUB_REPOSITORY/index.json"

Write-Host "Publishing to Packages..."
Publish-PSResource -Path $env:RESOLVED_PATH -Repository "GithubPackages" -ApiKey $env:INPUT_TOKEN

Write-Host "Unregistering GitHub Packages repository..."
Unregister-PSResourceRepository -Name "GitHubPackages"

Write-Host "Done!"