@echo off
:: Check if Winget is installed
where winget >nul 2>nul
if %errorlevel% neq 0 (
    echo Winget is not installed. Please install Winget by following the instructions at https://github.com/microsoft/winget-cli#installing-the-client.
    pause
    exit /b
)

:: Install python using winget
echo Installing Python via winget...
winget install -e --id Python.Python.3.11 --scope machine

:: Upgrade
winget upgrade Python.Python.3.11

:: Confirm installation
echo Python installation complete.
