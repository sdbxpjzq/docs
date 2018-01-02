[TOC]



# crontab 更新master

```shell
#!/bin/sh
cd /root/myProject
git checkout .
git pull origin master
```

```shell
* * * * * bash /root/myProject/my.sh > /root/my.text
```





