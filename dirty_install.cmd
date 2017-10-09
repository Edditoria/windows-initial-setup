@echo off
setlocal enableextensions enabledelayedexpansion


:: Variables

set downloads_dir=.\downloads\
set recipes_dir=.\recipes\
:: #todo: get script path and add to all paths


:: Show Notice

echo.
echo This is a temporary script to get things done:
echo - Expect correct file name and version for each installation
echo - Expect all installation files in folder: .\downloads\
echo - Work on x64 system (not x86)
echo - Require "Run as adminisrator" in command prompt
echo - Assume running in Windows 8 and 10
echo.

:: Show Licenses

echo Before you install any package, please read their license agreements.
echo When you download and install, you already agree their terms.
echo Please read them carefully:
echo - This script: https://github.com/Edditoria/windows-initial-setup/blob/master/LICENSE.md
echo.

:: Ask for Confirmation

set /p start_install="Do you want to start the installations? (type [y] to continue) "
if "%start_install%"=="y" (
	echo.
	goto start_install
) else (
	echo.
	echo [error] This script will continue only if you answer "y"
	exit /b 1
)

:start_install
echo Start installation from here #todo
echo.
