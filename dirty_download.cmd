:: Purpose: Download installation files using CURL.exe

@echo off
setlocal enableextensions enabledelayedexpansion
echo.


call "%~dp0utils\set_dirs.cmd"
call "%~dp0utils\set_recipes.cmd"
if %errorlevel% neq 0 exit /b 1
set "curl=%utils_dir%\curl\curl.exe"
if not exist "%curl%" exit /b 1
set "this_dir=%cd%"

cd %downloads_dir%

call :func_download "7-Zip" "%a_7_zip_x64_download_url%" "%a_7_zip_x64_filename%"


:: Actions after finishing download

dir /w
cd %this_dir%
echo [done]
echo.

exit /b 0

:: Functions

:func_download
:: %~1 : Recipe Name
:: %~2 : download_url
:: %~3 : filename
echo Downloading %~1...
call "%curl%" -L %~2 -o "%~3" -m 1800 --progress-bar
echo.
exit /b 0
