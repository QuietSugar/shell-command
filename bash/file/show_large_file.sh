#!/bin/sh 

## create time:     2022年9月29日18:58:10
## description:     查询大于100M的前20个文件
## version:         1.0.0
## todo:            支持配置操作,提供配置文件
  

find / -path /root/share -prune -o -type f -size +100M -print0 | xargs -0 du -h | sort -rh | head -n 20
