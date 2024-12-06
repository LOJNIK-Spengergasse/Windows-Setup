@echo off
:: Check for administrative privileges
net session >nul 2>nul
if %errorlevel% neq 0 (
	GOTO CHOICE
)
:BEGIN
:: Opening working dir
cd /d "%~dp0"
if not exist "installs" (
    echo Directory "installs" does not exist. Aborting script.
    GOTO END
)
cd installs

:: Packet Managers (required for other installs)
if not exist "packet_managers" (
    echo Directory "packet_managers" does not exist. Aborting script.
    GOTO END
)
cd packet_managers
call ".\winget\winget_install.bat"
call ".\chocolatey\chocolatey_install.bat"
cd ..
:: Chocolatey allowGlobalConfirmation
choco feature enable -n allowGlobalConfirmation

:: Utilities
if not exist "utilities" (
    echo Directory "utilities" does not exist. Aborting script.
    GOTO END
)
cd utilities
call ".\nodejs\nodejs_install.bat" :: NOT LTS
call ".\git\git_install.bat"
cd ..

:: Applications
if not exist "applications" (
    echo Directory "applications" does not exist. Aborting script.
    GOTO END
)
cd applications
call ".\scrcpy\scrcpy_install.bat"
call ".\notepad++\notepadPP_install.bat"
cd ..

:: Configuration
if not exist "configs" (
    echo Directory "configs" does not exist. Aborting script.
    GOTO END
)
cd configs
call ".\git_config.bat"
cd ..

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