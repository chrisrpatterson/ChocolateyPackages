﻿Import-Module -Name (Join-Path -Path (Split-Path -Parent -Path $MyInvocation.MyCommand.Definition) -ChildPath 'VSServicing.psm1')

throw 'TODO: update ApplicationName'
Uninstall-VS `
    -PackageName 'visualstudio15enterprise' `
    -ApplicationName 'Microsoft Visual Studio Enterprise "15" TODO' `
    -UninstallerName 'vs_enterprise.exe'