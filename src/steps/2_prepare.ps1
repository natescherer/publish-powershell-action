Write-Host "Starting Action..."

Write-Host "Installing PowerShellGet 3..."
Install-Module PowerShellGet -AllowPrerelease -Force -Repository PSGallery -SkipPublisherCheck

$FullPath = "$env:GITHUB_WORKSPACE\$env:INPUT_PATH"

if (Test-Path -Path $FullPath -PathType Container) {
    Write-Host "Input 'path' is a directory."

    . "$env:GITHUB_ACTION_PATH\src\private\Find-PowerShellFiles.ps1"
    $ResolvedPath = Find-PowerShellFiles -Path $FullPath
} else {
    Write-Host "Input 'path' is a file."
    $ResolvedPath = $FullPath
}

if ($ResolvedPath -like "*.psd1") {
    . "$env:GITHUB_ACTION_PATH\src\private\Copy-FilesToModuleDirectory.ps1"
    $ResolvedPath = Copy-FilesToModuleDirectory -Path $ResolvedPath -ActionPath $env:GITHUB_ACTION_PATH
}

Write-Host "Path resolved to: $ResolvedPath"
"RESOLVED_PATH=$ResolvedPath" | Out-File -FilePath $env:GITHUB_ENV -Encoding utf-8 -Append