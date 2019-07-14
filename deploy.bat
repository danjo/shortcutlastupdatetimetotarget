set DIR=ShortcutLastWriteTimeToTarget

robocopy /MIR /R:0 ^
	%DIR% ^
	%HOMEDRIVE%%HOMEPATH%\Documents\WindowsPowerShell\Modules\%DIR%

robocopy /MIR /R:0 ^
	%DIR% ^
	%HOMEDRIVE%%HOMEPATH%\Documents\PowerShell\Modules\%DIR%
