:: Utility to check if Command Prompt is running as an administrator
:: - Will create a variable %is_admin% as "true" or "false"
:: - Will exit with %errorlevel% as:
::   - 0: Success. Running as an administrator
::   - 1: Fail. Unknown error
::   - 2: Fail. Not running as an administrator
:: - reference: https://stackoverflow.com/questions/4051883/batch-script-how-to-check-for-admin-rights

@echo off
:: setlocal enableextensions enabledelayedexpansion

echo Check if this script is running as an administrator...
call :is_admin
if %errorlevel% equ 0 (
	set "is_admin=true"
	echo [done]
	exit /b 0
) else (
	set "is_admin=false"
	echo [error] Access denied. Require "Run as administrator" in command prompt
	exit /b 2
)

echo [error] Unknown error
exit /b 1

:is_admin
fsutil dirty query %systemdrive% >nul
exit /b
