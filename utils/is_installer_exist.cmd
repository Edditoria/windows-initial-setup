:: Purpose: Check whether an installation file exists in "downloads" directory
:: - Accept argument as %installer_filename%
:: - Will set variable "is_installer_exist=false" if file is missing
:: - Will exist with %errorlevel% 0 or 1
:: - Will not change the %is_installer_exist% to "true" even the file exists
:: Usage example: A batch file in repo root directory:
::     call "%~dp0utils\is_installer_exist.cmd" "%installer_filename%"
:: Important note:
:: - Do not rely on %errorlevel% for multiple calls
:: - Rely on %is_installer_exist% instead

@echo off
:: setlocal enableextensions enabledelayedexpansion

set "nul=nul"
if "%OS%"=="Windows_NT" set "nul="

if not exist "%downloads_dir%%nul%" (
	echo [error] Cannot find downloads directory
	exit /b 1
)

if not exist "%downloads_dir%%~1" (
	echo [error] File missing: %~1
	set "is_installer_exist=false"
	exit /b 1
)
:: else
exit /b 0
