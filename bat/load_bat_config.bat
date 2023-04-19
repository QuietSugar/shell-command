@echo off
if "%~1"=="" (
    echo need parameter
	exit /b
)
echo parameter is：%1
set configFile="%USERPROFILE%\.xu\config\%1%.xu"
echo config file is：%configFile%

if not exist %configFile% (
    echo config file does not exist
    exit /b
)
for /f "delims=" %%a in ('type %configFile%') do (
    set %%a
)

:: pause
