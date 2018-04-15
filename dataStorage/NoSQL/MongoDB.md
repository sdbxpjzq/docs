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

- **show dbs** :显示已有数据库，如果你刚安装好，会默认有local、admin(config)，这是MongoDB的默认数据库，我们在新建库时是不允许起这些名称的。
- **use admin**： 进入数据，也可以理解成为使用数据库。成功会显示：switched to db admin。
- **show collections**: 显示数据库中的集合（关系型中叫表，我们要逐渐熟悉）。
- **db**:显示当前位置，也就是你当前使用的数据库名称，这个命令算是最常用的，因为你在作任何操作的时候都要先查看一下自己所在的库，以免造成操作错误。

### 数据操作基础命令：

- **`use db`（建立数据库）**：use不仅可以进入一个数据库，如果你敲入的库不存在，它还可以帮你建立一个库。但是在没有集合前，它还是默认为空。

- **db.集合.insert( )**:新建数据集合和插入文件（数据），当集合没有时，这时候就可以新建一个集合，并向里边插入数据。Demo：

  ```sql
  db.user.insert({"name":"jspang"})
  ```

- **db.集合.find( )**:查询所有数据，这条命令会列出集合下的所有数据，可以看到MongoDB是自动给我们加入了索引值的。Demo：db.user.find()

- **db.集合.findOne( )**:查询第一个文件数据，这里需要注意的，所有MongoDB的组合单词都使用首字母小写的驼峰式写法。

- **db.集合.update({查询},{修改})**:修改文件数据，第一个是查询条件，第二个是要修改成的值。这里注意的是可以多加文件数据项的，比如下面的例子。

  ```sql
  db.jspang.update({"name":"jspang"},{"name":"jspang","age":"32"})
  ```

  ​


- **db.集合.remove(条件)**：删除文件数据，注意的是要跟一个条件。Demo:

  ```sql
  db.user.remove({"name":"jspang"})
  ```

  ​

- **db.集合.drop( )**:删除整个集合，这个在实际工作中一定要谨慎使用，如果是程序，一定要二次确认。

- **db.dropDatabase( )**:删除整个数据库，在删除库时，一定要先进入数据库，然后再删除。实际工作中这个基本不用，实际工作可定需要保留数据和痕迹的。



# MongoDB的存储结构

MongoDB有所不同，库下面是集合，集合下面是文件，可以看下面这张图进行了解一下。

![](https://ws3.sinaimg.cn/large/006tKfTcgy1fqc6igtcwej30v40cgglx.jpg)



## 关系型数据库:

数据库（db） -> 表（table） -> 记录（record）-> 字段

## mongodb:

数据库 -> collection -> document -> 字段

# js文件写mongo命令

**goTask.js文件**

```js
var userName="jspang";    //声明一个登录名             
var timeStamp=Date.parse(new Date());     //声明登录时的时间戳  
var jsonDdatabase={"loginUnser":userName,"loginTime":timeStamp}; //组成JSON字符串
var db = connect('log');   //链接数据库
db.login.insert(jsonDdatabase);  //插入数据
 
print('[demo]log  print success');  //没有错误显示成功
```

执行

```shell
mongo goTask.js
```





## 

# 客户端工具

https://robomongo.org/







# 参考

[技术胖MongoDB视频](http://v.qq.com/vplus/bab1a460a0f05fd4/foldervideos/boq001201qp3819)

[技术胖MongoDB博客](http://jspang.com/2017/12/16/mongdb/)











[参考](https://itjh.net/2016/07/11/centos-install-mongodb/)



http://www.runoob.com/mongodb/mongodb-tutorial.html

