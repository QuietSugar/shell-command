@echo off
set downloadUrl=https://github.com/winsw/winsw/releases/download/v2.12.0/WinSW.NET4.exe
set downloadPath=%USERPROFILE%\.xu\resources\WinSW.NET4.exe

if exist "%downloadPath%" (
    echo WinSW already exists in %downloadPath%. Skipping download.
) else (
    echo Downloading WinSW from %downloadUrl% to %downloadPath%...
    powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%downloadUrl%', '%downloadPath%')"
    echo Download complete.
)
