# git merge和rebase的区别

git rebase 和 git merge 一样都是用于从一个分支获取并且合并到当前分支，但是他们采取不同的工作方式

栗子场景:

你在一个feature分支进行新特性的开发，与此同时，master 分支的也有新的提交。

![](https://upload-images.jianshu.io/upload_images/305877-5dece524b7130343.png?imageMogr2/auto-orient/)

为了将master 上新的提交合并到你的feature分支上，你有两种选择：`merging` or`rebasing`

## merge

```git
git checkout feature
git merge master
```

或者

```git
git merge master feature
```

那么此时在feature上git 自动会产生一个新的commit(merge commit)

![](https://upload-images.jianshu.io/upload_images/305877-c4ddfcf679821e2f.png?imageMogr2/auto-orient/)

marge 特点：自动创建一个新的commit

如果合并的时候遇到冲突，仅需要修改后重新commit

优点：记录了真实的commit情况，包括每个分支的详情

缺点：因为每次merge会自动产生一个merge commit，所以在使用一些git 的GUI tools，特别是commit比较频繁时，看到分支很杂乱。

## rebase

本质是变基 变基 变基
变基是什么? `找公共祖先`

```
git checkout feature
git rebase master
```

![](https://upload-images.jianshu.io/upload_images/305877-467ba180733adca1.png?imageMogr2/auto-orient/)

rebase操作不会生成新的节点，是将两个分支融合成一个线性的操作。

rebase 特点：会合并之前的commit历史
优点：得到更简洁的项目历史，去掉了merge commit
缺点：如果合并出现代码问题不容易定位，因为re-write了history





