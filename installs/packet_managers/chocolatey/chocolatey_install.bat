@echo off
:: Check if Chocolatey is already installed
where choco >nul 2>nul
if %errorlevel% == 0 (
    echo Chocolatey is already installed.
    pause
    exit /b
)

:: Inform the user that Chocolatey is being installed
echo Installing Chocolatey...

:: Set execution policy to allow script execution
powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force;"

:: Download and install Chocolatey using PowerShell
powershell -Command "[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"

:: Confirm installation
echo Chocolatey installation complete. You can now use Chocolatey to install packages.