[TOC]



# 更新自己的分支开发(上班第一件事)

1. `git checkout master`
2. `git pull origin master`
3. `git checkout zongqi`
4. `git merger master`
5. `git push zongqi`

或者

1. `git checkout -b zongqi`
2. `git pull origin master `



# git init

初始化`git`库



#  git cherry-pick

当你通过一番挣扎终于搞定一个bug,顺手提交到 git 服务器,心里一阵暗爽. 这时发现你当前所在的分支是 master !!!这个分支不是开发者用来提交代码的,可惜现在剁手也晚了.

1. `git checkout master` —切到主分支
2. `git log` — 获取你提交的版本号
3. `git checkout -b dev` —切换到开发分支
4. `git cherry-pick [commit id]` 



# 撤销本地的修改

- `git checkout --[fileName]` — 撤销某个文件的修改
- 那撤销全局文件的修改是什么呢?



# 撤销git add后的文件

`git add`之后,文件就参加到了暂存区,想丢弃修改分两步.

1. `git reset HEAD [fileName]` — 从暂存区移除文件
2. `git checkout --[fileName]` — 撤销这个文件的修改


# git reflog

这个一直没用过

http://blog.csdn.net/shichaosong/article/details/22067529

http://www.jianshu.com/p/253e15e324cd

http://www.jianshu.com/p/3622ed542c3b

# git remote



- 更改仓库的源  `git remote add origin XXX`



# git add

- `git add [file1][file2]…` — 添加指定文件到暂存区
- `git add .` —  添加当前的所有文件到暂存区



# git mv

- `git mv [file-oldName][file-newName]` — 改名文件，并且将这个改名放入暂存区

# git commit

- `git commit -m '描述信息'` — 提交暂存区到仓库区
- `git commit -a` — 提交`工作区`自上次commit之后的变化，直接到`仓库区` . eg: ` git commit -a -m 'hello world'` ,这个提交不需要使用`git add`
- `git commit -v` — 提交时显示所有diff信息
- `git commit --amend [file1]... -m '描述'` — 向一个`commit`里追加新的改动文件



# 撤销 commit

- `git reset –mixed`

  此为默认方式，不带任何参数的`git reset`，即时这种方式，它回退到某个版本，**保留修改源码，回退commit和index信息**. 下次提交还需要`git add`.

- ` git reset –soft`

  回退到某个版本，保留修改源码,回退了commit的信息，不会恢复到index file一级。如果还要提交，直接commit即可(不需要`git add`)

- `git reset –hard`

  彻底回退到某个版本，**不保留修改源码**,本地的源码也会变为上一个版本的内容




# git rebase

用于把一个分支的修改合并到当前分支



# 给分支打标签-git tag

git tag分为两种类型：轻量tag和附注tag。轻量tag是指向提交对象的引用，附注Tag则是仓库中的一个独立对象。建议使用附注Tag。










# git stash -暂时保存自己的修改

- `git stash save '说明信息'`  — 保存到git 栈
- `git stash list`  — 列出git栈信息
- `git stash pop` — 取出***最近一次保存的内容***
- `git stash apply stash@{1}`  — 取出指定的内容
- `git stash clear` — 清空git 栈



#  git branch 分支

-  `git branch` — 列出所有本地分支
-  `git branch -r` — 列出所有远程分支
-  `git branch -a` --列出所有本地和远程分支
-  `git branch [branchName]` — 新建一个,并依然停留在当前
-  `git checkout -b [branch-name]` — 新建分支,并切换该分支
-  `git checkout [branch-name]` — 切换分支
-  `git fetch origin branchname:branchname` — 拉取远程分支到本地
-  `git branch -d (-D强制删除) [branch-name]` — 删除本地分支
-  `git push origin --delete [branch-name]` — 删除远程分支


**切换分支注意事项**

1. 切换之前,确保当前分支的没有文件状态的变化. (可以使用 `git stash` 保存起来)
2. 如果不小心地带着未commit的工作跳转到了另一分支下，不做任何修改直接再跳回去就好.

### 分支说明

* 功能（feature）分支 . 它是为了开发某种特定功能，

`　git checkout -b feature-x master`

* 预发布（release）分支

`git checkout -b release-1.2 develop`

* 修补bug（fixbug）分支

`git checkout -b fixbug-X master`



# git log

- `git log --pretty=oneline ` — 查看commit号
- --oneline- 压缩模式，在每个提交的旁边显示经过精简的提交哈希码和提交信息，以一行显示。
- --graph- 图形模式，使用该选项会在输出的左边绘制一张基于文本格式的历史信息表示图。如果你查看的是单个分支的历史记录的话，该选项无效。
- --all- 显示所有分支的历史记录

# tig — 查看小工具

`brew install tig`



# 内建图形化工具— gitk

`gitk`





#  关键字—  WIP:

此时提交的代码不能merge master