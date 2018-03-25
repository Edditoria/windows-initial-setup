:: Purpose: Download installation files using CURL.exe

@echo off
setlocal enableextensions enabledelayedexpansion
echo.


call "%~dp0utils\set_dirs.cmd"
call "%~dp0utils\set_recipes.cmd"
if %errorlevel% neq 0 (
	echo [error] Fail in set_dirs and set_recipes
	exit /b 1
)
set "curl=%utils_dir%curl\curl.exe"
if not exist "%curl%" (
	echo [error] Cannot find curl
	exit /b 1
)

set "this_dir=%CD%"


:: Ask for Confirmation

echo All downloaded files will overwrite the current ones, even they are corrupted.
set /p "start_download=Do you want to start? (type [y] to continue) "
if "%start_download%"=="y" goto confirm_pass
:: else
echo.
echo [error] This script will continue only if you answer "y"
exit /b 1

:confirm_pass
echo.


:: Start download

cd "%downloads_dir%"

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
cd "%this_dir%"
echo [done] You may need to manually check the files in "downloads" directory
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
