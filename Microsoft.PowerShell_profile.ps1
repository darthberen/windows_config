Write-Host "Setting up GitHub Environment"
. (Resolve-Path "$env:LOCALAPPDATA\GitHub\shell.ps1")

Write-Host "Setting up Posh-Git"
. (Resolve-Path "$env:github_posh_git\profile.example.ps1")

function global:prompt {
    Write-Host "`n"
    $realLASTEXITCODE = $LASTEXITCODE

    # Reset color, which can be messed up by Enable-GitColors
    $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor

    Write-Host($pwd.ProviderPath) -nonewline

    Write-VcsStatus

    $global:LASTEXITCODE = $realLASTEXITCODE
    return "`n> "
}
