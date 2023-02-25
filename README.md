# xu-scripts

# 安装

可以将脚本安装成命令,全局使用

```shell
./install_sh.sh
```

> 在 Windows 下面执行的时候需要使用`git-bash`执行

# 关于`.bat`脚本

> 如果 `.bat`脚本中包含中文(包含注释),那么文件的编码方式必须设置为`ANSI`,否则会有乱码,并且可能无法执行,或者可以改变默认字符集 `chcp 65001`

如果`.gitattribute`对于换行的配置没有生效,那么手动设置
git config --local core.autocrlf false
