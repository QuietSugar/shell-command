#!/bin/bash
# ====================================================
#   寻找目录下所有带 .git的目录,
#	并且检查是否有未提交文件
#	需要传入参数 比如当前目录 .  
#
# ====================================================

# set -x


base_path=$(pwd)
function lm_traverse_dir(){
	# echo '开始 处理文件夹: ---------------------------'$(pwd)
	# echo "当前处理的文件夹: "$1
	# 判断.git文件是否存在,如果存在,表示当前目录是一个git仓库
	if [ -d ".git" ];then
		this_repo=$(echo "$(pwd)" | sed "s#$base_path##" )
		if [ -n "$(git status -s)" ];then
			echo '[ 未提交: ] '$this_repo
		fi
		if [ -n "$(git remote -v)" ];then
			# 判断是否有未推送
			if [ -n "$(git cherry -v)" ];then
			echo '[ 未推送: ] '$this_repo
			fi	
		else
			echo '[ 无远程11: ] '$this_repo
		fi
	else
		# 当前目录不是一个git仓库文件夹,遍历进入处理
		for file in `ls -a`
		do
			# 判断是否是目录
			if [ -d $file ];then
				# 判断是不是 . 和 ..
				if [[ $file != '.' ]] && [[ $file != '..' ]];
				then
					# echo '准备进入文件夹'$file	
					# 进入当前目录
					cd $file
					lm_traverse_dir $file	#遍历子目录				
				fi
			fi
		done
	fi
	# echo '结束 文件夹: ---------------------------'$(pwd)
	cd ..
}   

# 执行命令 如果需要接收参数,那就执行 lm_traverse_dir $1
if [ $# -eq 0 ]; then
    echo "检查当前目录"
	lm_traverse_dir .
else
	lm_traverse_dir $1
fi
