#!/bin/bash

## @version:		1.0.1

## @description:	
# ====================================================
#   针对 git clone 的封装
#	  请事先做好账户认证,需要在执行git clone的情况下不需要输入用户名和密码
# ====================================================

# set -e

cloneUrl=$1
callBin=$2

# 基础目录
# baseDir="$HOME/Developer/project"
baseDir="/d/git-repo"
# 不存在则创建
if [ ! -d "$baseDir" ]; then
  mkdir -p "$baseDir"
fi
# 可能创建失败
if [ ! -d "$baseDir" ]; then
  echo '-->> 目录不存在,退出'
  exit 0
fi
cloneUrl=$(echo "$cloneUrl" | sed 's#https://ghproxy.com/##')
# 删除前缀和后缀
if [[ "$cloneUrl" =~ ^https://.* ]]; then
  echo "-->> https url"
  project_dir=$(echo "$cloneUrl" | sed 's#https://##' | sed 's/.git//g')
elif [[ "$cloneUrl" =~ ^http://.* ]]; then
  echo "-->> http url"
  project_dir=$(echo "$cloneUrl" | sed 's#http://##' | sed 's/.git//g')
elif [[ "$cloneUrl" =~ ^git@.* ]]; then
  echo "-->> git ssh url"
  project_dir=$(echo "$cloneUrl" | sed 's#git@##' | sed 's/.git//g' | sed 's#:#/#')
else
  echo "-->> error url"
  exit 0
fi

project_name=$(echo ${project_dir##*/} )
git_clone_to_dir=${project_dir%/*}
# 替换路径中的冒号(windows不支持该字符)
git_clone_to_dir=$(echo "$git_clone_to_dir" | sed 's#:#_#')
absolute_project_dir="$baseDir/$git_clone_to_dir"
#echo "-->> project_dir: $project_dir"
#echo "-->> git_clone_to_dir: $git_clone_to_dir"
#echo "-->> project_name: $project_name"
#echo "-->> absolute_project_dir $absolute_project_dir"

if [ ! -d "$absolute_project_dir" ]; then
  mkdir -p "$absolute_project_dir"
fi
if [ ! -d "$absolute_project_dir/$project_name" ]; then
  cd "$absolute_project_dir"
  git clone  $cloneUrl
  echo "-->> clone完成,project保存路径: $absolute_project_dir"
else
  echo "-->> 已存在,跳过clone"
fi

if [ ! -n "$callBin" ]; then
  exit 0
fi

cd $baseDir
echo "-->> $callBin $project_dir"
$callBin "$project_dir"
