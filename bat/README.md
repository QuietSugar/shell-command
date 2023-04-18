# powershell

- 编辑初始化文件

```shell
notepad $PROFILE
```

- 设置环境变量

```shell
# 指定文件路径
$file = "C:\Users\Sugar\Desktop\env_vars.txt"

# 按行读取文件内容
Get-Content $file | ForEach-Object {
    # 按照“=”字符拆分行内容，将 key 和 value 存储到变量中
    $key, $value = $_.Split("=")

    # 将 key 和 value 添加到环境变量中
    [System.Environment]::SetEnvironmentVariable($key, $value, "User")
}
```

- 设置别名

```shell
New-Alias -Name nngg -Value D:\git-repo\github.com\QuietSugar\xu-scripts\bat\nginx.bat
```


# 其他

[Windows 10 环境变量：如何通过 CMD 和 PowerShell 写入环境变量](https://zhuanlan.zhihu.com/p/349455443)
