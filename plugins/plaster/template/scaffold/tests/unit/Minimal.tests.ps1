<#
Minimal.tests.ps1 - minimal tests

_author_ = Douglas Roorda <droorda@gmail.com> _version_ = 1.0

#>

BeforeDiscovery {
    Set-StrictMode -Version latest
    $PrivateFunctions = Get-ChildItem "$ENV:BuildRoot\src\Private\" -Filter '*.ps1' -Recurse
    $PublicFunctions = Get-ChildItem "$ENV:BuildRoot\src\Public\" -Filter '*.ps1' -Recurse
    $Rules = Get-ScriptAnalyzerRule
}

Describe 'Testing Private Function - <PrivateFunction.BaseName> ' -Tags @('UnitTest') -foreach $PrivateFunctions {
    BeforeAll {
        $PrivateFunction = $_
    }
    It "Is valid Powershell (Has no script errors)" {
        $contents = Get-Content -Path $PrivateFunction.FullName -ErrorAction Stop
        $errors = $null
        $null = [System.Management.Automation.PSParser]::Tokenize($contents, [ref]$errors)
        if ($errors.message) {
            $errors | Format-Table message, @{Name='Line';Expression={$_.Token.StartLine}}, @{Name='Column';Expression={$_.Token.StartColumn}} | Out-String | Write-Host -ForegroundColor Yellow
        }
        $errors.Count | Should -Be 0
    }
}

Describe 'Testing Public Function - <PublicFunction.BaseName> ' -Tags @('UnitTest') -foreach $PublicFunctions {
    BeforeAll {
        $PublicFunction = $_
    }
    BeforeEach {
        $Rule = $_
    }
    It "Is valid Powershell (Has no script errors)" {
        $contents = Get-Content -Path $PublicFunction.FullName -ErrorAction Stop
        $errors = $null
        $null = [System.Management.Automation.PSParser]::Tokenize($contents, [ref]$errors)
        if ($errors.message) {
            $errors | Format-Table message, @{Name='Line';Expression={$_.Token.StartLine}}, @{Name='Column';Expression={$_.Token.StartColumn}} | Out-String | Write-Host -ForegroundColor Yellow
        }
        $errors.Count | Should -Be 0
    }
    It "passes the PSScriptAnalyzer Rule '<Rule.RuleName>'" -foreach $Rules {
        $Return = Invoke-ScriptAnalyzer -Path $PublicFunction.FullName -IncludeRule $rule.RuleName
        if ($Return) {
            $Return | Format-Table ScriptName,RuleName,Line | Out-String | Write-Host -ForegroundColor Yellow
        }
        $Return.Count | Should -Be 0
    }
}
