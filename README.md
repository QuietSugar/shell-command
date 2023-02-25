# win 常用脚本

## git-bash 
> 在Windows下需要使用`git-bash`执行

执行`installAll.sh`可以将脚本安装成命令,全局使用


# 重要

git config --local core.autocrlf false


# xu-scripts

- win

```shell
git clone -b win git地址

```

- linux

```shell
git clone -b linux git地址

```


# 注意事项

- 如果 `.bat`脚本中包含中文(包含注释),那么文件的编码方式必须设置为`ANSI`,否则会有乱码,并且可能无法执行,或者可以改变默认字符集 `chcp 65001`

