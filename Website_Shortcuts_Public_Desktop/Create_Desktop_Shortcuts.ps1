# Create a new instance of the WScript.Shell COM object
$WshShell = New-Object -ComObject WScript.Shell

# Define an array of hash tables representing the shortcuts to create
$Shortcuts = @(
    @{
        Name = "Webmail" # The name of the shortcut file
        URL = "https://outlook.office.com" # The target URL of the shortcut
    },
    @{
        Name = "Website 2"
        URL = "https://www.example.org"
    }
)

# Iterate over the array of shortcuts
foreach ($Shortcut in $Shortcuts) {
    # Create a new shortcut object for the current shortcut
    $ShortcutObject = $WshShell.CreateShortcut("$env:PUBLIC\Desktop\$($Shortcut.Name).url")
    # Set the target URL of the shortcut
    $ShortcutObject.TargetPath = $Shortcut.URL
    # Save the shortcut to the public desktop
    $ShortcutObject.Save()
}