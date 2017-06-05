# 更新自己的分支开发(上班第一件事)

1. `git checkout master`
2. `git pull origin master`
3. `git checkout zongqi`
4. `git merger master`
5. `git push zongqi`

# git init

初始化`git`库



# 撤销本地的修改

- `git checkout --[fileName]` — 撤销某个文件的修改
- 那撤销全局文件的修改是什么呢?



# 撤销git add后的文件

`git add`之后,文件就参加到了暂存区,想丢弃修改分两步.

1. `git reset HEAD [fileName]` — 从暂存区移除文件
2. `git checkout --[fileName]` — 撤销这个文件的修改



# 撤销git commit后的文件

`git commit`已经提交到版本库,并没有推送到远程库.

1. `git reset --hard [commit_id]`

可以使用 `git log`查看提交历史.



# git reflog

这个一直没用过

http://blog.csdn.net/shichaosong/article/details/22067529

http://www.jianshu.com/p/253e15e324cd

http://www.jianshu.com/p/3622ed542c3b

# git



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




# git log

- `git log --pretty=oneline ` — 查看commit号
