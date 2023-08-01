$NL = [System.Environment]::NewLine

function Write-HelloWorld {
    [CmdletBinding()]
    param ()

    Write-Host "Hello, world!"
}

function Write-SupWorld {
    [CmdletBinding()]
    param ()

    Write-Host "Sup, world!"
}


Export-ModuleMember -Function Write-HelloWorld, Write-SupWorld
