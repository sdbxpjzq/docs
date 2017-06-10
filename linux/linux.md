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

