using module "ShortcutLastWriteTimeToTarget/ShortcutLastWriteTimeToTarget.psm1"

echo "== 1"
$file = "./data/link1.lnk"
Update-ShortcutLastWriteTimeToTarget $file

echo "== 2"
$wrongfile = "./data/file1.txt"
Update-ShortcutLastWriteTimeToTarget $wrongfile

echo "== 3"
$nofile = "./data/nofile.txt"
Update-ShortcutLastWriteTimeToTarget $nofile

echo "== 4"
$dir = "./data"
Update-ShortcutLastWriteTimeToTarget $dir

echo "== 5"
Update-ShortcutLastWriteTimeToTarget -Recurse $dir

echo "== 6"
$wildcard = "./data/*.lnk"
Update-ShortcutLastWriteTimeToTarget $wildcard

remove-module ShortcutLastWriteTimeToTarget
