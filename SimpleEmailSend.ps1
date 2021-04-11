.SYNOPSIS
   This Poweshell script was used by me for sending email in the past to the end-users.  
  
 .DESCRIPTION
   There are many cases were you can automate a lot of stuff. But you have to write some trigger to inform the end users regarding the admin actions. Such email script can work in such scenarios. Tough now a days scripts Scripts like "Google Apps Script" works a lot better in many ways. 

 .EXAMPLE
   Simply provide your credentials. And then format the message and the destination addresses. Multiple destination addresses can be given as well. 

#Provides username here (Dummy email example here)
$User = "khurramorwhatever@xxxx.com"

Provides password here:: Dummy Password example here
[string]$pass= 'abc!1234'

#File where the password can be stored.(Hash is always the better than plain text). 
$File = 'C:\Users\***\***\Sourcefile.txt'

Complementary way to store the password at the secure location to call later. (Dummy password example) 
"abc!1234" | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString | Out-File "C:\Users\kjamil\Desktop\EmailPassword.txt"


#[string]$user= (Get-Content "C:\Users\kjamil\Desktop\ded.txt" -TotalCount 2)[0]
#$rr= (Get-Content "C:\****\****\***\Sourcefile.txt" -TotalCount 2)[1]

 #Creating an object to get the credential from the file. 
#$cred=New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, (Get-Content $File | ConvertTo-SecureString)

#Email address is provided here (Dummy email example here)
$EmailAddressTo = "mustermann@abc.com"
#You can specify that the user will see what destination. 
$EmailFrom = "test.erika.mustermann@abc.com"

#Email Subject
$Subject = "Check Check"

#Email Body
$Body = "Check check check"

#Here the Gmail server is specified. But other email services can be used as well. 

$SMTPServer ="smtp.gmail.com"

#Any accompanying file that I want to send. 
#$filenameAndPath = "C:\fileIwantToSend.csv"

#SMTP mail protocol message object creation and argument passing in powershell. 
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
#$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
#$SMTPMessage.Attachments.Add($attachment)

#SMTP client object creation to send the mails finally. 
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($cred.UserName, $cred.Password);
$SMTPClient.Send($SMTPMessage)
