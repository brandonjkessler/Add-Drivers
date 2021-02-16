# Add-Drivers

## Prerequisites
* Requires Elevated Privileges to run.
* Requires PowerShell 5.1 on Windows.

## Synopsis
Installs drivers using the pnputil.exe application.

## Description
Installs .inf files using pnputil.exe in a specific path.  
Will recurse multiple levels based on parameter "Depth".  
Default Depth parameter is 1.  

## Parameters
* Path
  * Specific path where .inf files are stored.
* Depth
  * Depth of folders from the Path parameter to search through.

## Examples
    Add-Drivers -Path "$env:userprofile\Downloads\Drivers"

    Add-Drivers -Path "$env:userprofile\Downloads\Drivers" -Depth 3
