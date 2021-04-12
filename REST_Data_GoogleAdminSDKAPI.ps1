.SYNOPSIS
   This Poweshell script was used by me for retrieving the REST API Data from Google APIs.  
  
 .DESCRIPTION
   You must know the OAuth Token that you retrieve after the handshake of OAuth Authorization and Authentication. 

 .EXAMPLE
   Simply run this script in Powershell and that is it.  

#Creation of the System Collection Object to Save the Data
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"

#Adding the Authorization Bearer Headed Information here. This token is the token that you retrieve after the OAuth Authorization and Authentication
$headers.Add("Authorization", "Bearer yaXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")

#Invoking the RestMethod to finally retrieve the data from the Google APIs. 
$response = Invoke-RestMethod 'https://www.googleapis.com/admin/directory/v1/customer/C03f1nnmj/devices/mobile' -Method 'GET' -Headers $headers -Body $body 

#Convert to Json to work on this data. I am retrieving the data and saving it in a specified to manipulate that data later. 
$response | ConvertTo-Json

#-FollowRelLink -MaximumFollowRelLink 2


