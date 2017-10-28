:: Purpose: To import variables of recipes for download, install and other tasks
:: Usage example: A batch file in repo root directory:
::     call "%~dp0utils\set_recipes.cmd"
::     if %errorlevel% equ 1 exit /b 1

@echo off
:: setlocal enableextensions enabledelayedexpansion

set "nul=nul"
if "%OS%"=="Windows_NT" set "nul="

if not exist "%repo_dir%%nul%" (
	echo [error] Cannot find repo directory ^(%%repo_dir%%^)
	exit /b 1
)

set "a_7_zip_x64_filename=7z1604-x64.exe"
set "adobe_acrobat_reader_filename=AcroRdrDC1500720033_MUI.exe"
set "cdburnerxp_filename=cdbxp_setup_4.5.7.6623_minimal.exe"
set "chrome_filename=ChromeStandaloneSetup64.exe"
set "flash_npapi_filename=install_flash_player.exe"
set "jre_x86_filename=jre-8u144-windows-i586.exe"
set "jre_x64_filename=jre-8u144-windows-x64.exe"
set "libreoffice_filename=LibreOffice_5.3.6_Win_x86.msi"
set "vlc_filename=vlc-2.2.6-win64.exe"
