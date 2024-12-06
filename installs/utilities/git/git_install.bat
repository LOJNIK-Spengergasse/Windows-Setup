@echo off
:: Check if Winget is installed
where winget >nul 2>nul
if %errorlevel% neq 0 (
    echo Winget is not installed. Please install Winget by following the instructions at https://github.com/microsoft/winget-cli#installing-the-client.
    pause
    exit /b
)

:: Install git using winget
echo Installing Git via winget...
winget install --id Git.Git -e --source winget

:: Upgrade
winget upgrade Git.Git

:: Confirm installation
echo Git installation complete.
