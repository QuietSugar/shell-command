#!/bin/sh 

## create time:     2022年9月29日18:58:10
## description:     清理docker镜像
## version:         1.0.0
## todo:            将内容变成支持参数配置,提供配置文件
  
echo "======== start clean docker images logs ========"  


# 删除可以删除的已停止的容器
docker ps -a | grep "Exited" | grep "simplest.xu.com\|none\|dev-peer[0-9]." | awk '{print $1 }'|xargs docker rm
# 删除可以删除的已停止的容器镜像
docker rmi $(docker images | grep "simplest.xu.com\|none\|dev-peer[0-9]." | awk '{print $3}') 


echo "======== end clean docker images logs ========"  

