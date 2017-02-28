﻿function Generate-UninstallArgumentsString
{
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [hashtable] $parameters,
        [string] $logFilePath,
        [switch] $assumeNewVS2017Installer
    )
    Write-Debug "Running 'Generate-UninstallArgumentsString' with logFilePath:'$logFilePath', assumeNewVS2017Installer:'$assumeNewVS2017Installer'";
    if ($assumeNewVS2017Installer)
    {
        if ($logFilePath -ne '')
        {
            Write-Warning "The new VS 2017 installer does not support setting the path to the log file yet."
        }

        $argumentSet = $parameters.Clone()
        $argumentSet['norestart'] = ''
        if (-not $argumentSet.ContainsKey('quiet') -and -not $argumentSet.ContainsKey('passive'))
        {
            $argumentSet['quiet'] = ''
        }

        $s = '/uninstall ' + (($argumentSet.GetEnumerator() | ForEach-Object { '--{0} {1}' -f $_.Key, $_.Value }) -f ' ')
    }
    else
    {
        $s = "/Uninstall /Force /Quiet /NoRestart"
        if ($logFilePath -ne '')
        {
            $s = $s + " /Log ""$logFilePath"""
        }
    }

    return $s
}