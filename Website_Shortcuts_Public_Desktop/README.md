# Create_Desktop_Shortcuts
PowerShell script that can be used to create url shortcuts on the desktop.

## Use Case
It is becoming more common for clients to be utilizing cloud/web apps.  As such I have found that being able to create the necessary shortcuts to various cloud/web resources has been helpful for clients, as many are more comfortable with desktop shortcuts over using the browser favorites bar especially when that fills up.

## LabTech Script Setup
1. Create a new script.
2. Function 1: File Write Text
    1. Text File: Location on the target PC you want the file created on ***Example: c:\Temp\Create_Desktop_Shortcuts.ps1***
    2. Data: Copy the PowerShell script into this field.
3. Function 2: LabTech Command
    1. Command: 2
    2. Parameters: CMD!!!/C "CD /D "%windir%\system32" && powershell.exe -ExecutionPolicy Bypass -File "Location specified above in Step 2.1""
    3. Group List: Leave Blank
    4. ID: %ComputerID%
    5. ID Type: Location
4. Function 3: Delete File as Admin
    1. File Path: Location specified in Step 2.1
