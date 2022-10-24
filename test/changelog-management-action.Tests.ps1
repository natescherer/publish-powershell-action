$global:NL = [System.Environment]::NewLine

Describe 'Publish to NuGet' {
    It 'Install Module' {
        $ModuleName = "TestModule-$env:RUNNER_OS_LOWER"
        $RepoName = "JFrog"
        Register-PSResourceRepository -Name $RepoName -SourceLocation "https://natescherer.jfrog.io/artifactory/api/nuget/nuget" -InstallationPolicy Trusted
        Install-PSResource -Name $ModuleName -Repository $RepoName
        Get-PSResource -Name $ModuleName | Should -Not -BeNullOrEmpty
    }
}