[TOC]

文档型数据库,存储的是文档(json二进制)

# linux安装

## php扩展安装

[PHP7安装](http://www.runoob.com/mongodb/php7-mongdb-tutorial.html)

## mongodb安装

## `curl -O https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.4.10.tgz`

`tar -zxvf mongodb-linux-x86_64-3.4.10.tgz`  

`mv  mongodb-linux-x86_64-3.0.6/ /usr/local/mongodb `

## 配置环境变量

修改`/etc/profile`, 添加如下内容

```shell
export MONGODB_HOME=/usr/local/mongodb
export PATH=$MONGODB_HOME/bin:$PATH
```

修改完执行

```shell
source /etc/profile
```

查看mongodb版本信息 `mongod -v`



## 启动

### 手动启动

创建相应的目录结构

```shell
cd /data/
mkdir mongodb_data mongodb_log
```

在 `bin`目录下执行,后台启动

`./mongod --dbpath=/data/mongodb_data/ --logpath=/data/mongodb_log/mongodb.log --logappend& `

默认端口号是`27017`

检查是否启动成功

`netstat -lanp | grep "27017"  `



### 设置开机启动

   编辑/etc/rc.local，加入下述代码然后再保存即可。 

1. `#add mongonDB service   `
2. `/usr/local/mongodb/bin/mongod --dbpath=/data/mongodb_data/ --logpath=/data/mongodb_log/mongodb.log --logappend&  `







# MongoDB 概念解析

在mongodb中基本的概念是文档、集合、数据库

| SQL术语/概念 | MongoDB术语/概念 | 解释/说明                           |
| ------------ | ---------------- | ----------------------------------- |
| database     | database         | 数据库                              |
| table        | collection       | 数据库表/集合                       |
| row          | document         | 数据记录行/文档                     |
| column       | field            | 数据字段/域                         |
| index        | index            | 索引                                |
| table joins  |                  | 表连接,MongoDB不支持                |
| primary key  | primary key      | 主键,MongoDB自动将_id字段设置为主键 |





## 创建数据库目录

`MongoDB`需要自建数据库文件夹.

```shell
mkdir -p /data/mongodb
mkdir -p /data/mongodb/log
touch /data/mongodb/log/mongodb.log
```



## 添加配置文件

```shell
vim /etc/mongodb.conf
```

```
mongodb的参数说明：
 --dbpath 数据库路径(数据文件)
 --logpath 日志文件路径
 --master 指定为主机器
 --slave 指定为从机器
 --source 指定主机器的IP地址
 --pologSize 指定日志文件大小不超过64M.因为resync是非常操作量大且耗时，最好通过设置一个足够大的oplogSize来避免resync(默认的 oplog大小是空闲磁盘大小的5%)。
 --logappend 日志文件末尾添加
 --port 启用端口号
 --fork 在后台运行
 --only 指定只复制哪一个数据库
 --slavedelay 指从复制检测的时间间隔
 --auth 是否需要验证权限登录(用户名和密码)

注：mongodb配置文件里面的参数很多，定制特定的需求，请参考官方文档
```

```shell
dbpath=/data/mongodb
logpath=/data/mongodb/log/mongodb.log
logappend=true
port=27017
fork=true
##auth = true # 先关闭, 创建好用户在启动
```

## 通过配置文件启动

```shell
mongod -f /etc/mongodb.conf
about to fork child process, waiting until server is ready for connections.
forked process: 2814
child process started successfully, parent exiting
```

出现successfully表示启动成功了.





# mongodb命令

![](https://ws3.sinaimg.cn/large/006tKfTcly1flpimrd905j30t00estda.jpg)



## 

# 客户端工具

https://robomongo.org/







[参考](https://itjh.net/2016/07/11/centos-install-mongodb/)



http://www.runoob.com/mongodb/mongodb-tutorial.html

