:: Purpose: To import variables of recipes for download, install and other tasks
:: Usage example: A batch file in repo root directory:
::     call "%~dp0utils\set_recipes.cmd"
::     if %errorlevel% neq 0 exit /b 1

@echo off
:: setlocal enableextensions enabledelayedexpansion

set "nul=nul"
if "%OS%"=="Windows_NT" set "nul="

if not exist "%repo_dir%%nul%" (
	echo [error] Cannot find repo directory ^(%%repo_dir%%^)
	exit /b 1
)

set "a_7_zip_recipe_name=7-zip"
set "a_7_zip_x64_fullname=7-Zip (x64)"
set "a_7_zip_x64_filename=7z1900-x64.exe"
set "a_7_zip_x64_download_url=https://www.7-zip.org/a/7z1900-x64.exe"

set "adobe_acrobat_reader_recipe_name=adobe-acrobat-reader"
set "adobe_acrobat_reader_fullname=Adobe Acrobat Reader DC"
set "adobe_acrobat_reader_filename=AcroRdrDC1901020064_MUI.exe"
set "adobe_acrobat_reader_download_url=https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/1901020064/AcroRdrDC1901020064_MUI.exe"

set "cdburnerxp_recipe_name=cdburnerxp"
set "cdburnerxp_fullname=CDBurnerXP"
set "cdburnerxp_filename=cdbxp_setup_4.5.8.7128_minimal.exe"
set "cdburnerxp_download_url=https://download.cdburnerxp.se/cdbxp_setup_4.5.8.7128_minimal.exe"

set "google_chrome_recipe_name=google-chrome"
set "google_chrome_x64_fullname=Google Chrome (x64)"
set "google_chrome_x64_filename=googlechromestandaloneenterprise64.msi"
set "google_chrome_x64_download_url=https://dl.google.com/tag/s/dl/chrome/install/googlechromestandaloneenterprise64.msi"

set "java_recipe_name=java"
set "java_x86_fullname=Java Runtime (JRE) (x86)"
set "java_x86_filename=jre-8u291-windows-i586.exe"
set "java_x86_download_url=https://javadl.oracle.com/webapps/download/AutoDL?BundleId=244582_d7fc238d0cbf4b0dac67be84580cfb4b"
set "java_x64_fullname=Java Runtime (JRE) (x64)"
set "java_x64_filename=jre-8u291-windows-x64.exe"
set "java_x64_download_url=https://javadl.oracle.com/webapps/download/AutoDL?BundleId=244584_d7fc238d0cbf4b0dac67be84580cfb4b"

set "libreoffice_recipe_name=libreoffice"
set "libreoffice_fullname=LibreOffice"
set "libreoffice_filename=LibreOffice_7.0.6_Win_x86.msi"
set "libreoffice_download_url=https://download.documentfoundation.org/libreoffice/stable/7.0.6/win/x86/LibreOffice_7.0.6_Win_x86.msi"

set "vlc_recipe_name=vlc"
set "vlc_x64_fullname=VLC Media Player"
set "vlc_x64_filename=vlc-3.0.16-win64.exe"
set "vlc_x64_download_url=https://get.videolan.org/vlc/3.0.16/win64/vlc-3.0.16-win64.exe"
