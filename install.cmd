@echo off
setlocal enableextensions enabledelayedexpansion


:: Set variables

call "%~dp0utils\set_dirs.cmd"
call "%~dp0utils\set_recipes.cmd"
if %errorlevel% neq 0 exit /b 1

set "lang_list=en-US (default), zh-HK"
set "is_installer_exist=unknown"


:: Show Notice

echo.
echo Usage:
echo.
echo   install [en-US ^| zh-HK]
echo.
echo - Expect all installers are correct version in "downloads" directory
echo - Expect language of all applications is as same as language of OS
echo - Only work on Windows 10 x64 (not x86)
echo - For details: https://github.com/Edditoria/windows-initial-setup
echo.


:: Show Licenses

echo Before you install any package, please read their license agreements.
echo When you download and install, you already agree their terms.
echo Please read them carefully:
echo - This script: https://github.com/Edditoria/windows-initial-setup/blob/master/LICENSE.txt
echo - 7-Zip: http://www.7-zip.org/license.txt
echo - Adobe Acrobat Reader DC: http://www.adobe.com/content/dam/Adobe/en/legal/licenses-terms/pdf/PlatformClients_PC_WWEULA-en_US-20150407_1357.pdf
echo - Adobe Flash Player: http://www.adobe.com/content/dam/acom/en/legal/licenses-terms/pdf/Flash_Player_27_0.pdf
echo - CDBurnerXP: https://cdburnerxp.se/help/intro/license
echo - Google Chrome: https://www.google.com/chrome/browser/privacy/eula_text.html
echo - Java Runtime (JRE): http://www.oracle.com/technetwork/java/javase/terms/license/
echo - LibreOffice: https://www.libreoffice.org/about-us/licenses/
echo - VLC Media Player: https://www.videolan.org/legal.html
echo.


:: Check Admin Rights

call "%utils_dir%is_admin.cmd" true
echo.
if "%is_admin%"=="true" goto is_admin_pass
:: else
exit /b 1

:is_admin_pass


:: Language

set "lang=%~1"
if "[%lang%]"=="[]" (
	set "lang=en-US"
	echo You are going to install in language: !lang!
	goto lang_pass
)
if "%lang%"=="en-US" (
	echo You are going to install in language: %lang%
	goto lang_pass
)
if "%lang%"=="zh-HK" (
	echo You are going to install in language: %lang%
	goto lang_pass
)
:: else
echo [error] Argument(s) is not supported
echo Acceptable arguments: %lang_list%
exit /b 1

:lang_pass
echo.


:: Check Installation Files

call "%utils_dir%is_installer_exist.cmd" "%a_7_zip_x64_filename%"
call "%utils_dir%is_installer_exist.cmd" "%adobe_acrobat_reader_filename%"
call "%utils_dir%is_installer_exist.cmd" "%cdburnerxp_filename%"
call "%utils_dir%is_installer_exist.cmd" "%flash_npapi_filename%"
call "%utils_dir%is_installer_exist.cmd" "%google_chrome_x64_filename%"
call "%utils_dir%is_installer_exist.cmd" "%java_x86_filename%"
call "%utils_dir%is_installer_exist.cmd" "%java_x64_filename%"
call "%utils_dir%is_installer_exist.cmd" "%libreoffice_filename%"
call "%utils_dir%is_installer_exist.cmd" "%vlc_x64_filename%"
:: note: %is_installer_exist% will change from "unknown" to "false" if any file is missing
:: note: %is_installer_exist% will not becomes "true"
if "%is_installer_exist%"=="false" (
	exit /b 1
)


:: Ask for Confirmation

set /p "start_install=Do you want to start the installations? (type [y] to continue) "
if "%start_install%"=="y" goto confirm_pass
:: else
echo.
echo [error] This script will continue only if you answer "y"
echo.
exit /b 1

:confirm_pass
echo.


:: Install 7-Zip

echo Installing %a_7_zip_x64_fullname%...
start /w "" "%downloads_dir%%a_7_zip_x64_filename%" /S
echo Setting options...
reg import "%recipes_dir%%a_7_zip_recipe_name%\options.reg"
reg import "%recipes_dir%%a_7_zip_recipe_name%\options.%lang%.reg"
echo Simplifying app list in start menu,
copy /y "%program_menu_allusers%7-Zip\7-Zip File Manager.lnk" "%program_menu_allusers%7-Zip File Manager.lnk"
echo and adding shortcut to Desktop...
copy /y "%program_menu_allusers%7-Zip\7-Zip File Manager.lnk" "%USERPROFILE%\Desktop\7-Zip File Manager.lnk"
rmdir /s /q "%program_menu_allusers%7-Zip"
echo [done]
echo.


:: Install Google Chrome

echo Installing %google_chrome_x64_fullname%...
start /w "" msiexec /i "%downloads_dir%%google_chrome_x64_filename%" /passive /norestart
echo Setting options...
set "master_preferences=Google\Chrome\Application\master_preferences"
if exist "%PROGRAMFILES(X86)%\%master_preferences%" (
	copy /y "%recipes_dir%%google_chrome_recipe_name%\master_preferences.json" "%PROGRAMFILES(X86)%\%master_preferences%"
)
if exist "%PROGRAMFILES%\%master_preferences%" (
	copy /y "%recipes_dir%%google_chrome_recipe_name%\master_preferences.json" "%PROGRAMFILES%\%master_preferences%"
)
echo [done]
echo.


:: Install LibreOffice

echo Installing %libreoffice_fullname%...
set "install_args=ADDLOCAL=ALL ALLUSERS=1 CREATEDESKTOPLINK=1 RebootYesNo=No ISCHECKFORPRODUCTUPDATES=1 REGISTER_ALL_MSO_TYPES=1 VC_REDIST=1 QUICKSTART=0"
start /w "" msiexec /i "%downloads_dir%%libreoffice_filename%" /passive /norestart %install_args%
echo Setting options...
set "options_dir=%APPDATA%\LibreOffice\4\user\"
mkdir "%options_dir%"
copy /y "%recipes_dir%%libreoffice_recipe_name%\registrymodifications.xcu.%lang%.xml" "%options_dir%registrymodifications.xcu"
echo [done]
echo.


:: Install Adobe Acrobat Reader DC

echo Installing %adobe_acrobat_reader_fullname%...
if "%lang%"=="en-US" set "adobe_lang_id=1033"
if "%lang%"=="zh-HK" set "adobe_lang_id=1028"
set "install_args=/sPB /rs /norestart /sl %adobe_lang_id% /msi ALLUSERS=1 ENABLE_CHROMEEXT=0 EULA_ACCEPT=YES"
start /w "" "%downloads_dir%%adobe_acrobat_reader_filename%" %install_args%
echo [done]
echo.


:: Install VLC

echo Installing %vlc_x64_fullname%...
start /w "" "%downloads_dir%%vlc_x64_filename%" /S
echo Setting options...
reg import "%recipes_dir%%vlc_recipe_name%\options.%lang%.reg"
echo Simplifying app list in start menu...
copy /y "%program_menu_allusers%VideoLAN\VLC media player.lnk" "%program_menu_allusers%VLC media player.lnk"
rmdir /s /q "%program_menu_allusers%VideoLAN"
echo [done]
echo.


:: Install CDBurnerXP

echo Installing %cdburnerxp_fullname%...
set "install_args=/silent /sp- /norestart /q /v^"ALLUSERS=2 /qn^" /loadinf=^"%recipes_dir%%cdburnerxp_recipe_name%\options.%lang%.cfg^""
start /w "" "%downloads_dir%%cdburnerxp_filename%" %install_args%
echo Setting options...
reg import "%recipes_dir%%cdburnerxp_recipe_name%\options.%lang%.reg"
set "options_dir=%ALLUSERSPROFILE%\Canneverbe Limited\CDBurnerXP\"
mkdir "%options_dir%"
copy /y "%recipes_dir%%cdburnerxp_recipe_name%\Application.ini" "%options_dir%Application.ini"
echo [done]


:: Install Flash NPAPI

echo Installing %flash_npapi_fullname%...
start /w "" "%downloads_dir%%flash_npapi_filename%" -install -au 0
echo [done]


:: Install JRE

set "install_args=/s auto_update=1 web_analytics=0 eula=0 reboot=0 sponsors=0 removeoutofdatejres=1"
echo Installing %java_x86_fullname%...
start /w "" "%downloads_dir%%java_x86_filename%" %install_args%
echo [done]
echo Installing %java_x64_fullname%...
start /w "" "%downloads_dir%%java_x64_filename%" %install_args%
echo [done]
