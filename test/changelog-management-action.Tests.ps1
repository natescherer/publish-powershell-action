$global:NL = [System.Environment]::NewLine

Describe 'publish to packages' {
    It 'check package exists' {
        Get-Content -Path "test\read_lastversion.txt" -Raw | Should -Be "1.1.0"
    }
}