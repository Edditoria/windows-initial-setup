:: This file contains scripts to check:
:: 1. check one file that is missing
:: 2. check one file that is found
:: 3. one found then one missing
:: 4. one missing then one found

@echo off
setlocal enableextensions enabledelayedexpansion
echo.

set "downloads_dir=%~dp0\..\downloads\"
set "good_file=readme.txt"
set "missing_file=missing_file.txt"
:: set "is_installer_exist=unknown"
:: note: add above line at the beginning of each test


:: Check is_installer_exist.cmd exists

set "cmd_file=%~dp0..\utils\is_installer_exist.cmd"
if not exist "%cmd_file%" (
	echo [error] Cannot find is_installer_exist.cmd file
	exit /b 1
)


echo Test 1 of 4: Check one file that is missing
set "is_installer_exist=unknown"
echo.
echo Running is_installer_exist.cmd and echo the following messages:
echo.
echo ======= command start =======
call "%cmd_file%" "%missing_file%"
echo ======= command end   =======
echo.
if "%is_installer_exist%"=="false" if %errorlevel% equ 1 (
	echo [pass] Error properly occurs and exit with errorlevel 1
	echo.
	goto test_1_pass
)
:: else
echo %%is_installer_exist%%: %is_installer_exist% ; %%errorlevel%%: %errorlevel%
echo [error] Expect %%is_installer_exist%% to be "false" and %%errorlevel%% to be 1
exit /b 1

:test_1_pass


echo Test 2 of 4: Check one file is found
set "is_installer_exist=unknown"
echo.
echo Running is_installer_exist.cmd and echo the following messages:
echo.
echo ======= command start =======
call "%cmd_file%" "%good_file%"
echo ======= command end   =======
echo.
if not "%is_installer_exist%"=="false" if %errorlevel% equ 0 (
	echo [pass]
	goto test_2_pass
)
:: else
echo %%is_installer_exist%%: %is_installer_exist% ; %%errorlevel%%: %errorlevel%
echo [error] Expect %%is_installer_exist%% not to be "false" and %%errorlevel%% to be 0
exit /b 1

:test_2_pass


echo Test 3 of 4: One found then one missing; Expect false and error
set "is_installer_exist=unknown"
echo.
echo Running is_installer_exist.cmd and echo the following messages:
echo.
echo ======= command start =======
call "%cmd_file%" "%good_file%"
call "%cmd_file%" "%missing_file%"
echo ======= command end   =======
echo.
if "%is_installer_exist%"=="false" if %errorlevel% equ 1 (
	echo [pass] Error properly occurs and exit with errorlevel 1
	echo.
	goto test_3_pass
)
:: else
echo %%is_installer_exist%%: %is_installer_exist% ; %%errorlevel%%: %errorlevel%
echo [error] Expect %%is_installer_exist%% to be "false" and %%errorlevel%% to be 1
exit /b 1

:test_3_pass


echo Test 4 of 4: One missing then one found; Expect false and error
set "is_installer_exist=unknown"
echo.
echo Running is_installer_exist.cmd and echo the following messages:
echo.
echo ======= command start =======
call "%cmd_file%" "%missing_file%"
call "%cmd_file%" "%good_file%"
echo ======= command end   =======
echo.
if "%is_installer_exist%"=="false" if %errorlevel% equ 0 (
	echo [pass] Error properly occurs but exit with errorlevel 0
	echo.
	goto test_4_pass
)
:: else
echo %%is_installer_exist%%: %is_installer_exist% ; %%errorlevel%%: %errorlevel%
echo [error] Expect %%is_installer_exist%% to be "false" and %%errorlevel%% to be 0
exit /b 1

:test_4_pass


:: All tests pass

echo.
echo [done] All tests pass
