# MS Office Uninstall and Install
To help with bulk migrations of Office 16/19 to Office 365 I created a series of LabTech Scripts to accomplish this.

I also use the Install 365 script when deploying 365 to new PCs to make sure the proper version of 365 Desktop Apps is installed.

## Office 2016 and 2019 Setup.exe and .xml Locations
For uninstalling the versions of Office 2016 and 2019 the Office Deployment Tool(ODT) did not work.  As such I had to target the setup.exe related to the version of Office installed in order to uninstall.

The clients I used these at had a Network Share where Office 2016/2019 Installers were kept.  So I copied the xml files to the folder with the setup files for the related version of Office. 

I then called that network share in the LabTech scripts.  

If you have a client without a suitable network share it should be simple enough to add to the files to your LT Server and then download the files locally.

*I can't guarantee these will work for all versions of Office 2016/2019 as I did not have multiple versions to test with, some modification may be required for your usage.*

## Office Standard 2016 Uninstall LabTech Script
1. Create New LabTech Script
2. Function 1: Shell as Admin
    1. Command: "Location of the Office Standard 2016 setup.exe" /uninstall Standard /config "Location of O16_Uninstall.xml"
3. Function 2: Reboot Forced

## Office Standard 2019 Uninstall LabTech Script
1. Create New LabTech Script
2. Function 1: Shell as Admin
    1. Command: "Location of Office2019 setup.exe" /configure "Location of O19_Uninstall.xml"
3. Function 2: Reboot Forced

## Install 365 LabTech Script *Uninstalls the Preloaded 365 Apps common on new PCs*
In the example below I am calling the xml for O365 Enterprise apps, I have added the O365 Business apps xml to the repo.

1. Create New LabTech Script
2. Function 1: Folder Create
    1. Folder: %windir%\LTSVC\Client\Software\O365
3. Function 2: File Download (Forced)
    1. Local File: LT Server Location\setup.exe
    2. Destination Path: %windir%\LTSVC\Client\software\O365\setup.exe
4. Function 3: File Download (Forced)
    1. Local File: LT Server Location\365PreLoad_Uninstall.xml
    2. Destination Path: %windir%\LTSVC\Client\software\O365\365PreLoad_Uninstall.xml
5. Function 4: File Download (Forced)
    1. Local File: LT Server Location\O365Enterprise_Install.xml
    2. Destination Path: %windir%\LTSVC\Client\software\O365\O365Enterprise_Install.xml
6. Function 5: Shell
    1. Command: "C:\Windows\LTSvc\Client\Software\O365\setup.exe" /configure "C:\Windows\LTSvc\Client\Software\O365\O365PreLoad_Uninstall.xml"
7. Function 6: Shell
    1. Command: "C:\Windows\LTSvc\Client\Software\O365\setup.exe" /configure "C:\Windows\LTSvc\Client\Software\O365\O365Enterprise_Install.xml"