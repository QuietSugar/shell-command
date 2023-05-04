#!/bin/bash

ROOT_DIR=$(pwd)
# 存放命令的位置
script_path=${HOME}"/.xu/bin"
config_path=${HOME}"/.xu/config"
env_path=${HOME}"/.xu/env"
# 创建目录存放脚本的位置,
if [ ! -d $script_path ];then
	mkdir -p $script_path
fi
if [ ! -d $config_path ];then
	mkdir -p $config_path
fi
if [ ! -d $env_path ];then
	mkdir -p $env_path
fi
# 卸载,仅针对script_path
function uninstall(){
  rm -rf $script_path
}

# ====================================================
#   将当前目录下的脚本安装成命令
#	  命令名就是除去后缀的文件名
#	  直接采用复制文件的方式,因为软连接没法再windows下面使用
# ====================================================
echo "install path is $script_path"
function install_sh_dir(){
  local this_dir=$1
  if [ ! -d "$this_dir" ] ; then
    echo "${this_dir} 不存在"
    exit -1
  fi
  echo "install dir: ${this_dir} "
  cd $this_dir
  # 遍历文件
  local FILES=$(find . -type f \( -name "*.sh" -o -name "*.bat" \) -printf "%f\n")
  for file in $FILES
  do
    # 去除后缀
    local commandName=$(basename $file .sh)
    local current_command_path=$script_path$"/"$commandName
    # 先采用每次都复制的方式
    cp -f $file $current_command_path
  done
  cd $ROOT_DIR
  copy_config $this_dir
}

function install_done(){
  echo 'install done'
  if [ "Windows_NT" = "$OS" ] ;then
    bin_ath=$(cygpath -w ${script_path})
  else
    bin_ath=$script_path
    chmod -R +x $script_path
  fi
  echo '请根据README.md的提示修改配置文件'
}
