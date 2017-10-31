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
set "a_7_zip_x64_filename=7z1604-x64.exe"
set "a_7_zip_x64_download_url=http://www.7-zip.org/a/7z1604-x64.exe"

set "adobe_acrobat_reader_recipe_name=adobe-acrobat-reader"
set "adobe_acrobat_reader_filename=AcroRdrDC1500720033_MUI.exe"
set "adobe_acrobat_reader_download_url=ftp://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1500720033/AcroRdrDC1500720033_MUI.exe"

set "cdburnerxp_recipe_name=cdburnerxp"
set "cdburnerxp_filename=cdbxp_setup_4.5.7.6623_minimal.exe"
set "cdburnerxp_download_url=https://download.cdburnerxp.se/minimal/c6065a9c696c4f1e2be39e6b71e973f6/59f2fce0/cdbxp_setup_4.5.7.6623_minimal.exe"

set "flash_npapi_recipe_name=flash-npapi"
set "flash_npapi_filename=install_flash_player.exe"
set "flash_npapi_download_url=https://fpdownload.macromedia.com/pub/flashplayer/latest/help/install_flash_player.exe"

set "google_chrome_recipe_name=google-chrome"
set "google_chrome_x64_filename=ChromeStandaloneSetup64.exe"
set "google_chrome_x64_download_url=https://dl.google.com/tag/s/appguid%%3D%%7B8A69D345-D564-463C-AFF1-A69D9E530F96%%7D%%26iid%%3D%%7B920F8F2B-D0F8-1BF1-76BF-B694D6BBB995%%7D%%26lang%%3Dzh-HK%%26browser%%3D4%%26usagestats%%3D0%%26appname%%3DGoogle%%2520Chrome%%26needsadmin%%3Dtrue%%26ap%%3Dx64-stable-statsdef_1%%26installdataindex%%3Ddefaultbrowser/chrome/install/ChromeStandaloneSetup64.exe"
:: #todo: find setup files for other languages (above is zh-HK)

set "java_recipe_name=java"
set "java_x86_filename=jre-8u151-windows-i586.exe"
set "java_x86_download_url=http://javadl.oracle.com/webapps/download/AutoDL?BundleId=227550_e758a0de34e24606bca991d704f6dcbf"
set "java_x64_filename=jre-8u151-windows-x64.exe"
set "java_x64_download_url=http://javadl.oracle.com/webapps/download/AutoDL?BundleId=227552_e758a0de34e24606bca991d704f6dcbf"

set "libreoffice_recipe_name=libreoffice"
set "libreoffice_filename=LibreOffice_5.3.6_Win_x86.msi"
set "libreoffice_download_url=http://free.nchc.org.tw/tdf/libreoffice/stable/5.3.6/win/x86/LibreOffice_5.3.6_Win_x86.msi"

set "vlc_recipe_name=vlc"
set "vlc_x64_filename=vlc-2.2.6-win64.exe"
set "vlc_x64_download_url=https://mirror.vinahost.vn/videolan/vlc/2.2.6/win64/vlc-2.2.6-win64.exe"
