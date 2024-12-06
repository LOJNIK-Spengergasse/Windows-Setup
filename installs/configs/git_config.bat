@echo off
:: Check if Git is installed
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo Git is not installed. Please install Git on https://git-scm.com/downloads/win.
    pause
    exit /b
)

:: Set Commit Message Editor
set "editorPath=C:\Program Files\Notepad++\notepad++.exe"
if exist "%editorPath%" (
    echo Setting Git commit message editor to "%editorPath%" ...
    git config --global core.editor "'%editorPath%' -multiInst -notabbar -nosession -noPlugin"
    echo Git editor configured as:
    git config --global core.editor
) else (
    echo "%editorPath%" not found. Skipping editor configuration.
)

:: Confirm configurtion
echo Git configuration complete.
