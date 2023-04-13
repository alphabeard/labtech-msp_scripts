# Create RRAS VPN Profile for All Users
For clients that use RRAS for VPN I have created a one function LabTech Script to create a VPN Profile for All Users.

## LabTech Script
1. Create New Script
2. Function 1: PowerShell Command
    1. Command: Add-VpnConnection -Name "Company VPN" -ServerAddress "PublicIP/FQDN" -TunnelType "Sstp/L2tp/PPTP" -EncryptionLevel "Required" -AuthenticationMethod MSChapv2 -AllUserConnection -RememberCredential

### Notes
This script will need modified based on your clients VPN Config.

*Example: If you have a client using L2TP you will need to add the -L2tpPsk PassWord@2021 to the PowerShell command.*