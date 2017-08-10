[TOC]



# 镜像安装



## CentOS

http://mirror.centos.org/

进入**isos目录**下载

http://1130739.blog.51cto.com/1120739/1738791

### 国内镜像

[http://mirrors.hustunique.com/centos/7/isos/x86_64/ ](http://mirrors.hustunique.com/centos/7/isos/x86_64/) 华中科技大学开源镜像网站

[http://mirrors.cqu.edu.cn/CentOS/7/isos/x86_64/ ](http://mirrors.cqu.edu.cn/CentOS/7/isos/x86_64/) 重庆大学镜像网站

[http://mirrors.nwsuaf.edu.cn/centos/7/isos/x86_64/ ](http://mirrors.nwsuaf.edu.cn/centos/7/isos/x86_64/)  西北农业科技大学镜像网站

[http://mirrors.btte.net/centos/7/isos/x86_64/ ](http://mirrors.btte.net/centos/7/isos/x86_64/)  北京电信通电信工程有线公司镜像网站

[http://mirrors.zju.edu.cn/centos/7/isos/x86_64/ ](http://mirrors.zju.edu.cn/centos/7/isos/x86_64/) 浙江大学开源镜像网站

[http://mirrors.opencas.cn/centos/7/isos/x86_64/ ](http://mirrors.opencas.cn/centos/7/isos/x86_64/)  中科院（中国科学院计算机网络信息中心）开源镜像网站

[http://ftp.sjtu.edu.cn/centos/7/isos/x86_64/ ](http://ftp.sjtu.edu.cn/centos/7/isos/x86_64/)  上海交通大学开源镜像网站

[http://centos.ustc.edu.cn/centos/7/isos/x86_64/ ](http://centos.ustc.edu.cn/centos/7/isos/x86_64/) 中国科学技术大学开源镜像网站

[http://mirrors.yun-idc.com/centos/7/isos/x86_64/ ](http://mirrors.yun-idc.com/centos/7/isos/x86_64/) 北京首都在线科技股份有限公司镜像网站

[http://mirrors.163.com/centos/7/isos/x86_64/ ](http://mirrors.163.com/centos/7/isos/x86_64/)  上海网易163公司开源镜像网站

[http://mirror.neu.edu.cn/centos/7/isos/x86_64/ ](http://mirror.neu.edu.cn/centos/7/isos/x86_64/)  东北大学开源镜像网站

[http://mirrors.neusoft.edu.cn/centos/7/isos/x86_64/ ](http://mirrors.neusoft.edu.cn/centos/7/isos/x86_64/) 大连东软信息学院开源镜像网站

[http://mirror.bit.edu.cn/centos/7/isos/x86_64/ ](http://mirror.bit.edu.cn/centos/7/isos/x86_64/)  北京理工大学开源镜像网站



# LNMP 安装

## 安装1 — OneinStack相关启动

这个比较好用

https://oneinstack.com/

https://www.nmfox.com/2015/10/22/370.html



## 安装2

https://lnmp.org/faq/addons.html

### 虚拟机配置

https://lnmp.org/faq/lnmp-vhost-add-howto.html



# Node安装

## 源码安装

1. ` tar -xvf node-v6.11.2.tar.gz `
2. `cd node-v6.11.2 `
3. `./configure `
4. `make `
5. `make install `
6. `cp /usr/local/bin/node /usr/sbin/ `



`查看当前安装的Node的版本 `

`# node -v `



## 编译好的文件安装

​    简单说就是解压后，在bin文件夹中已经存在node以及npm，如果你进入到对应文件的中执行命令行一点问题都没有，不过不是全局的，所以将这个设置为全局就好了。

```shell
cd node-v0.10.28-linux-x64/bin
ls
./node -v
```

这就妥妥的了，node文件夹具体放在哪，叫什么名字随你怎么定。然后设置全局：

```shell
ln -s /home/kun/mysofltware/node-v0.10.28-linux-x64/bin/node /usr/local/bin/node
ln -s /home/kun/mysofltware/node-v0.10.28-linux-x64/bin/npm /usr/local/bin/npm
```

​    这里/home/kun/mysofltware/这个路径是你自己放的，你将node文件解压到哪里就是哪里。





# 启动相关

`shutdown -r now` — 重新启动

`Shutdown  -h  now` --立刻进行关机

`Init  0`--立刻关机

`Halt`—立刻关机

# 配置防火墙

`vim /etc/sysconfig/iptables`

1. 添加下面这2句,

`-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT` #允许80端口通过防火墙

`-A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT` #允许3306端口通过防火墙

2. 执行 `/etc/init.d/iptables restart` #最后重启防火墙使配置生效

查看端口开放状态:

/etc/init.d/iptables status

## 关闭SELINUX

`vim /etc/selinux/config`

`SELINUX=enforcing` #注释掉

`SELINUXTYPE=targeted` #注释掉

`SELINUX=disabled` #增加

`shutdown -r now` #重启系统



# 设置服务自启动的三种方式

`ln -s` 方式多用于自定义脚本，`chkonfig `、`ntsysv`多用于系统已存在的服务

## chkonfig  

命令行运行级别设置

如果需要自启动某些服务，只需使用`*chkconfig 服务名 on*`即可，若想关闭，*将`on`改为`off`*

![](https://ws2.sinaimg.cn/large/006tNc79ly1fi3z9c1fosj315004m74o.jpg)

在默认情况下，`chkconfig`会自启动*`2345`*这四个级别，如果想自定义可以加上*`—level`*选项

![](https://ws2.sinaimg.cn/large/006tNc79ly1fi3zaawgyuj315y064t9d.jpg)

上面我们先将sshd服务的所有启动级别关闭，然后使用*--level*选项启动自定义级别

> **Tips：***--list*选项可查看指定服务的启动状态，*chkconfig*不带任何选项则查看所有服务状态

## ntsysv 伪图形

*`ntsysv`*和*`chkconfig`*其实是一样的，只不过加上了图形而已

启动*`ntsysv`*有两种方式，一是直接在命令行中输入*`ntsysv`*，二是使用*`setup`*命令，然后选择系统服务

默认情况下，当前运行级别为多少，在*ntsysv*中设置的启动服务的级别便是多少

比如，我当前的运行级别是3,那么我在伪图形界面中选择启动服务后，它的运行级别也会是3

如果想自定义运行级别可使用*ntsysv --level*方式

![](https://ws3.sinaimg.cn/large/006tNc79ly1fi3zef4549j314w05owez.jpg)



## ln -s 

在/etc/rc.d/rc*.d目录中建立/etc/init.d/服务的软链接(*代表0～6七个运行级别之一）

在Linux中有7种运行级别（可在*/etc/inittab*文件设置），每种运行级别分别对应着*/etc/rc.d/rc[0~6].d*这7个目录

![](https://ws1.sinaimg.cn/large/006tNc79ly1fi3z6qo56oj30w00fu40h.jpg)

> **Tips：***/etc/rc[0~6].d*其实是*/etc/rc.d/rc[0~6].d*的软连接，主要是为了保持和Unix的兼容性才做此策

这7个目录中，每个目录分别存放着对应运行级别加载时需要关闭或启动的服务

由详细信息可以知道，其实每个脚本文件都对应着*/etc/init.d/*目录下具体的服务

K开头的脚本文件代表运行级别加载时需要关闭的，S开头的代表需要执行

因此，当我们需要开机启动自己的脚本时，只需要将可执行脚本丢在*/etc/init.d*目录下，然后在*/etc/rc.d/rc\*.d*中建立软链接即可

` ln -s /etc/init.d/sshd /etc/rc.d/rc3.d/S100ssh`

此处sshd是具体服务的脚本文件，S100ssh是其软链接，S开头代表加载时自启动

如果需要在多个运行级别下设置自启动，则需建立多个软链接

这种方式比较繁琐，适用于自定义的服务脚本



## 启动服务

**Tips：**如果想手动启动某服务，传统的方式是 *`/etc/init.d 服务名 start`*

​           实际上还可以这样，*`service 服务名 start`*

# 用户相关

## 切换用户身份 — su

`su root`

`su zongqi`

## 普通用户添加sudo权限

root用户下，

1. 修改文件权限   `chmod u+w /etc/sudoers`


2. "vim /etc/sudoers",进入编辑模式，找到这一 行(91行)：

   `root ALL=(ALL)  ALL`

   在起下面添加"

   `xxx ALL=(ALL)  ALL`(这里的xxx是你的用户名)，然后保存退出。

​       3. 撤销文件的写权限。"chmod u-w /etc/sudoers"

# 删除文件和目录

- `rm [fileName]`  — 删除文件
- `rm -rf [dirName]` — 删除目录




# 后台执行

## &

```shell
[命令] &;
```

它实际上是在会话中开启了一个后台作业.但我们会发现，如果此时终端被关闭后，进程还是会退出。这是因为，`& 符号`只有让进程让出前台终端的功能，无法让进程不受 SIGHUP 信号的影响。

## nohup

```shell
nohup php test.php
```

但是我们发现进程还会一直占用前台终端，但即使终端被关闭或连接断开了，程序还是会执行，另外我们会发现在当前文件夹下多了个名为 `nohup.out `的文件。

这是因为 nohup 的功能仅仅是让进程不受` SIGHUP 信号`的影响，并不会让出前台终端，而且它还会在命令执行目录下建立 `nohup.out` 用以存储进程的输出。如果进程不需要输出，且不想让 `nohup `创建文件，可以将标准输出和标准错误输出重定向。

> nohup 和 & 搭配到一块使用

```shell
nohup php test.php &
```



## setsid

```shell

```





# 压缩和解压

## tar.xz文件

```shell
# xz -d ***.tar.xz  //先解压xz 
# tar -xvf  ***.tar //再解压tar
```

## zip文件

- `zip -r  [压缩文件名][被压缩文件名]` — 压缩成 .zip
- `unzip  myc.zip  -d  ./unzip/` — 解压缩




# Linux升级安装GCC

https://itbilu.com/linux/management/V1vdnt9ll.html



## 升级动态库

https://itbilu.com/linux/management/NymXRUieg.html



# crontab  定时任务

平时会编写一些cron脚本定时的跑一些数据. 认识以下 `crontab`

**cron格式** 

`min  hour  day  month  dayofweek   /usr/local/bin/php(写全路径)    /home/john/myscript.php(写全路径)`

1. min — 分钟, 0~59任意数,

   为 `*`表示每分钟都要执行,

   为`*/n`表示每间隔`n`分钟执行一次(其他的以此类推,就不重复写了)

   为`a,b,c`表示第`a,b,c`分钟要执行

2. hour — 小时, 0-23任意数,为 `*`时表示每分钟都要执行

3. day — 日期,1-31任意数,为 `*`时表示每分钟都要执行

4. month — 月份,1-12任意数,为 `*`时表示每分钟都要执行

5. dayofweek — 星期,0-6任意数, 0代表星期日,为 `*`时表示每分钟都要执行

**栗子**

- 输出到指定文件

 ​`*/1 * * * *  /usr/bin/php   /mfw_project/www2011/app/sales/cron_update_promotion_cache.php >> /home/zongqi/cron_update_promotion_cache.log`

- 每小时执行一次:

  `00 * * * * /usr/local/bin/php /home/john/myscript.php`


- 每天早上7点执行一次 /bin/ls : 

  `0 7 * * * /bin/ls`

- 在 12 月内, 每天的早上 6 点到 12 点中，每隔3个小时执行一次 /usr/bin/backup : 

  `0 6-12/3 * 12 * /usr/bin/backup`

- 周一到周五每天下午 5:00 寄一封信给 [alex@domain.name](mailto:alex@domain.name) : 

  `0 17 * * 1-5 mail -s "hi" [alex@domain.name](mailto:alex@domain.name) < /tmp/maildata`

- 每月每天的午夜 0 点 20 分, 2 点 20 分, 4 点 20 分....执行 echo "haha": 

  `20 0-23/2 * * * echo "haha"`

**crontab 参数**

- `crontab -e` : 执行文字编辑器来设定cron任务
- `crontab -l` : 列出目前的时程表
- `crontab -r` : 删除目前的时程表


>  ***解决冲突***

现在有个问题，如果设定了任务每分钟执行一次，但有可能一分钟内任务并没有执行完成，这时系统会再执行任务。导致两个相同的任务在执行。

**使用linux flock 文件锁实现任务锁定，解决冲突**.

1. -s, --shared:    获得一个共享锁  
2. -x, --exclusive: 获得一个独占锁  
3. -u, --unlock:    移除一个锁，通常是不需要的，脚本执行完会自动丢弃锁  
4. -n, --nonblock:  如果没有立即获得锁，直接失败而不是等待  
5. -w, --timeout:   如果没有立即获得锁，等待指定时间  
6. -o, --close:     在运行命令前关闭文件的描述符号。用于如果命令产生子进程时会不受锁的管控  
7. -c, --command:   在shell中运行一个单独的命令  
8. -h, --help       显示帮助  
9. -V, --version:   显示版本  

文件锁使用独占锁，如果锁定则失败不等待。参数为-xn

`*/1 * * * * flock -xn /usr/local/bin/php /home/john/myscript.php`



## cron表达式生成

http://cron.qqe2.com/





# Yum

自动化升级，安装、移除rpm软件包，收集软件包的相关信息，检查依赖并自动提示用户解决。关键是有可靠的软件池。

- ## 选项

  -h：显示帮助信息；

  -y：对所有的提问都回答“yes”；

  -c：指定配置文件；

  -q：安静模式；

  -v：详细模式；

  -d：设置调试等级（0-10）；

  -e：设置错误等级（0-10）；

  -R：设置

  yum

  处理一个命令的最大等待时间；

  -C：完全从缓存中运行，而不去下载或者更新任何头文件。

  来自:

  ```
  http://man.linuxde.net/yum
  ```

## 参数

install：安装rpm软件包； 
update：更新rpm软件包； 
check-update：检查是否有可用的更新rpm软件包； 
remove：删除指定的rpm软件包； 
list：显示软件包的信息； 
search：检查软件包的信息； 
info：显示指定的rpm软件包的描述信息和概要信息； 
clean：清理yum过期的缓存； 
shell：进入yum的shell提示符； 
resolvedep：显示rpm软件包的依赖关系； 
localinstall：安装本地的rpm软件包； 
localupdate：显示本地rpm软件包进行更新； 
deplist：显示rpm软件包的所有依赖关系。 
来自: `http://man.linuxde.net/yum`

## 更改软件仓库

- 先备份 `mv   CentOS-Base.repo.backup`
- Linu进入`/etc/yum.repos.d/`下载 [下载文件参考](http://mirrors.aliyun.com/help/centos)
- 运行以下命令生成缓存`yum clean all` `yum makecache`


## 批量安装开发工具

```yum -y groupinstall "Development Tools"```




