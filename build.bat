@echo off
setlocal
cd /d "%~dp0"

echo ==============================================
echo World Ender: Genesis Rift Core - BUILD
echo ==============================================
echo.

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0tools\build.ps1"
set "RESULT=%ERRORLEVEL%"

echo.
if not "%RESULT%"=="0" (
    echo ==============================================
    echo BUILD FAILED - exit code %RESULT%
    echo ==============================================
) else (
    echo ==============================================
    echo BUILD SUCCESSFUL
    echo ==============================================
)
echo.
echo This window is intentionally kept open.
pause
exit /b %RESULT%
