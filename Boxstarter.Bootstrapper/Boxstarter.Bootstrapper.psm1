# Resolve-Path $PSScriptRoot\*.ps1 | % { . $_.ProviderPath }
# we're not doing dot-sourcing anymore - "INCLUDE" all required files into this module during build
# --- INCLUDE *.ps1

Import-Module (Join-Path $Boxstarter.BaseDir Boxstarter.WinConfig\Boxstarter.WinConfig.psd1) -global -DisableNameChecking

Export-ModuleMember Invoke-Boxstarter, `
                    Test-PendingReboot, `
                    Invoke-Reboot, `
                    Write-BoxstarterMessage, `
                    Start-TimedSection, `
                    Stop-TimedSection, `
                    Out-Boxstarter, `
                    Enter-BoxstarterLogable, `
                    Get-BoxstarterTempDir, `
                    Install-BoxstarterExtension
