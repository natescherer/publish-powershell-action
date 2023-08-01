Describe 'NuGet' {
    It 'Install Module' {
        $ModuleName = "TestModule-$env:RUNNER_OS_LOWER"
        $RepoName = "Cloudsmith"
        $Version = "1.0.1-alpha$env:BUILD_NUMBER"
        Register-PSResourceRepository -Name $RepoName -Uri "https://nuget.cloudsmith.io/natescherer/publish-powershell-action/v3/index.json" -Trusted
        Install-PSResource -Name $ModuleName -Repository $RepoName -Version $Version -Prerelease
        Get-PSResource -Name $ModuleName | Should -Not -BeNullOrEmpty
        Uninstall-PSResource -Name $ModuleName -Version $Version -Prerelease
        Unregister-PSResourceRepository -Name $RepoName
    }
    It 'Install Module (Dependencies)' {
        $ModuleName = "TestModule-dependencies-$env:RUNNER_OS_LOWER"
        $RepoName = "Cloudsmith"
        $Version = "1.0.1-alpha$env:BUILD_NUMBER"
        Register-PSResourceRepository -Name $RepoName -Uri "https://nuget.cloudsmith.io/natescherer/publish-powershell-action/v3/index.json" -Trusted
        Install-PSResource -Name $ModuleName -Repository $RepoName -Version $Version -Prerelease
        Get-PSResource -Name $ModuleName | Should -Not -BeNullOrEmpty
        Uninstall-PSResource -Name $ModuleName -Version $Version -Prerelease
        Unregister-PSResourceRepository -Name $RepoName
    }
}