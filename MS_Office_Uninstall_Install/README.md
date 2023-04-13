# MS Office Uninstall and Install
To help with bulk migrations of Office 16/19 to Office 365 I created a series of LabTech Scripts to accomplish this.

For uninstalling the versions of Office 2016 and 2019 I had to work with the Office Deployment Tool(ODT) did not work.  As such I had to target the setup.exe related to the version of Office installed in order to uninstall.

I do use the ODT for deploying Office 365.

*I can't guarantee these will work for all versions of Office 2016/2019 as I did not have multiple versions to test with, some modification may be required for your usage.*

## Setup.exe and .xml Locations
The clients I used these at had a Network Share where Software Installers were kept.  So I copied the xml files to the folder with the setup files for the related version of Office. 

I then called that network share in the LabTech scripts.  

If you have a client without a suitable network share it should be simple enough to add to the files to your LT Server and then download the files locally.

## Office Standard 2016 Uninstall LabTech Script
1. Create New LabTech Script
2. Function 1: Shell as Admin
    1. Command: "Location of the Office Standard 2016 setup.exe" /uninstall Standard /config "Location of UninstallO16.xml"
3. Function 2: Reboot Forced

## Office Standard 2019 Uninstall LabTech Script
1. Create New LabTech Script
2. Function 1: Shell as Admin
    1. Command: "Location of Office2019 setup.exe" /configure "Location of UninstallO19.xml"
3. Function 2: Reboot Forced

## Install 365 LabTech Script
1. Create New LabTech Script
2. Function 1: Shell as Admin
    1. Command: "Location of ODT O365ProPlusRetail setup.exe" /configure "Location of ODT configuration-O365ProPlusRetail-x64.xml"
3. Function 2: Reboot Forced
