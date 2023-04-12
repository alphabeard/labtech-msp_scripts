# AD_New_User_Script
PowerShell script that can be copied to a clients AD server to assist techs in creating a new user account.

*Script is configured for clients with Hybrid 365 without an on-prem Exchange Server.  This requires some things like email aliases to be added in the Attribute Editor, so to save techs some time and reduce typos I created this script.*  

##  Tech Guide

1. Login to client's AD server.
2. Locate the script.
3. Right-click and select Run with PowerShell.
4. Input the information requested when prompted.
5. If the username is taken the script will inform you and close out.
6. If the username is not in use the script will inform you the user was created and will present you with any remaining steps that need to be performed manually.