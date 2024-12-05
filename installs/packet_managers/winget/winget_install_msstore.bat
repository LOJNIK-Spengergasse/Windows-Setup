:: Only runnable if MSStore is installed!!!
:: NOT TESTED
call ".\installs\winget\winget_install.bat"
@echo off
:: Check if winget is already installed
where winget >nul 2>nul
if %errorlevel% == 0 (
    echo winget is already installed.
    pause
    exit /b
)

:: Check if the Microsoft Store is available
echo Checking if the Microsoft Store is available...
powershell -Command "Get-AppxPackage *Microsoft.StoreApp* | Select-Object -First 1" >nul 2>nul
if %errorlevel% neq 0 (
    echo Microsoft Store is not available. Please ensure it is installed and working.
    pause
    exit /b
)

:: Install winget by installing the App Installer package from the Microsoft Store
echo Installing winget via Microsoft Store...
powershell -Command "Start-Process ms-windows-store://pdp/?productid=9NBLGGH42THS" 

:: Inform the user that installation has started
echo The installation of winget has started. Please follow the prompts in the Microsoft Store.
