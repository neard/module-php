@ECHO OFF
SETLOCAL EnableDelayedExpansion

TITLE Neard - PEAR Install

:: Relocate and create temp dir (workaround for permission issue)
SET TEMP=%~dp0\tmp
IF NOT EXIST "%TEMP%" MKDIR "%TEMP%"

:: Properties
SET currentPath=%~dp0
FOR %%a IN ("%~dp0\.") DO FOR %%b IN ("%%~dpa\.") DO SET phpPath=%%~dpnxb
SET installVbs=%TEMP%\pear_install.vbs
SET downloadUrl=http://pear.php.net/go-pear.phar
SET PHP_BIN=%phpPath%\php.exe
SET PHP_PEAR_SYSCONF_DIR=%phpPath%\pear

CLS
ECHO.
ECHO # Neard - PEAR Install
ECHO.

:: Check if PEAR is installed
IF EXIST "%phpPath%\pear\pear.bat" ECHO PEAR is already installed... && GOTO EXIT
IF EXIST "%phpPath%\pear" RMDIR /s /q "%phpPath%\pear"

:: Create folder
MKDIR "%phpPath%\pear"
pushd "%phpPath%\pear"

IF EXIST "%currentPath%\go-pear.phar" GOTO LOCAL_FILE
IF NOT EXIST "%currentPath%\go-pear.phar" GOTO REMOTE_FILE

:LOCAL_FILE
COPY /Y "%currentPath%\go-pear.phar" "%TEMP%\go-pear.phar" >NUL
GOTO INSTALL

:REMOTE_FILE
:: Prepare cscript to download go-pear.phar
ECHO WScript.StdOut.Write "Download " ^& "%downloadUrl%" ^& " ">%installVbs%
:: Switched to 'WinHttp.WinHttpRequest.5.1'
ECHO dim http: set http = createobject("WinHttp.WinHttpRequest.5.1") >>%installVbs%
IF DEFINED proxyUrl ECHO http.SetProxy 2, "%proxyUrl%", "localhost" >>%installVbs%
ECHO dim bStrm: set bStrm = createobject("Adodb.Stream") >>%installVbs%
:: Open in asynchronous mode.
ECHO http.Open "GET", "%downloadUrl%", True >>%installVbs%
IF DEFINED proxyUser IF DEFINED proxyPwd ECHO http.SetCredentials "%proxyUser%", "%proxyPwd%", "1" >>%installVbs%
ECHO http.Send >>%installVbs%
:: Every second write a '.' until the download is complete
ECHO while http.WaitForResponse(0) = 0 >>%installVbs%
ECHO   WScript.StdOut.Write "." >>%installVbs%
ECHO   WScript.Sleep 1000 >>%installVbs%
ECHO wend >>%installVbs%
:: ECHO WScript.StdOut.Write vbCRLF >>%installVbs%
:: Write the HTTP status code onto console
ECHO WScript.StdOut.WriteLine " [HTTP " ^& http.Status ^& " " ^& http.StatusText ^& "]" >>%installVbs%
ECHO with bStrm >>%installVbs%
ECHO .type = 1 '//binary >>%installVbs%
ECHO .open >>%installVbs%
ECHO .write http.responseBody >>%installVbs%
ECHO .savetofile "%TEMP%\go-pear.phar", 2 >>%installVbs%
ECHO end with >>%installVbs%

:: Download latest version in the current folder
cscript.exe /NoLogo %installVbs%
GOTO INSTALL

:INSTALL
ECHO Installing PEAR...
ECHO Select local installation and do not alter php.ini at the end of the installation.
ECHO.

COPY /Y "%phpPath%\php.ini" "%phpPath%\php.ini.backup" >NUL
COPY /Y "%currentPath%\php-pear.ini" "%phpPath%\php.ini" >NUL

ECHO Exec go-pear.phar
ECHO ================================================
%phpPath%\php.exe -c "%phpPath%\php.ini" "%TEMP%\go-pear.phar"
ECHO.

ECHO Exec pear-install.php
ECHO ================================================
%phpPath%\php.exe -c "%phpPath%\php.ini" "%currentPath%\pear-install.php" "%phpPath%"

COPY /Y "%phpPath%\php.ini.backup" "%phpPath%\php.ini" >NUL
DEL /F "%phpPath%\php.ini.backup" >NUL

:EXIT
RMDIR /s /q "%TEMP%"
ECHO.
PAUSE
ENDLOCAL
