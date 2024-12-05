@echo off
:: Check for administrative privileges
net session >nul 2>nul
if %errorlevel% neq 0 (
	GOTO CHOICE
)
:BEGIN
:: Opening working dir
cd /d "%~dp0"
:: Chocolatey allowGlobalConfirmation
choco feature enable -n allowGlobalConfirmation

:: Packet Managers (required for other installs)
call ".\installs\packet_managers\winget\winget_install.bat"
call ".\installs\packet_managers\chocolatey\chocolatey_install.bat"

:: Applications
call ".\installs\applications\scrcpy\scrcpy_install.bat"

:: End script
choco feature disable  -n allowGlobalConfirmation
echo Done
:END
pause
exit /b

:CHOICE
echo You are not running this script with administrative privileges.
echo Some functions may not work correctly.
echo Would you like to continue anyway? [Y/N]
set /p choice=Enter your choice:
echo User input: "%choice%"
if "%choice%"=="Y" (
    echo Proceeding without administrative privileges.
	GOTO BEGIN
) else if "%choice%"=="y" (
    echo Proceeding without administrative privileges.
	GOTO BEGIN
) else (
	echo Installation aborted by user.
    GOTO END
)