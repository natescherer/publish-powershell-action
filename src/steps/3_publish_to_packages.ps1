if ($env:INPUT_TARGET -eq "packages") {
    $ResolvedPath = $env:RESOLVED_PATH

    Write-Host "Registering local NuGet repository..."
    $LocalRepoPath = "$env:GITHUB_ACTION_PATH\repo"
    New-Item -Path $LocalRepoPath -Type Directory | Out-Null
    Register-PSResourceRepository -Name "LocalRepo" -URL $LocalRepoPath

    Write-Host "Publishing to local NuGet repository..."
    Publish-PSResource -Path $ResolvedPath -Repository "LocalRepo"

    Write-Host "Install gpr tool..."
    dotnet tool install --global gpr

    Write-Host "Publishing to GitHub Packages..."
    $NupkgPath = Get-ChildItem -Path $LocalRepoPath -Include "*.nupkg" -Recurse
    gpr push -k $env:INPUT_TOKEN $NupkgPath -r "https://github.com/$env:GITHUB_REPOSITORY"

    Write-Host "Done!"
}