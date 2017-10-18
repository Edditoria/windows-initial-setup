@echo off
setlocal enableextensions enabledelayedexpansion


:: Variables for General Purposes

set downloads_dir=%~dp0downloads\
set recipes_dir=%~dp0recipes\
set program_menu_allusers=%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\
:: #todo: get script path and add to all paths


:: Variables for installation files

set a_7_zip_x64_filename=7z1604-x64.exe
set adobe_acrobat_reader_filename=AcroRdrDC1500720033_MUI.exe
set cdburnerxp_filename=cdbxp_setup_4.5.7.6623_minimal.exe
set chrome_filename=ChromeStandaloneSetup64.exe
set flash_npapi_filename=install_flash_player.exe
set jre_x86_filename=jre-8u144-windows-i586.exe
set jre_x64_filename=jre-8u144-windows-x64.exe
set libreoffice_filename=LibreOffice_5.3.6_Win_x86.msi
set vlc_filename=vlc-2.2.6-win64.exe
:: note: check and update the filenames carefully


:: Show Notice

echo.
echo This is a temporary script to get things done:
echo - Expect correct file name and version for each installation
echo - Expect all installation files in folder: .\downloads\
echo - Work on x64 system (not x86)
echo - Require "Run as adminisrator" in command prompt
echo - Assume running in Windows 8 and 10
echo - Design for zh-HK user (not en-US, zh-TW, zh-CN, etc.)
echo.


:: Show Licenses

echo Before you install any package, please read their license agreements.
echo When you download and install, you already agree their terms.
echo Please read them carefully:
echo - This script: https://github.com/Edditoria/windows-initial-setup/blob/master/LICENSE.md
echo - 7-Zip: http://www.7-zip.org/license.txt
echo - Adobe Acrobat Reader DC: http://www.adobe.com/content/dam/Adobe/en/legal/licenses-terms/pdf/PlatformClients_PC_WWEULA-en_US-20150407_1357.pdf
echo - CDBurnerXP: https://cdburnerxp.se/help/intro/license
echo - Flash: http://www.adobe.com/content/dam/acom/en/legal/licenses-terms/pdf/Flash_Player_27_0.pdf
echo - Google Chrome: https://www.google.com/chrome/browser/privacy/eula_text.html
echo - Java: http://www.oracle.com/technetwork/java/javase/terms/license/
echo - LibreOffice: https://www.libreoffice.org/about-us/licenses/
echo - VLC: https://www.videolan.org/legal.html
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
echo Simplifying app list in start menu,
copy /y "%program_menu_allusers%7-Zip\7-Zip File Manager.lnk" "%program_menu_allusers%7-Zip File Manager.lnk"
echo and adding shortcut to Desktop...
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


:: Install LibreOffice

echo Installing LibreOffice (Still, x86)...
set install_args=ADDLOCAL^=ALL ALLUSERS^=1 CREATEDESKTOPLINK^=1 RebootYesNo^=No ISCHECKFORPRODUCTUPDATES^=1 REGISTER_ALL_MSO_TYPES^=1 VC_REDIST^=1 QUICKSTART^=0
start /w "" msiexec /i "%downloads_dir%%libreoffice_filename%" /passive /norestart %install_args%
echo Setting options...
set options_dir=%APPDATA%\LibreOffice\4\user\
mkdir %options_dir%
copy /y "%recipes_dir%libreoffice\registrymodifications.xcu.zh-HK.xml" "%options_dir%registrymodifications.xcu"
echo [done]
echo.


:: Install Adobe Acrobat Reader DC

echo Installing Adobe Acrobat Reader DC...
set install_args=/sPB /rs /norestart /sl "1028" /msi ALLUSERS=1 ENABLE_CHROMEEXT=0 EULA_ACCEPT=YES
start /w "" %downloads_dir%%adobe_acrobat_reader_filename% %install_args%
echo [done]
echo.


:: Install VLC

echo Installing VLC x64...
start /w "" %downloads_dir%%vlc_filename% /S
echo Setting options...
reg import %recipes_dir%vlc\options.reg
echo Simplifying app list in start menu...
copy /y "%program_menu_allusers%VideoLAN\VLC media player.lnk" "%program_menu_allusers%VLC media player.lnk"
rmdir /s /q "%program_menu_allusers%VideoLAN"
echo [done]
echo.


:: CDBurnerXP

echo Installing CDBurnerXP x86...
set install_args=/silent /sp- /norestart /q /v"ALLUSERS=2 /qn" /loadinf^=%recipes_dir%cdburnerxp\options.cfg
start /w "" %downloads_dir%%cdburnerxp_filename% %install_args%
echo Setting options...
reg import %recipes_dir%cdburnerxp\options.reg
set options_dir=%ALLUSERSPROFILE%\Canneverbe Limited\CDBurnerXP\
mkdir "%options_dir%"
copy /y "%recipes_dir%cdburnerxp\Application.ini" "%options_dir%Application.ini"
echo [done]


:: Install Flash NPAPI

echo Installing Flash Player NPAPI x86...
start /w "" %downloads_dir%%flash_npapi_filename% -install
echo [done]


:: Install JRE

set install_args=/s auto_update=1 web_analytics=0 eula=0 reboot=0 sponsors=0 removeoutofdatejres=1
echo Installing Java Runtime x86...
start /w "" %downloads_dir%%jre_x86_filename% %install_args%
echo [done]
echo Installing Java Runtime x64...
start /w "" %downloads_dir%%jre_x64_filename% %install_args%
echo [done]
