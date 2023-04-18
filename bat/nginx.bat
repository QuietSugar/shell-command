chcp 65001

@echo off
rem nginx-tools

echo ==================begin========================

cls
SET NGINX_PATH=D:
SET NGINX_DIR=D:\soft-dev\nginx-1.20.2\
color 0a
TITLE nginx-tools

CLS

ECHO.
ECHO.    ********************************************************************
ECHO.    *   Tips                                                           *
ECHO.    *   1.请将该文件的编码设置成ANSI                                   *
ECHO.    *   1.please set the code for this file to ANSI                    *
ECHO.    *   2.请将换行风格设置成win风格(CRLF)                              *
ECHO.    *   2.Please set the newline style to WIN style (CRLF).            *
ECHO.    *                                                                  *
ECHO.    ********************************************************************
ECHO.

:MENU

ECHO.---------------------------- nginx 进程列表 --------------------------------
tasklist|findstr /i "nginx.exe"
if ERRORLEVEL 1 (echo nginx未启动) else (echo nginx已启动)
ECHO.----------------------------------------------------------------------------


ECHO.
	ECHO.  [1] 启动Nginx
	ECHO.  [2] 关闭Nginx
	ECHO.  [3] 重启Nginx
	ECHO.  [4] 退 出
ECHO.

ECHO.请输入选择项目的序号:
set /p ID=
	IF "%id%"=="1" GOTO start
	IF "%id%"=="2" GOTO stop
	IF "%id%"=="3" GOTO restart
	IF "%id%"=="4" EXIT
PAUSE

:start
	call :startNginx
	ECHO.============================================================================
	ECHO.
	ECHO.
	GOTO MENU

:stop
	call :shutdownNginx
	ECHO.============================================================================
	ECHO.
	ECHO.
	GOTO MENU
:restart
	call :shutdownNginx
	call :startNginx
	ECHO.============================================================================
	ECHO.
	ECHO.
	GOTO MENU

:shutdownNginx
	ECHO.
	ECHO.关闭Nginx......
	taskkill /F /IM nginx.exe > nul
	ECHO.OK,关闭所有nginx 进程
	goto :eof

:startNginx
	ECHO.
	ECHO.启动Nginx......
	IF NOT EXIST "%NGINX_DIR%nginx.exe" ECHO "%NGINX_DIR%nginx.exe"不存在

	%NGINX_PATH%

	cd "%NGINX_DIR%"

	IF EXIST "%NGINX_DIR%nginx.exe" (
		echo "start '' nginx.exe"
		start /B "" nginx.exe
	)
	ECHO.OK
	goto :eof
