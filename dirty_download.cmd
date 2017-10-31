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


:: Start download

cd %downloads_dir%

call :func_download "%a_7_zip_x64_fullname%" "%a_7_zip_x64_download_url%" "%a_7_zip_x64_filename%"
call :func_download "%flash_npapi_fullname%" "%flash_npapi_download_url%" "%flash_npapi_filename%"
call :func_download "%cdburnerxp_fullname%" "%cdburnerxp_download_url%" "%cdburnerxp_filename%"
call :func_download "%google_chrome_x64_fullname%" "%google_chrome_x64_download_url%" "%google_chrome_x64_filename%"
call :func_download "%java_x86_fullname%" "%java_x86_download_url%" "%java_x86_filename%"
call :func_download "%java_x64_fullname%" "%java_x64_download_url%" "%java_x64_filename%"
call :func_download "%libreoffice_fullname%" "%libreoffice_download_url%" "%libreoffice_filename%"
call :func_download "%vlc_x64_fullname%" "%vlc_x64_download_url%" "%vlc_x64_filename%"
call :func_download "%adobe_acrobat_reader_fullname%" "%adobe_acrobat_reader_download_url%" "%adobe_acrobat_reader_filename%"


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
