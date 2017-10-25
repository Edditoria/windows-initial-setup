:: This file contains test scripts to check:
:: 1. is_admin.cmd exists
:: 2. check %is_admin% is true when you run it with administrator rights
:: 3. check %is_admin% is false when you run it without administrator rights
:: Usage:
::     test_is_admin [true | false]
:: You need to run this file in two different Command Prompt consoles:
:: 1. Open cmd.exe with administrator rights, then run "test_is_admin true"
:: 2. Open cmd.exe without administrator rights, then run "test_is_admin false"

@echo off
setlocal enableextensions enabledelayedexpansion

set cmd_file=%~dp0..\utils\is_admin.cmd

if not exist "%cmd_file%" (
	echo [error] Cannot find is_admin.cmd file
	exit /b 1
)

echo Running is_admin.cmd and echo the following messages:
echo ======= is_admin.cmd start =======
call "%cmd_file%"
echo ======= is_admin.cmd end   =======
echo.
echo Variable %%is_admin%% = %is_admin%
echo Variable %%errorlevel%% = %errorlevel%
echo.

if "%is_admin%"=="true" (
	echo [done] test_is_admin.cmd is running as an administrator
	echo Exit with errorlevel 0
	exit /b 0
)
if "%is_admin%"=="false" (
	echo [done] test_is_admin.cmd is running without administrator rights
	echo Exit with errorlevel 2
	exit /b 2
)
:: else
echo [error] function is_admin.cmd does not work
echo Exit with errorlevel 1
exit /b 1
