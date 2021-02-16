#Requires -RunAsAdministrator
<#
    .SYNOPSIS
    Installs drivers using the pnputil.exe application.

    .DESCRIPTION
    Installs .inf files using pnputil.exe in a specific path.  
    Will recurse multiple levels based on parameter "Depth".  
    Default Depth parameter is 1.

    .PARAMETER Path
    Specific path where .inf files are stored.

    .PARAMETER Depth
    Depth of folders from the Path parameter to search through.

    .INPUTS
    Accepts inputs from pipeline that are Path and Depth.

    .OUTPUTS
    None.

    .EXAMPLE
    Add-Drivers -Path "$env:userprofile\Downloads\Drivers"

    .EXAMPLE
    Add-Drivers -Path "$env:userprofile\Downloads\Drivers" -Depth 3


    .LINK
    Get-ChildItem
    Select-Object
    For-EachObject
#>


[CmdletBinding()]
param(
    [Parameter(Mandatory,ValueFromPipelineByPropertyName,
    HelpMessage='Path where driver .inf files are stored.')]
    [String]
    $Path,
    [Parameter(ValueFromPipelineByPropertyName,
    HelpMessage='Depth to search for .inf files. Default is 1.')]
    [String]
    $Depth = 1

)

Get-ChildItem -Path $Path -Filter "*.inf" -Recurse -Depth $Depth -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Fullname | ForEach-Object{
    cmd /c "pnputil.exe -a $_"
}