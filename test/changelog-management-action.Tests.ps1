$global:NL = [System.Environment]::NewLine

Describe 'Publish to NuGet' {
    It 'Install Module' {
        $ModuleName = "TestModule"
        $RepoName = "JFrog"
        Register-PSRepository -Name $RepoName -SourceLocation "https://natescherer.jfrog.io/artifactory/api/nuget/changelog-management-action-$env:RUNNER_OS_LOWER" -InstallationPolicy Trusted
        Install-PSResource -Name $ModuleName -Repository $RepoName
        Get-PSResource -Name $ModuleName | Should -Not -BeNullOrEmpty
    }
}