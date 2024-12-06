@echo off
:: Check if Winget is installed
where winget >nul 2>nul
if %errorlevel% neq 0 (
    echo Winget is not installed. Please install Winget by following the instructions at https://github.com/microsoft/winget-cli#installing-the-client.
    pause
    exit /b
)

:: Install scrcpy using winget
echo Installing NodeJS via winget...
winget install OpenJS.NodeJS.LTS

:: Confirm installation
echo NodeJS (LTS) installation complete. You can now run scrcpy from the command line.
