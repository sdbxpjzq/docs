[TOC]

# 中文资料网站

http://redis.cn/



# redis客户端安装

http://www.jianshu.com/p/214baa511f2e

安装brew cask : 在终端中输入下面语句 回车

`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null ; brew install caskroom/cask/brew-cask 2> /dev/null`

安装Redis Desktop Manager
安装完cask之后，在终端中输入 回车

`brew cask install rdm`

打开rdm.app 连接redis数据库

> 注意 redis.conf文件 中 `bing 127.0.0.1`之类的注释掉或者改成`bing 0.0.0.0`, 同时`iptables`开启`6379`端口.



# redis和memcache比较

-  Redis不仅仅支持简单的k/v类型的数据，同时还提供list，set，zset，hash等数据结构的存储。
-  Redis支持master-slave(主—从)模式应用。
-  Redis支持数据的持久化，可以将内存中的数据保持在磁盘中，重启的时候可以再次加载进行使用。
-  Redis单个value的最大限制是1GB， memcached只能保存1MB的数据



# 配置文件 — redis.conf

daemonize yes — 设置成 `yes` 后台启动

databases 16 —  redis有16个数据库.

# key的操作

Redis支持5种数据类型.

key的命名 不能有 **空格,和\n换行** .    key不要太长占内存,也不要太短.

![](https://ws4.sinaimg.cn/large/006tNc79ly1fh5jp8oixtj30kg09o752.jpg)



# 数据类型

## Strings - 字符串

string是redis最基本的类型

redis的string可以包含任何数据。包括jpg图片或者序列化的对象。

单个value值最大上限是1G字节。 

如果只用string类型，redis就可以被看作加上持久化特性的memcache

![](https://ws4.sinaimg.cn/large/006tNc79ly1fh5k4c43xsj30h605s74p.jpg)

incr（increament）对陌生或已有key(key的值必须为整型)进行累加1操作

 实现网站计数器功能。

操作陌生变量：生成该key变量并取值为1,

操作已有的key变量：要求key的值必须为整型的



## Lists - 列表

该list链表类型应用场合：

获得最新的10个商品：select *from goods order by id desc limit 10;

获得最新的10个登录用户信息:select * from user order by logintime desc limit 10;

​       以上两个sql语句可以实现需求，但是数据多的时候，全部数据都要受到影响，对数据库的负载比较高。

​       如果通过list链表实现以上功能，就会极大节省各方面资源消耗，可以在list链表中保留最新的10个数据，旧的数据从链表中给去除。每次从链表中直接获取数据即可。

![](https://ws4.sinaimg.cn/large/006tNc79ly1fh5mlvdsfpj30py06ogm8.jpg)

### list案例：

获得最新的前5个商品信息newgoods。

(新)oppo  lenovo apple meizu xiaomi   huawei(旧)

```redis
lpush newgoods huawie
lpush newgoods xiaomi
lpush newgoods meizu
lpush newgoods apple
lpush newgoods lenovo
lpush newgoods oppo

rpop newgoods; // 删除 huawie
```



## Sets - 集合

该类型应用场合：qq好友推荐、微博系统的关注关系使用

redis的set是string类型的无序集合。set元素最大可以包含(2的32次方-1)个元素。

关于set集合类型除了基本的添加删除操作，其他有用的操作还包含集合的取并集(union)，交集(intersection)，差集(difference)。通过这些操作可以很容易的实现sns中的好友推荐功能。

![](https://ws1.sinaimg.cn/large/006tNc79ly1fh5nvftz3cj30nh08zdgw.jpg)







## hash 数据类型



