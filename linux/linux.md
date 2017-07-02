[TOC]



#  OneinStack相关启动

https://www.nmfox.com/2015/10/22/370.html

# 启动

`shutdown -r now` — 重新启动

# 配置防火墙

`vim /etc/sysconfig/iptables`

1. 添加下面这2句,

`-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT` #允许80端口通过防火墙

`-A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT` #允许3306端口通过防火墙

2. 执行 `/etc/init.d/iptables restart` #最后重启防火墙使配置生效

## 关闭SELINUX

`vim /etc/selinux/config`

`SELINUX=enforcing` #注释掉

`SELINUXTYPE=targeted` #注释掉

`SELINUX=disabled` #增加

`shutdown -r now` #重启系统



# 删除文件和目录

- `rm [fileName]`  — 删除文件
- `rm -rf [dirName]` — 删除目录



# 压缩和解压

- `zip -r  [压缩文件名][被压缩文件名]` — 压缩成 .zip
- `unzip  myc.zip  -d  ./unzip/` — 解压缩



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









