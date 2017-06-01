# git init

初始化`git`库

# git remote



- 更改仓库的源  `git remote add origin XXX`



# git add

- `git add [file1][file2]…` — 添加指定文件到暂存区
- `git add .` —  添加当前迷路的所有文件到暂存区



# git mv

- `git mv [file-oldName][file-newName]` — 改名文件，并且将这个改名放入暂存区

# git commit

- `git commit -m '描述信息'` — 提交暂存区到仓库区
- `git commit -a` — 提交`工作区`自上次commit之后的变化，直接到`仓库区` . eg: ` git commit -a -m 'hello world'` ,这个提交不需要使用`git add`
- `git commit -v` — 提交时显示所有diff信息
- `git commit --amend [file1]... -m '描述'` — 向一个`commit`里追加新的改动文件

# [让单个文件回退到指定的版本](http://blog.csdn.net/ikscher/article/details/43851643)



#  分支

-  `git checkout -b [branch-name]` — 新建分支,并切换该分支
-  `git checkout [branch-name]` — 切换分支
-  `git fetch origin branchname:branchname` — 拉取远程分支到本地
-  `git branch -d (-D强制删除) [branch-name]` — 删除本地分支
-  `git push origin --delete [branch-name]` — 删除远程分支

