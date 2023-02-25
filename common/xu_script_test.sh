#!/bin/bash
# ====================================================
# 测试命令
#	无实际意义
#	
#
# ====================================================

echo '当前目录: '$(pwd)
echo '----->>>>>'
echo '测试加载配置文件: '$(pwd)
source load_script_config.sh xu-script-test
echo $key1
echo $key2
echo '----->>>>>'

