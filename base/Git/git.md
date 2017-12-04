[TOC]

###05-02 

# 更新自己的分支开发(上班第一件事)

1. `git checkout master`
2. `git pull origin master`
3. `git checkout zongqi`
4. `git merger master`
5. `git push zongqi`

或者

1. `git checkout -b zongqi`
2. `git pull origin master `




# git config

## 配置文件

~/.gitconfig

## 获取配置清单

```shell
git config --list
git config --list --system
git config --list --global
git config --list --local
```



` git config --list ` 或者 `cat ~/.gitconfig`

` git config --global user.name 'xxx'`

` git config --global user.emall 'xxx'`

` git config --global color.ui true`

## 设置命令别名

` git config --global alias.co chechout` — 将`checkout`设置成`co`



# git init

初始化`git`库

`git init` 与`git init —bare` 区别:

- 不使用`—bare`选项时,就会生成`.git`目录以及其下的版本历史记录文件,这些版本历史记录文件就存放在`.git`目录下
- 使用`—bare`选项时(俗称`裸库`),不再生成`.git`目录,而是只生成`.git`目录下面的版本历史记录文件,这些版本历史记录文件也不再存放在`.git`目录下面,而是直接存放在版本库的根目录下面.

# git clone

`git clone xxxx`  — 默认拉取`master`分支

`git clone -b branchName  xxxx`  — 拉取指定分支



#  git cherry-pick

当你通过一番挣扎终于搞定一个bug,顺手提交到 git 服务器,心里一阵暗爽. 这时发现你当前所在的分支是 master !!!这个分支不是开发者用来提交代码的,可惜现在剁手也晚了.

1. `git checkout master` —切到主分支
2. `git log` — 获取你提交的版本号
3. `git checkout -b dev` —切换到开发分支
4. `git cherry-pick [commit id]` 




# git mv 

## 重命名

- `git mv [file-oldName][file-newName]` — 改名文件，并且将这个改名放入暂存区

## 移动文件

`git mv [file-oldName_dir][file-newName_dir]`



# git checkout

- `git checkout --[fileName]` — 撤销某个文件的修改


 `git checkout HEAD -- [fileName]` — 恢复到`fileName`最近的一次提交


# 撤销git add后的文件

`git add`之后,文件就参加到了暂存区,想丢弃修改分两步.

1. `git reset HEAD [fileName]` — 从暂存区移除文件
2. `git checkout --[fileName]` — 撤销这个文件的修改


# git reflog

这个一直没用过

http://blog.csdn.net/shichaosong/article/details/22067529

http://www.jianshu.com/p/253e15e324cd

http://www.jianshu.com/p/3622ed542c3b

https://ithelp.ithome.com.tw/articles/10138150

# git remote

## 更改仓库的源 

 `git remote set-url origin XXX`

## Git同时提交到多个远程仓库

1. `git remote add all [url]`
2. `git remote set-url --add all [url]`
3. `git config branch.master.remote  all`

注意:: `all` 是可以随意起名字的.

最后push 的时候

`git push all master`




# git add

- `git add [file1][file2]…` — 添加指定文件到暂存区
- `git add .` —  添加当前的所有文件到暂存区


- ​

# git commit

- `git commit -m '描述信息'` — 提交暂存区到仓库区
- `git commit -a` — 提交`工作区`自上次commit之后的变化，直接到`仓库区` . eg: ` git commit -a -m 'hello world'` ,这个提交不需要使用`git add`
- `git commit -v` — 提交时显示所有diff信息
- `git commit --amend [file1]... -m '描述'` — 向一个`commit`里追加新的改动文件



# git reset

- `git reset –mixed`

  此为默认方式，不带任何参数的`git reset`，即时这种方式，它回退到某个版本，**保留修改源码，回退commit和index信息**. 下次提交还需要`git add`.

- ` git reset –soft`

  回退到某个版本，**保留修改源码**,回退了commit的信息，不会恢复到index file一级。如果还要提交，直接commit即可(不需要`git add`)

- `git reset –hard`

  彻底回退到某个版本，**不保留修改源码**,本地的源码也会变为上一个版本的内容


不会出现commit

# git revert

会有commit



#  git diff







# git push

`git push origin branch-name --force` —force 强制推送



# git rebase



# git merge

推荐:

不实用 `Fast-forward`的方式合并

```shell
 git merge branche1 --no-ff
```



[参考](https://ithelp.ithome.com.tw/articles/10139489)







`git rebase --abort`

# git tag

在使用Git 版本控管的过程中，会产生大量的版本，随着寒暑易节、物换星移，在这众多的版本之中，一定会有一些值得我们纪录的几个重要版本，这就是标签 (Tag) 能帮我们做的事.

## 轻量tag

轻量tag是指向提交对象的引用，

![](https://ws4.sinaimg.cn/large/006tNc79gy1fl5yh5feaij30dw0hqjse.jpg)



## 附注tag

附注Tag则是仓库中的一个独立对象。建议使用附注Tag。

![](https://ws1.sinaimg.cn/large/006tNc79gy1fl5yhihky1j30dw0dddge.jpg)




# git stash -暂时保存自己的修改

- `git stash save(save可以省略) -u '说明信息'`  — 保存到git 栈
- `git stash list`  — 列出git栈信息
- `git stash pop` — 取出***最近一次保存的内容***
- `git stash apply stash@{1}`  — 取出指定的内容
- `git stash drop stash@{1}`  — 删除指定的内容
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
-  `git branch -m [old_branch_name] [new_branch_name]`— 重命名分支


**切换分支注意事项**

1. 切换之前,确保当前分支的没有文件状态的变化. (可以使用 `git stash` 保存起来)
2. 如果不小心地带着未commit的工作跳转到了另一分支下，不做任何修改直接再跳回去就好.

**分支说明**

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
- --decorate 



`git log --oneline -5`

`git log --oneline -5 --author="zongqi"`

`git log --oneline -5 --grep="index.html"`

`git log --oneline -5 --before='2017-07-01'` 1 week, 3 days

`git log --oneline -5 --before='1 week'`



# tig — 查看小工具

`brew install tig`



# 内建图形化工具— gitk

`gitk`





#  关键字—  WIP:

此时提交的代码不能merge master