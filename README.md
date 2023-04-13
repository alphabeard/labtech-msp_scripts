# labtech-msp_scripts
Repo is going to mostly be Labtech/ConnectWise Automate and PowerShell Scripts that I have found useful.

I will have README.md files in each folder to provide details of what is being done as well as info regarding LabTech utilization.

## LabTech PowerShell Script Implementation
Due to not having much luck with the LabTech PowerShell function I use LabTech to write the PowerShell script locally, call it, then delete it when completed.

This is normally accomplished by a 3 function LabTech Script.

1. Create a new LabTech script.
2. Function 1: File Write Text
    1. Text File: Location on the target PC you want the file created on ***Example: c:\Temp\script.ps1***
    2. Data: Copy the PowerShell script into this field.
3. Function 2: LabTech Command
    1. Command: 2
    2. Parameters: CMD!!!/C "CD /D "%windir%\system32" && powershell.exe -ExecutionPolicy Bypass -File "Location specified above in Step 2.1""
    3. Group List: Leave Blank
    4. ID: %ComputerID%
    5. ID Type: Location
4. Function 3: Delete File as Admin
    1. File Path: Location specified in Step 2.1