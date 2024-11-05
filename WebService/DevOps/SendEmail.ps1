$EmailTo = 'Marco.Lopes@nexus-ag.de'
$EmailFrom = "DevOps.Medication@nexus-ag.de"
$Subject = "Webservice Docs" 
$Body = "
Your webservice has been deployed
"

$SMTPServer = "exchange.nexus-ag.de" 
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($env:FilenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 25) 
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("DevOps.Medication@nexus-ag.de", $env:EmailPassword)
Write-Output $Body 
$SMTPClient.Send($SMTPMessage)