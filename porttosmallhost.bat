@echo off
title Github to SmallHost
echo You will be asked to enter your SmallHost username and password. Ensure you are not sharing your screen and that no one can see your username and password.
echo.
echo Enter the Username/RepoName you want to port over to SmallHost.
set /p reponame=
echo.
echo Enter your SmallHost username.
set /p smallhostuser=
echo.
echo Enter your SmallHost password. THIS WILL NOT APPEAR AS DOTS OR DASHES ON YOUR SCREEN, MAKE SURE YOU DO NOT SHARE THIS!
set /p smallhostpass=
echo.
echo If you want to DEPLOY TO THE *.SMALLHOST.US.TO SUBDOMAIN YOU GOT AT SIGNUP, type /htdocs
echo If you want to DEPLOY TO A DOMAIN/SUBDOMAIN YOU SAT UP ON THE CPANEL, type /, then the URL then /htdocs (example: /printer.smallhost.us.to/htdocs)
set /p smallhostdir=
goto dl 

:dl
cls
title Downloading repo %reponame%...
bitsadmin.exe /transfer "Downloading repo" /priority high https://github.com/%reponame%/archive/refs/heads/main.zip C:\Users\%USERNAME%\Downloads\ghtosh-result.zip
cls
cd C:\Users\%USERNAME%\Downloads
IF EXIST ghtosh-result.zip (
    goto ftpconn
) ELSE (
    title Oops! Retrying download...
    echo The repo did not download successfully. This isn't your fault, probabally just your internet dropping for a second. Retrying download...
    TIMEOUT /T 5 /NOBREAK
    goto dlagain
)

:dlagain
goto dl

:ftpconn
echo.
title Transferring to SmallHost...
echo Contacting SmallHost FTP Server via WinSCP...
cd C:\Program Files (x86)\WinSCP
set MyPath=C:\Users\%USERNAME%\Downloads\ghtosh-result.zip
winscp.com /command ^
    "open ftp://"%smallhostuser%":"%smallhostpass%"@ftp.smallhost.us.to" ^
    "cd %smallhostdir%" ^
    "put ""%MyPath%""" ^
    "exit"
cd C:\Users\%username%\Downloads
echo Cleaning up...
del ghtosh-result.zip
echo.
title Transfer complete
echo The transfer has been completed. Feel free to read the log above.
echo To extract the ZIP and apply it to your site: Login to SmallHost at https://smallhost.us.to/my/auth.php, click File Manager, enter the directory, rightclick the ZIP and click Extract.
echo Thank you for choosing SmallHost!
pause
https://smallhost.us.to/my/auth.php
exit
