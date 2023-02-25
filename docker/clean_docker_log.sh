#!/bin/sh 

## create time:     2022年9月29日18:58:10
## description:     清理docker日志,请谨慎操作
## version:         1.0.0
## todo:            支持配置操作,提供配置文件
  

echo "======== start clean docker containers logs ========"  
  
logs=$(find /var/lib/docker/containers/ -name *-json.log)  
  
for log in $logs  
        do  
                echo "clean logs : $log"  
                cat /dev/null > $log  
        done  

echo "======== end clean docker containers logs ========"  

