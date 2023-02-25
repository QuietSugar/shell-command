#!/bin/bash

. ./env_init.sh

ROOT_DIR=$(pwd)
# 存放命令的位置
script_path=${HOME}"/xu-scripts"
# 创建目录存放脚本的位置,
if [ ! -d $script_path ];then
	mkdir ~/xu-scripts
fi
function uninstall(){
  rm -rf $script_path
}
# ====================================================
#   将当前目录下的脚本安装成命令
#	  命令名就是除去后缀的文件名
#	  直接采用复制文件的方式,因为软连接没法再windows下面使用
# ====================================================
function install_sh_dir(){
  cd $1
  # 遍历文件
  for file in `ls -a`
  do
    # 过滤文件
    if [[ $file != 'installAll.sh' ]] && [[ $file != '.' ]] && [[ $file != '..' ]];
    then
      # 去除后缀
      commandName=$(basename $file .sh)
      current_command_path=$script_path$"/"$commandName
      # 先采用每次都复制的方式
      cp -f $file $current_command_path
    fi
  done
  cd $ROOT_DIR
}

function install_done(){
  echo 'install done'
  if [ "Windows_NT" = "$OS" ] ;then
    bin_ath=$(cygpath -w ${script_path})
  else
    bin_ath=$script_path
    chmod -R +x $script_path
  fi
  echo '将以下路径加入Path环境变量: '$bin_ath
}
