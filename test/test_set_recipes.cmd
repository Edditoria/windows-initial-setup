:: This file contains test scripts to check:
:: 1. set_recipes.cmd exists
:: 2. error properly occurs when %repo_dir% is not available
:: 3. test pass if %repo_dir% and %recipes_dir% works
:: Limitation: Error will not occurs when %repo_dir% mess up

@echo off
setlocal enableextensions enabledelayedexpansion
echo.

set "nul=nul"
if "%OS%"=="Windows_NT" set "nul="

set "set_recipes_cmd=%~dp0..\utils\set_recipes.cmd"
set "set_dirs_cmd=%~dp0..\utils\set_dirs.cmd"

:: Check set_recipes.cmd exists

if not exist "%set_recipes_cmd%" (
	echo [error] Cannot find set_recipes.cmd file
	exit /b 1
)


:: Run set_recipes.cmd without set_dirs.cmd

echo Running set_recipes.cmd and echo the following messages:
echo.
echo ======= command start =======
call "%set_recipes_cmd%"
echo ======= command end   =======
echo.
if %errorlevel% neq 1 (
	echo [error] set_recipes.cmd should exit with %%errorlevel%% 1
	exit /b 1
)
echo [pass] Error properly occurs and exit with errorlevel 1
echo.

:: Run set_recipes.cmd with set_dirs.cmd

if not exist "%set_dirs_cmd%" (
	echo [error] Cannot find set_dirs.cmd file
	exit /b 1
)
echo Running set_recipes.cmd and echo the following messages:
echo.
echo ======= command start =======
call "%set_dirs_cmd%"
call "%set_recipes_cmd%"
echo ======= command end   =======
echo.
if %errorlevel% neq 0 (
	echo [error] set_recipes.cmd should exit with %%errorlevel%% 0
	exit /b 1
)
if not exist "%recipes_dir%%nul%" (
	echo [error] Cannot find %%recipes_dir%% directory
	echo %%recipes_dir%% : %recipes_dir%
	exit /b 1
)
echo [pass]

:: Report

echo.
echo Here are some varilables:
echo.
echo - %%repo_dir%%    : %repo_dir%
echo - %%recipes_dir%% : %recipes_dir%
echo - %%errorlevel%%  : %errorlevel%
echo.
echo [done]
echo.
