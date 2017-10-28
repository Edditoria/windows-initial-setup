:: Purpose: Set variables of directories used by this repo
:: Usage example: A batch file in repo root directory:
::     call "%~dp0utils\set_dirs.cmd"

@echo off
:: setlocal enableextensions enabledelayedexpansion

:: set repo_dir
for %%i in ("%~dp0..") do set "repo_dir=%%~fi\"

set "downloads_dir=%repo_dir%downloads\"
set "recipes_dir=%repo_dir%recipes\"
set "utils_dir=%repo_dir%utils\"
set "program_menu_allusers=%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\"
