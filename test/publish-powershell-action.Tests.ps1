$global:NL = [System.Environment]::NewLine

Describe 'Packages' {
    It 'Install Module' {
        $ModuleName = "TestModule-$env:RUNNER_OS_LOWER"
        $RepoName = "Packages"
        $Version = "1.0.1-alpha$env:VERSION_SUFFIX"
        Register-PSResourceRepository -Name $RepoName -Uri https://nuget.pkg.github.com/natescherer/index.json -Trusted
        $Username = "natescherer"
        $Password = $env:GITHUB_TOKEN
        $Credential = New-Object System.Management.Automation.PSCredential ($Username, $(ConvertTo-SecureString $Password -AsPlainText -Force))
        Install-PSResource -Name $ModuleName -Repository $RepoName -Prerelease -Credential $Credential
        Get-PSResource -Name $ModuleName | Should -Not -BeNullOrEmpty
        Uninstall-PSResource -Name $ModuleName -Version $Version -Prerelease
    }
}

Describe 'NuGet' {
    It 'Install Module' {
        $ModuleName = "TestModule-$env:RUNNER_OS_LOWER"
        $RepoName = "JFrog"
        $Version = "1.0.1-alpha$env:VERSION_SUFFIX"
        Register-PSResourceRepository -Name $RepoName -Uri "https://natescherer.jfrog.io/artifactory/api/nuget/nuget" -Trusted
        Install-PSResource -Name $ModuleName -Repository $RepoName -Version $Version -Prerelease
        Get-PSResource -Name $ModuleName | Should -Not -BeNullOrEmpty
        Uninstall-PSResource -Name $ModuleName -Version $Version -Prerelease
    }
}