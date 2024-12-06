@echo off
:: Check if Winget is installed
where winget >nul 2>nul
if %errorlevel% neq 0 (
    echo Winget is not installed. Please install Winget by following the instructions at https://github.com/microsoft/winget-cli#installing-the-client.
    pause
    exit /b
)

:: Install dotnet using winget
echo Installing Dotnet via winget...
winget install Microsoft.DotNet.SDK.9

:: Upgrade
winget upgrade Microsoft.DotNet.SDK.9

:: Confirm installation
echo Dotnet installation complete.
