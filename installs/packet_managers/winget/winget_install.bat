@echo off
:: Check if winget is already installed
where winget >nul 2>nul
if %errorlevel% == 0 (
    echo winget is already installed.
    pause
    exit /b
)

:: Download the App Installer package manually
echo Downloading App Installer from GitHub...
powershell -Command "Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/download/v1.5.10871/winget-cli-1.5.10871-x64.msixbundle -OutFile %TEMP%\winget.msixbundle"

:: Install the downloaded package
echo Installing winget...
powershell -Command "Add-AppxPackage -Path %TEMP%\winget.msixbundle"

:: Cleanup
del /f /q %TEMP%\winget.msixbundle

:: Confirm installation
echo winget installation complete. You can now run winget from the command line.
