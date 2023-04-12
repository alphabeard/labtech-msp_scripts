# This script is built specifically for clients that have Hybrid 365 without an on-prem Exchange server.
# Please review and edit/delete anything unneeded for your use case.

# Prompt tech for the new user's first and last name
$firstName = Read-Host "Enter first name"
$lastName = Read-Host "Enter last name"

# Prompt tech to enter the new user's job title
$jobTitle = Read-Host "Enter job title"

# Prompt tech to enter the new user's department
$department = Read-Host "Enter department"

# Define variables
# These variables will need to be edited to fit a client's standards and AD environment
$username = ($firstName[0] + $lastName).ToLower()
$password = ConvertTo-SecureString "TempPassword" -AsPlainText -Force
$fullname = "$firstName $lastName"
$email = "$firstName.$lastName@Domain.com"
$ou = "OU=Users,DC=Domain,DC=com"
$proxyaddresses = @("SMTP:$firstName.$lastName@domain.com", "smtp:$username@domain.com")

# Check if the username is already in use
if (Get-ADUser -Filter "SamAccountName -eq '$username'" -ErrorAction SilentlyContinue) {
    Write-Host "Error: User with username '$username' already exists in Active Directory."
} else {
    # Create user
    New-ADUser `
    -Name $fullname `
    -GivenName $firstName `
    -Surname $lastName `
    -SamAccountName $username `
    -UserPrincipalName "$username@domain.com" `
    -AccountPassword $password `
    -Enabled $True `
    -ChangePasswordAtLogon $True `
    -EmailAddress $email `
    -Title $jobTitle `
    -Department $department `
    -Path $ou

    # Adds proxy addresses
    Set-ADUser -Identity $username -Add @{ProxyAddresses=$proxyaddresses}

    # Adds user to security groups
    Add-ADGroupMember -Identity "Group1" -Members $username
    Add-ADGroupMember -Identity "Group2" -Members $username

    # Output a message to confirm that the user has been created and provide any additional instructions for the tech to complete
    Write-Host "`n"
    Write-Host "User '$username' has been created."
    Write-Host "`n"
    Write-Host "User Object is located in the Users OU, please move the appropriate OU."
    Write-Host "`n"
    Write-Host "Assign user to the appropriate Manager if one was provided in the New Hire Request."
    Write-Host "`n"
    Write-Host "If additional security groups are needed, open the user in Active Directory Users and Computers and add the user to the groups."
    Write-Host "`n"
    Write-Host "365 Sync occurs every 40 minutes, once that runs you should see the User in 365 and be able to assign the 365 License"
}

# Prompts tech to press a key before closing the PowerShell window
Read-Host "Press any key to close..."