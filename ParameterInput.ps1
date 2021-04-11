.SYNOPSIS
   This Poweshell script is used for giving input parameters.  
  
 .DESCRIPTION
   This script will help while getting the initial parameters for the program    

 .EXAMPLE
   Just provide the input and see the results. The input will be stored in variables provided. 

#CmdletAddition
[CmdletBinding()]

  param (

  [Parameter(Mandatory = $True)]
  [string]$tenantKey,

  [Parameter(Mandatory = $True)]
  [string]$firstname,

  [Parameter(Mandatory = $True)]
  [string]$lastname,

[Parameter(Mandatory = $True)]
  [string]$IMEI

  )


  Write-Verbose ("Username is " + $tenantKey)
  Write-Verbose ("Username is " + $firstname)
  Write-Verbose ("Username is " + $lastnname)
  Write-Verbose ("Username is " + $IMEI)
