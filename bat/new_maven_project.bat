chcp 65001
:: 设置环境变量
:: 如果想使用自定义的maven配置文件,请配置环境变量 MAVEN_SETTINGS_FILE_PATH
:: 关闭终端回显
@echo off
 
set CONF_PATH=%MAVEN_SETTINGS_FILE_PATH%
 
if "%CONF_PATH%" == "" (
    echo 'use system maven settings file '
    mvn archetype:generate -DarchetypeCatalog=local
) else (
    @echo use your settings file : %CONF_PATH%
    mvn archetype:generate -DarchetypeCatalog=local -s %CONF_PATH%
)

pause