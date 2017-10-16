@echo off
setlocal enableextensions enabledelayedexpansion


:: Variables for General Purposes

set downloads_dir=%~dp0downloads\
set recipes_dir=%~dp0recipes\
set program_menu_allusers=%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\
:: #todo: get script path and add to all paths


:: Variables for installation files

set a_7_zip_x64_filename=7z1604-x64.exe
set chrome_filename=ChromeStandaloneSetup64.exe
:: note: check and update the filenames carefully


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
echo - 7-Zip: http://www.7-zip.org/license.txt
echo - Google Chrome: https://www.google.com/chrome/browser/privacy/eula_text.html
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


:: Install 7-Zip

echo Installing 7-Zip x64...
start /w "" %downloads_dir%%a_7_zip_x64_filename% /S
echo Setting options...
reg import %recipes_dir%7-zip\options.reg
:: #todo: handle errors in options.reg
echo Customizing user experience...
:: Customize program menu (App List) in Start Menu
copy /y "%program_menu_allusers%7-Zip\7-Zip File Manager.lnk" "%program_menu_allusers%7-Zip File Manager.lnk"
:: Add shortcut to Desktop
copy /y "%program_menu_allusers%7-Zip\7-Zip File Manager.lnk" "%USERPROFILE%\Desktop\7-Zip File Manager.lnk"
rmdir /s /q "%program_menu_allusers%7-Zip"
echo [done]
echo.


:: Install Google Chrome

echo Installing Google Chrome...
start /w "" %downloads_dir%%chrome_filename% /silent /install
echo Setting options...
set master_preferences=Google\Chrome\Application\master_preferences
if exist "%PROGRAMFILES(X86)%\%master_preferences%" (
	copy /y "%recipes_dir%google-chrome\master_preferences.json" "%PROGRAMFILES(X86)%\%master_preferences%"
)
if exist "%PROGRAMFILES%\%master_preferences%" (
	copy /y "%recipes_dir%google-chrome\master_preferences.json" "%PROGRAMFILES%\%master_preferences%"
)
echo [done]
echo.
