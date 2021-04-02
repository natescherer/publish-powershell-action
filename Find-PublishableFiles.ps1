function Find-PublishableFiles.ps1 {
    [CmdletBinding()]
    param(
        [parameter(Mandatory = $true)]
        [string]$Path
    )

    $OutputPath = ""

    Write-Host "Searching for .psm1 files..."
    $ModuleFile = Get-ChildItem -Path "$Path\*" -Include "*.psm1"
    if (!$ModuleFile) {
        Write-Host "No .psm1 files found."
    }
    if ($ModuleFile.Count -gt 1) {
        Write-Host "Multiple .psm1 files found."
        Write-Host "This action cannot currently handle multiple files when 'path' input is set to a directory."
        throw "Multiple .psm1 files found in 'path' input."
    }
    if ($ModuleFile.Count -eq 1) {
        Write-Host "Module path resolved: $($ModuleFile.Fullname)"
        $OutputPath = $ModuleFile.Fullname
    }

    if (!$PathResolved) {
        Write-Host "Searching for .ps1 files..."
        $ScriptFile = Get-ChildItem -Path "$Path\*" -Include "*.ps1"
        if (!$ScriptFile) {
            Write-Host "No .ps1 files found."
            Write-Host "No valid module or script files were found in the 'path' input."
            throw "No valid module or script files were found in the 'path' input."
        }
        if ($ScriptFile.Count -gt 1) {
            Write-Host "Multiple .ps1 files found."
            Write-Host "This action cannot currently handle multiple files when 'path' input is set to a directory."
            throw "Multiple .ps1 files found in 'path' input."
        }
        if ($ScriptFile.Count -eq 1) {
            Write-Host "Script path resolved: $($ScriptFile.Fullname)"
            $OutputPath = $ScriptFile.Fullname
        }
    }

    $OutputPath
}