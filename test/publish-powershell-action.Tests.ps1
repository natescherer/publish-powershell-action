$global:NL = [System.Environment]::NewLine

Describe 'Publish to NuGet' {
    It 'Install Module' {
        $ModuleName = "TestModule-$env:RUNNER_OS_LOWER"
        $RepoName = "JFrog"
        $Version = "1.0.1-alpha$env:VERSION_SUFFIX"
        Register-PSResourceRepository -Name $RepoName -Uri "https://natescherer.jfrog.io/artifactory/api/nuget/nuget" -Trusted
        Install-PSResource -Name $ModuleName -Repository $RepoName -Version $Version -Prerelease
        Get-PSResource -Name $ModuleName | Should -Not -BeNullOrEmpty
    }
}