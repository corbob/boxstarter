param(
    [parameter(Position = 0, Mandatory = $false)][boolean]$ExportCommands = $false
)
if (!$Global:Boxstarter) { $Global:Boxstarter = @{} }
if (!$Boxstarter.ContainsKey('RebootOk')) { $Boxstarter.RebootOk = $true }

$unNormalized = (Get-Item "$PSScriptRoot\..\Boxstarter.Bootstrapper\Boxstarter.Bootstrapper.psd1")
Import-Module $unNormalized.FullName -Global -DisableNameChecking


# Resolve-Path $PSScriptRoot\*.ps1 | % { . $_.ProviderPath }
# we're not doing dot-sourcing anymore - "INCLUDE" all required files into this module during build

# --- INCLUDE *.ps1

if ($ExportCommands) {
    Import-BoxstarterVars
    Export-ModuleMember cinst, cup, choco
}

Export-ModuleMember Get-BoxstarterConfig, `
    Get-PackageRoot, `
    Enable-BoxstarterClientRemoting, `
    Enable-BoxstarterCredSSP, `
    Export-BoxstarterVars, `
    Install-ChocolateyInstallPackageOverride, `
    Invoke-BoxstarterBuild, `
    Invoke-BoxstarterFromTask, `
    Invoke-Chocolatey, `
    Invoke-ChocolateyBoxstarter, `
    Install-BoxstarterPackage, `
    New-BoxstarterPackage, `
    New-PackageFromScript, `
    Register-ChocolateyInterception, `
    Resolve-VMPlugin, `
    Set-BoxstarterConfig, `
    Set-BoxstarterShare, `
    Write-HostOverride

Export-ModuleMember -Alias `
    Enable-BoxstarterVM, `
    Install-ChocolateyInstallPackage, `
    Write-Host
