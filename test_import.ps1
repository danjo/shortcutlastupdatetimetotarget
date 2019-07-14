$orig = $ENV:PSModulePath
$ENV:PSModulePath += ";."

try {
	import-module "ShortcutLastWriteTimeToTarget"
	get-command -noun ShortcutLastWriteTimeToTarget
	remove-module ShortcutLastWriteTimeToTarget
}
catch {
	write-error $_
}

$ENV:PSModulePath = $orig
