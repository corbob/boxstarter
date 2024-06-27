# Resolve-Path $PSScriptRoot\*.ps1 | % { . $_.ProviderPath }
# we're not doing dot-sourcing anymore - "INCLUDE" all required files into this module during build
# --- INCLUDE *.ps1

Export-ModuleMember Confirm-Choice,`
                    Create-BoxstarterTask,`
                    Enter-BoxstarterLogable,`
                    Enter-DotNet4,`
                    Get-CurrentUser,`
                    Get-HttpResource,`
                    Get-IsMicrosoftUpdateEnabled,`
                    Get-IsRemote,`
                    Invoke-FromTask,`
                    Invoke-RetriableScript,`
                    Out-BoxstarterLog,`
                    Log-BoxstarterMessage,`
                    Remove-BoxstarterError,`
                    Remove-BoxstarterTask,`
                    Start-TimedSection,`
                    Stop-TimedSection,`
                    Test-Admin,`
                    Write-BoxstarterLogo,`
                    Write-BoxstarterMessage,`
                    Get-BoxstarterTaskContextTempDir

Export-ModuleMember -Variable Boxstarter
