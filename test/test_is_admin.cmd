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
echo.


:: Check is_admin.cmd exists

set "cmd_file=%~dp0..\utils\is_admin.cmd"
if not exist "%cmd_file%" (
	echo [error] Cannot find is_admin.cmd file
	exit /b 1
)


:: Check input argument
:: and set %expect_is_admin% and %expect_errorlevel%

set "expect_is_admin=%~1"
if "[%expect_is_admin%]"=="[]" (
	set "expect_is_admin=true"
	set "expect_errorlevel=0"
	goto expect_is_admin_pass
)
if "%expect_is_admin%"=="true" (
	set "expect_errorlevel=0"
	goto expect_is_admin_pass
)
if "%expect_is_admin%"=="false" (
	set "expect_errorlevel=2"
	goto expect_is_admin_pass
)
:: else
echo [error] Wrong argument
echo.
echo Usage: test_is_admin [true ^| false]
echo.
exit /b 1

:expect_is_admin_pass


:: Start is_admin.cmd

echo Running is_admin.cmd and echo the following messages:
echo.
echo ======= command start =======
call "%cmd_file%"
echo ======= command end   =======
echo.


:: Report

echo Variable %%is_admin%%     : %is_admin%
echo You %%expect_is_admin%%   : %expect_is_admin%
echo Variable %%errorlevel%%   : %errorlevel%
echo You %%expect_errorlevel%% : %expect_errorlevel%
echo.

if "%is_admin%"=="%expect_is_admin%" if "%errorlevel%"=="%expect_errorlevel%" (
	echo [done] Test pass
	echo.
	exit /b 0
)
:: else
echo [error] is_admin.cmd does not work as expected
echo.
exit /b 1
