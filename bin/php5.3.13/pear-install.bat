@ECHO OFF
SETLOCAL EnableDelayedExpansion

TITLE Neard - PEAR Install

:: Relocate and create temp dir (workaround for permission issue)
SET TEMP=%~dp0\tmp-pear
IF NOT EXIST "%TEMP%" MKDIR "%TEMP%"

:: Properties
SET currentPath=%~dp0
SET task=%1
SET installVbs=%TEMP%\pear_install.vbs
SET downloadUrl=http://pear.php.net/go-pear.phar



:: Check if the menu selection is provided as a command line parameter
IF NOT "%task%"=="" GOTO ACTION



::::::::::::::::::::::::::::::::::::::::
:MENU
::::::::::::::::::::::::::::::::::::::::
CLS
ECHO.
ECHO # Neard - PEAR Install
ECHO.

ECHO  1 - Install
ECHO  9 - Exit
ECHO.
SET /P task=Choose a task: 
ECHO.



::::::::::::::::::::::::::::::::::::::::
:ACTION
::::::::::::::::::::::::::::::::::::::::
IF %task% == 1 GOTO INSTALL
IF %task% == 9 GOTO EXIT
GOTO MENU



::::::::::::::::::::::::::::::::::::::::
:INSTALL
::::::::::::::::::::::::::::::::::::::::

:: Check if PEAR is installed
::IF EXIST "%phpPath%\pear" ECHO PEAR is already installed... && GOTO EOF

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

:: Execute go-pear.phar
ECHO Install PEAR...
%currentPath%\php.exe -c php-pear.ini "%TEMP%\go-pear.phar"

:: Finish installation
::ECHO.
::IF EXIST "%nodejsPath%\node.exe" ECHO node.js successfully installed in '%nodejsPath%'
::IF NOT EXIST "%nodejsPath%\node.exe" ECHO An error occurred during the installation.
::GOTO PREPARE
GOTO EOF


::::::::::::::::::::::::::::::::::::::::
:PREPARE
::::::::::::::::::::::::::::::::::::::::

:: Relocate and edit NPM global config file
ECHO prefix = %nodejsPath%\ >%npmGlobalConfigFilePath%
ECHO globalconfig = %npmPath%\npmrc >>%npmGlobalConfigFilePath%
ECHO globalignorefile = %npmPath%\npmignore >>%npmGlobalConfigFilePath%
ECHO init-module = %npmPath%\init.js >>%npmGlobalConfigFilePath%
ECHO cache = %npmPath%\cache >>%npmGlobalConfigFilePath%

IF NOT EXIST "%nodejsWork%" MKDIR "%nodejsWork%"
IF NOT EXIST "%npmPath%\npmignore" ECHO. 2>"%npmPath%\npmignore"
IF NOT EXIST "%npmPath%\init.js" ECHO. 2>"%npmPath%\init.js"
IF NOT EXIST "%npmPath%\cache" MKDIR "%npmPath%\cache"
IF %nodejsTask% == 1 SET nodejsTask=0 && GOTO LAUNCH
GOTO EOF



::::::::::::::::::::::::::::::::::::::::
:EOF
::::::::::::::::::::::::::::::::::::::::

ECHO.
PAUSE
GOTO MENU



::::::::::::::::::::::::::::::::::::::::
:EXIT
::::::::::::::::::::::::::::::::::::::::

RMDIR /s /q "%TEMP%"
ENDLOCAL
