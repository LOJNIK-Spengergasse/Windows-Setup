@echo off
:: Check if Chocolatey is installed
where choco >nul 2>nul
if %errorlevel% neq 0 (
    echo Chocolatey is not installed. Please install Chocolatey from https://chocolatey.org/install.
    pause
    exit /b
)

:: Install scrcpy using winget
echo Installing scrcpy via Chocolatey...
choco install scrcpy
echo Installing Android Debug Bridge via Chocolatey...
choco install adb

:: Confirm installation
echo scrcpy installation complete. You can now run scrcpy from the command line.
