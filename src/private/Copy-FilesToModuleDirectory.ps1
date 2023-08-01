function Copy-FilesToModuleDirectory {
    [CmdletBinding()]
    param(
        [parameter(Mandatory = $true)]
        [string]$Path
    )
    # PowerShellGet currently requires the module be in a folder named the same as the manifest

    $NewBasePath = ""

    Write-Host "Creating directory for module publishing..."

    $ManifestName = Split-Path -Path $Path -LeafBase
    $ManifestDir = Split-Path -Path $Path -Parent

    $NewBasePath = Join-Path $env:RUNNER_TEMP $ManifestName

    If (Test-Path $NewBasePath) {
        Remove-Item -LiteralPath $NewBasePath -Force -Recurse
    }

    Write-Host "Copying files from $ManifestDir to $NewBasePath..."
    New-Item -Path $NewBasePath -Type Directory | Out-Null
    Copy-Item -Path "$ManifestDir\*" -Destination $NewBasePath -Recurse

    $OutputPath = Join-Path $NewBasePath $(Split-Path -Path $Path -Leaf)
    $OutputPath
}