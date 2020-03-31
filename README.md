# sltt - ShortcutLastWriteTimeToTarget
Windows shortcut(.lnk) file's LastWriteTime update to target's one.

# Target Environments
Powershell 7.x and Windows Powershell 5.x on Windows10 64bit.

# CLI Usage
## how to run
### when module installed
    Update-ShortcutLastWriteTimeToTarget [-Recurse] [<path>]

### when download release zip/repo
    cd /path/to/sltt
    using module "ShortcutLastWriteTimeToTarget/ShortcutLastWriteTimeToTarget.psm1"
    Update-ShortcutLastWriteTimeToTarget [-Recurse] [<path>]

## argument samples
update a file

    Update-ShortcutLastWriteTimeToTarget someFile.lnk

update files with wildcard

    Update-ShortcutLastWriteTimeToTarget *.lnk

.lnk files in a folder

    Update-ShortcutLastWriteTimeToTarget anyDir

.lnk files in a folder, including subfolder items

    Update-ShortcutLastWriteTimeToTarget -Recurse anyDir
