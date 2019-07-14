
rm -Force -Recurse "data" -ErrorAction Ignore
mkdir "data" | out-null

$wshell = New-Object -ComObject WScript.Shell
$wd = (pwd).Path
$old = (get-date).AddDays(-10)

# data
$sc = $wshell.CreateShortcut("$wd/data/link1.lnk")
$sc.TargetPath = "$wd/data/file1.txt"
$sc.save()
echo "file1" > "data/file1.txt"
(get-item "data/file1.txt").LastWriteTime = $old

$sc = $wshell.CreateShortcut("$wd/data/link2.lnk")
$sc.TargetPath = "$wd/data/file2.txt"
$sc.save()

# data/dir1
mkdir "data/dir1" | out-null

$sc = $wshell.CreateShortcut("$wd/data/dir1/link3.lnk")
$sc.TargetPath = "$wd/data/dir1/file3.txt"
$sc.save()
echo "file3" > "data/dir1/file3.txt"
(get-item "data/dir1/file3.txt").LastWriteTime = $old

$sc = $wshell.CreateShortcut("$wd/data/dir1/link4.lnk")
$sc.TargetPath = "$wd/data/dir1/file4.txt"
$sc.save()

