# 检查是否有未push的代码
```bash
#!/bin/bash

for repo in $(find . -name ".git" | cut -c 3-); do
    cd "$repo"
    echo "Checking git repo in $(pwd)"
    if git status | grep -q "Your branch is ahead"; then
        echo "Repository has unpushed changes"
    else
        echo "Repository is up to date"
    fi
    cd ..
done
```

该脚本先使用`find`命令查找当前目录及其子目录中所有包含`.git`的目录，然后使用`cd`命令进入每个仓库目录，执行`git status`命令来检查是否存在未提交的更改。如果检测到当前分支比远程分支超前（即存在未push的代码），则输出一条提示信息。

需要注意的是，该脚本仅检查当前目录及其子目录中的Git仓库是否有未push的代码，如果你需要检查其他目录下的Git仓库，可以修改`find`命令的路径参数。