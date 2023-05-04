#!/bin/bash

# 设置 npm yarn 的 registry

# 加载环境变量
source load_script_config frontend
# 设置基础目录,一定要配置,无默认值
if [ -n "$REGISTRY" ]; then
  # 设置仓库
  yarn config set registry $REGISTRY
  npm config set registry $REGISTRY
  echo "set registry successful"
else
  # 取消仓库
  yarn config delete registry
  npm config delete registry
  echo "delete registry successful"
fi
