@echo off
color a
echo Checking if script contains Administrative rights...
net sessions
if %errorlevel%==0 (
echo Success!
) else (
echo No admin, please run with Administrative rights you stupid...
pause
exit
)
:MENU
echo Choose An option:
echo 1. Security Policies and Registry entries
echo 2. Stops sharing on all drives except default
echo 3. Find Files .MP4 .Jpg .Exe ...ect 
echo 4. stop services ex FTP, Spooler, RDP ...ect

CHOICE /C 1234 /M "Enter your choice:"
if ERRORLEVEL 4 goto Four
if ERRORLEVEL 3 goto Three
if ERRORLEVEL 2 goto Two
if ERRORLEVEL 1 goto One

:One

secedit.exe /export /cfg "C:\Users\%username%\desktop\script0.2.3\windows script\old.inf"

secedit.exe /configure /db %windir%\security\local.sdb /cfg "C:\Users\%username%\desktop\script0.2.3\windows script\master.inf"

net accounts /maxpwage:30
net accounts /minpwage:10
net accounts /minpwlen:14
net accounts /lockoutduration:30
net accounts /lockoutthreshold:5
net accounts /lockoutwindow:30
net accounts /uniquepw:24

netsh advfirewall set allprofiles state on

net user Guest /active:no

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 3 /f

C:\Windows\System32\cmd.exe /k %windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f

reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DisableCAD" /t REG_DWORD /d 0 /f

reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DontDisplayLastUserName" /t REG_DWORD /d 1 /f
pause
cls
goto MENU


:Two
REM Stops sharing of the C drive
net share C:\ /DELETE
net share D:\ /DELETE
net share E:\ /DELETE
net share F:\ /DELETE
net share G:\ /DELETE
net share H:\ /DELETE
net share I:\ /DELETE
net share O:\ /DELETE
net share
echo type the drive letter or folder path with the \ at the end
echo If there is a drive here type "net share "Drive letter" \ /DELETE"
pause
goto MENU

:Four
REM stops services
sc config "ftpsvc" start= disabled
sc stop "ftpsvc"
sc config "wuauserv" start= automatic
sc start "wuauserv"
sc config "Spooler" start= disabled
sc stop "Spooler"
sc config "RemoteRegistry" start= disabled
sc stop "RemoteRegistry"
sc config "upnphost" start= disabled
sc stop "upnphost"
sc config "TapiSrv" start= disabled
sc stop "TapiSrv"
sc config "SSDPSRV" start= disabled
sc stop "SSDPSRV"
sc config "SNMPTRAP" start= disabled
sc stop "SNMPTRAP"
sc config "LanmanServer" start= disabled
sc stop "LanmanServer"
sc config "lmhosts" start= disabled
sc stop "lmhosts"
sc config "SessionEnv" start= disabled
sc stop "SessionEnv"
sc config "TermService" start= disabled
sc stop "TermService"
sc config "UmRdpService" start= disabled
sc stop "UmRdpService"
sc config "iprip" start= disabled
sc stop "iprip"
pause 
goto Menu



:Three
REM Find file
@echo off
color a
cls
echo Flashing Disk to .flashed Files to reference....
dir /b /s "C:\Program Files\" > programfiles.flashed
dir /b /s "C:\Program Files (x86)\" >> programfiles.flashed
echo Program Files flashed
dir /b /s "C:\Users\" > users.flashed
dir /b /s "C:\Documents and Settings" >> users.flashed
echo User profiles flashed
dir /b /s "C:\" > c.flashed
echo C:\ Flashed
pause
echo "Finding media files in C:\Users and/or C:\Documents and Settings..."
findstr .mp3 users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.mp3 > media_audio
findstr .ac3 users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.ac3 >> media_audio
findstr .aac users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.aac >> media_audio
findstr .aiff users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.aiff >> media_audio
findstr .flac users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.flac >> media_audio
findstr .m4a users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.m4a >> media_audio
findstr .m4p users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.m4p >> media_audio
findstr .midi users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.midi >> media_audio
findstr .mp2 users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.mp2 >> media_audio
findstr .m3u users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.m3u >> media_audio
findstr .ogg users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.ogg >> media_audio
findstr .vqf users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.vqf >> media_audio
findstr .wav users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.wav >> media_audio
findstr .wma users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.wma >> media_video
findstr .mp4 users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.mp4 >> media_video
findstr .avi users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.avi >> media_video
findstr .mpeg4 users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.mpeg4 >> media_video
findstr .gif users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.gif >> media_pics
findstr .png users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.png >> media_pics
findstr .bmp users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.bmp >> media_pics
findstr .jpg users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.jpg >> media_pics
findstr .jpeg users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.jpeg >> media_pics
findstr .exe users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.exe >> potential_hack
findstr .cfg users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.cfg >> potential_hack

C:\WINDOWS\system32\notepad.exe media_video
C:\WINDOWS\system32\notepad.exe media_audio
C:\WINDOWS\system32\notepad.exe media_pics
C:\WINDOWS\system32\notepad.exe potential_hack

timeout 1
echo Finding Hacktools now...
findstr "Cain" programfiles.flashed
if %errorlevel%==0 (
echo Cain detected. Please take note, then press any key.
pause >NUL
)
cls
findstr "nmap" programfiles.flashed
if %errorlevel%==0 (
echo Nmap detected. Please take note, then press any key.
pause >NUL
)
cls
findstr "keylogger" programfiles.flashed
if %errorlevel%==0 (
echo Potential keylogger detected. Please take note, then press any key.
pause >NUL
)
cls
findstr "Armitage" programfiles.flashed
if %errorlevel%==0 (
echo Potential Armitage detected. Please take note, then press any key.
pause >NUL
)
cls
findstr "Metasploit" programfiles.flashed
if %errorlevel%==0 (
echo Potential Metasploit framework detected. Please take note, then press any key.
pause >NUL
)
cls
findstr "Shellter" programfiles.flashed
if %errorlevel%==0 (
echo Potential Shellter detected. Please take note, then press any key.
pause >NUL
)
cls
goto MENU
