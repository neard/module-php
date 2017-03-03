@ECHO OFF
SETLOCAL EnableDelayedExpansion

SET pharFile=install-pear-nozlib.phar

:: Relocate and create temp dir (workaround for permission issue)
SET TEMP=%~dp0\tmp
IF NOT EXIST "%TEMP%" MKDIR "%TEMP%"

:: Properties and env vars
SET currentPath=%~dp0
FOR %%a IN ("%~dp0\.") DO FOR %%b IN ("%%~dpa\.") DO SET phpPath=%%~dpnxb
SET PHP_BIN=%phpPath%\php.exe
SET PHP_PEAR_PHP_BIN=%phpPath%\php.exe
SET PHP_PEAR_BIN_DIR=%phpPath%\pear
SET PHP_PEAR_SYSCONF_DIR=%phpPath%\pear
SET PHP_PEAR_INSTALL_DIR=%PHP_PEAR_SYSCONF_DIR%\pear
SET PHP_PEAR_CACHE_DIR=%PHP_PEAR_SYSCONF_DIR%\cache
SET PHP_PEAR_CFG_DIR=%PHP_PEAR_SYSCONF_DIR%\cfg
SET PHP_PEAR_DATA_DIR=%PHP_PEAR_SYSCONF_DIR%\data
SET PHP_PEAR_DOC_DIR=%PHP_PEAR_SYSCONF_DIR%\docs
SET PHP_PEAR_DOWNLOAD_DIR=%PHP_PEAR_SYSCONF_DIR%\download
SET PHP_PEAR_TEMP_DIR=%PHP_PEAR_SYSCONF_DIR%\tmp
SET PHP_PEAR_TEST_DIR=%PHP_PEAR_SYSCONF_DIR%\tests
SET PHP_PEAR_WWW_DIR=%PHP_PEAR_SYSCONF_DIR%\www

:: Check if PEAR is installed
IF EXIST "%phpPath%\pear\pear.bat" ECHO PEAR is already installed... && GOTO EXIT
IF EXIST "%phpPath%\pear" RMDIR /s /q "%phpPath%\pear"

:: Create folders
MKDIR "%PHP_PEAR_SYSCONF_DIR%"
MKDIR "%PHP_PEAR_INSTALL_DIR%"
MKDIR "%PHP_PEAR_CACHE_DIR%"
MKDIR "%PHP_PEAR_CFG_DIR%"
MKDIR "%PHP_PEAR_DATA_DIR%"
MKDIR "%PHP_PEAR_DOC_DIR%"
MKDIR "%PHP_PEAR_DOWNLOAD_DIR%"
MKDIR "%PHP_PEAR_TEMP_DIR%"
MKDIR "%PHP_PEAR_TEST_DIR%"
MKDIR "%PHP_PEAR_WWW_DIR%"
pushd "%PHP_PEAR_SYSCONF_DIR%"

:: Install PEAR
ECHO Installing PEAR...
COPY /Y "%currentPath%\%pharFile%" "%TEMP%\install-pear-nozlib.phar" >NUL
COPY /Y "%phpPath%\php.ini" "%phpPath%\php.ini.backup" >NUL
COPY /Y "%currentPath%\php-pear.ini" "%phpPath%\php.ini" >NUL
%phpPath%\php.exe -c "%phpPath%\php.ini" "%TEMP%\install-pear-nozlib.phar"
ECHO.

:: Prepare
%phpPath%\php.exe -c "%phpPath%\php.ini" "%currentPath%\pear-install.php" "%phpPath%"
ECHO.

:: Clean
COPY /Y "%phpPath%\php.ini.backup" "%phpPath%\php.ini" >NUL
DEL /F "%phpPath%\php.ini.backup" >NUL
RMDIR /s /q "%TEMP%"
