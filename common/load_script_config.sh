#!/bin/bash

## @version:		1.0.0

## @description:
# ====================================================
#   初始化变量,用于其他脚本调用,配置文件统一放在 $HOME/.config/xu-scripts/下
#   配置文件内容的的格式是 key=value
#   如何使用: source load_script_config.sh .testConfig 表示加载文件夹下的.testConfig 配置文件
#
# ====================================================

if [ ! -n "$1" ]; then
  # 缺少参数,直接退出
  exit 0
fi

# 准备加载配置文件
configFile="$HOME/.config/xu-scripts/$1"
if [ -e $configFile ]; then
  echo '--->>> load env from :↓↓↓ '$configFile
  while read line || [[ -n ${line} ]];do
    eval "$line"
    echo $line
  done < $configFile
  echo "--->>> load env from : finish load"
else
  # 配置文件不存在,退出
#  echo '文件不存在'$configFile
  exit 0
fi
