$EmailTo = 'Marco.Lopes@nexus-ag.de'
$EmailFrom = "DevOps.Medication@nexus-ag.de"
$Subject = "Webservice Docs" 
$Body = "
Your webservice has been deployed
"
$pathToFile="$env:BUILD_ARTIFACTSTAGINGDIRECTORY/docs.zip"

Write-Output $pathToFile

$SMTPServer = "exchange.nexus-ag.de" 
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($pathToFile)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 25) 
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("DevOps.Medication@nexus-ag.de", $pathToFile)
Write-Output $Body 
$SMTPClient.Send($SMTPMessage)