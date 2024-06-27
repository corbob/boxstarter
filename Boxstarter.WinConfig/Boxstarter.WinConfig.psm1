# Resolve-Path $PSScriptRoot\*.ps1 | % { . $_.ProviderPath }
# we're not doing dot-sourcing anymore - "INCLUDE" all required files into this module during build
# --- INCLUDE *.ps1

Export-ModuleMember Disable-UAC, Enable-UAC, Get-UAC, Disable-InternetExplorerESC, Disable-GameBarTips, Get-ExplorerOptions, Set-TaskbarSmall, Install-WindowsUpdate, Move-LibraryDirectory, Enable-RemoteDesktop, Set-ExplorerOptions, Get-LibraryNames, Update-ExecutionPolicy, Enable-MicrosoftUpdate, Disable-MicrosoftUpdate, Set-StartScreenOptions, Set-CornerNavigationOptions, Set-WindowsExplorerOptions, Set-BoxstarterTaskbarOptions, Disable-BingSearch, Set-BoxstarterPageFile
