@echo off
setlocal enabledelayedexpansion

:input
REM Check if command line parameter is provided
if "%~1"=="" (
    set "filepath="
    set /p "filepath=Enter the file path: "
    if "!filepath!"=="" goto input
) else (
    set "filepath=%~1"
)

REM Remove quotes if present
set "filepath=!filepath:"=!"

:checkfile
REM Check if file exists
if not exist "!filepath!" (
    echo File "!filepath!" does not exist.
    set "filepath="
    goto input
)

REM Calculate and display MD5 hash value
echo Calculating MD5 hash...
certutil -hashfile "!filepath!" MD5

REM Calculate and display SHA1 hash value
echo Calculating SHA1 hash...
certutil -hashfile "!filepath!" SHA1

pause
