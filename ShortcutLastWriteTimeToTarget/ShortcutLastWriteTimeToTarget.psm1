$wshell = New-Object -ComObject WScript.Shell

function Update-ShortcutLastWriteTimeToTarget {
	param(
		[String[]]$Path,
		[switch]$Recurse
	)

	path_type_up $Path $Recurse
}

function path_type_up($path, $recurse) {
	if ($null -eq $path) {
		write-host "path is null"
		return
	}
	elseif ((test-path $path) -eq $false) {
		write-host "path not exist: $path"
		return
	}

	$rPaths = Resolve-Path $path
	foreach ($rPath in $rPaths) {
		type_up $rPath $recurse
	}
}

function type_up($rpath, $recurse) {
	if (Test-Path -PathType Leaf $rpath) {
		$item = get-item -path $rpath
		if ($item.Extension -ne ".lnk") {
			Write-Host "not lnk file: $rpath"
			return
		}
		up $item
	}
	elseif (Test-Path -PathType Container $rpath) {
		if ($recurse -eq $true) {
			$items = Get-ChildItem -Recurse $rpath
		}
		else {
			$items = Get-ChildItem $rpath
		}
		$items | ? { $_.Extension -eq ".lnk" } | % { up $_ }
	}
	else {
		Write-Host "type error: $rpath"
		return
	}
}

function up ($item) {
	write-host "* $item"

	$fp = $item.FullName
	$sc = $wshell.CreateShortcut($fp)
	$tp = $sc.TargetPath
	# write-host "** $fp -> $tp"

	if ((test-path $tp) -eq $false) {
		write-host "! $item -> $tp"
		return
	}

	$target = get-item -Path $tp
	$lwt = $target.LastWriteTime

	$scfile = get-item $sc.FullName
	$scfile.LastWriteTime = $lwt
}

Export-ModuleMember -Function Update-ShortcutLastWriteTimeToTarget
