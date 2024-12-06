@echo off
:: Check if Winget is installed
where winget >nul 2>nul
if %errorlevel% neq 0 (
    echo Winget is not installed. Please install Winget by following the instructions at https://github.com/microsoft/winget-cli#installing-the-client.
    pause
    exit /b
)

:: Install Notepad++ using winget
echo Installing Notepad++ via winget...
winget install --id=Notepad++.Notepad++ -e

:: Upgrade
winget upgrade Notepad++.Notepad++

:: Confirm installation
echo Notepad++ installation complete.
