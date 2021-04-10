
 .SYNOPSIS
   This Poweshell script simply calls the parameters that you are saving locally on your computer or the server.  
  
 .DESCRIPTION
   There are many instances where you have to call parameters for general testing and running scripts. This approach should not be followed for any production code. Especially the passwords and other important parameters should never be called or saved in simple text files. 

 .EXAMPLE
   Simply create a .txt file. and save it where you want to save it. Then simply give the path @ $file = "myfile.txt". In my case it was $file = ".\params.ini.txt". But the path could be any other path.
I was calling three parameters that were username, password and the tenant code. But you can call any other parameter after saving in the text file. 

#Provide the filename here
$file = ".\params.ini.txt"

#if the path exists. Exception will be handled later
Test-Path -Path ".\params.ini.txt"

Get-Content "$file" | ForEach-Object -Begin {$settings=@{}} -Process {$store = [regex]::split($_,'='); if(($store[0].CompareTo("") -ne 0) -and ($store[0].StartsWith("[") -ne $True) -and ($store[0].StartsWith("#") -ne $True)) {$settings.Add($store[0], $store[1])}}
$Param1 = $settings.Get_Item("user")
$Param2 = $settings.Get_Item("pass")
$tenant1 = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

#Displaying the parameters

$Param0 = (Get-Content .\parameters.txt)[0]
$Param1 = (Get-Content .\parameters.txt)[1]
$tenant = (Get-Content .\parameters.txt)[2]
Write-Host "username: $Param1";
Write-Host "password: $Param2";
Write-Host "tenant: $Param3";

