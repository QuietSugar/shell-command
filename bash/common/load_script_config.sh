#!/bin/bash

## @version:		1.0.0

## @description:
# ====================================================
#   初始化变量,用于其他脚本调用,配置文件统一放在 $HOME/.xu/config/下
#   配置文件内容的的格式是 key=value
#   如何使用: source load_script_config.sh .testConfig 表示加载文件夹下的.testConfig 配置文件
#
# ====================================================

if [ -n "$1" ]; then
  # 准备加载配置文件
  configFile="$HOME/.xu/config/${1}.xu"
  echo '--->>> load env from :↓↓↓ '$configFile
  if [ -e $configFile ]; then
    while read line || [[ -n ${line} ]];do
      eval "$line"
      echo $line
    done < $configFile
    echo "--->>> load env from : finish load"
  else
   echo '文件不存在'$configFile
  fi
fi


