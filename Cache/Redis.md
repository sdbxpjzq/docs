[TOC]

# 中文资料网站

http://redis.cn/

http://redisdoc.com/

http://www.runoob.com/redis/redis-tutorial.html



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




#  设置redis密码

在配置文件中 

requirepass选项, 修改之后,重新登录redis-cli , 首先输入`auth [yourpassword]`

或者

`redis-cli -a [yourpassword]`

# 使用场景

![](https://ws1.sinaimg.cn/large/006tNbRwly1fhc9psl34kj30xw0kemy8.jpg)

![](https://ws3.sinaimg.cn/large/006tNbRwly1fhc9qmmw1oj30my098q30.jpg)





# 配置文件 — redis.conf

![](https://ws3.sinaimg.cn/large/006tNbRwly1fhc9zn7lejj30ya0kign2.jpg)



![](https://ws1.sinaimg.cn/large/006tNbRwly1fhca0vtjauj30wi0lm0u7.jpg)



![](https://ws2.sinaimg.cn/large/006tNbRwly1fhca1mbl5mj30xy0mk0tw.jpg)



daemonize yes — 设置成 `yes` 后台启动

databases 16 —  redis有16个数据库.

# key的操作



1. keys [模糊匹配]

查键

2. exists [key]

确定一个key是否存在

3. del

删除一个 key

4. expire

设置键的过期时间

![](https://ws4.sinaimg.cn/large/006tNbRwly1fhclosbm5tj311i0isjsj.jpg)

5. move

将当前数据库中的key转移到其他数据库中.

![](https://ws3.sinaimg.cn/large/006tNbRwly1fhclpwnrq7j30mi0jyjsd.jpg)

6. persist

移除key的过期时间

7. randomkey

随机返回一个key

8. rename

![](https://ws1.sinaimg.cn/large/006tNbRwly1fhclt078l2j30xm0bowf8.jpg)

9. type

返回值的类型

![](https://ws4.sinaimg.cn/large/006tNbRwly1fhcltmzxmfj30rk09igm0.jpg)





Redis支持5种数据类型.

key的命名 不能有 **空格,和\n换行** .    key不要太长占内存,也不要太短.

![](https://ws4.sinaimg.cn/large/006tNc79ly1fh5jp8oixtj30kg09o752.jpg)



# 数据类型

## Strings - 字符串

string是redis最基本的类型

string可以包含任何数据。包括jpg图片或者序列化的对象。

单个value值最大上限是1G字节。 

什么是序列化?



### 常见方法

1. set
2. setnx

如果key已经存在,返回0.不更新key. nx 是 `not exist`

3. setex

指定key对应的有效期.`127.0.0.1:6379> setex name 5 hello`

4. setrange

设定指定key的值的 子字符串(类似于替换吧).将zongqi的qq邮箱替换成163邮箱.

![](https://ws3.sinaimg.cn/large/006tNbRwly1fhcakmtrecj30t60a6q3p.jpg)



5. mset 

一次设置多个key的值,成功返回ok,表示所有的值都设置了;失败返回0,没有任何值被设置.

6. msetnx

不会覆盖已经存在的key. 其中有一个key没有设置成功, 整条语句都不会设置成功.

7. get

获取一个key值

8. getset

设置key的值, 并返回key的旧值.

9. getrange

截取字符串

![](https://ws4.sinaimg.cn/large/006tNbRwly1fhcb9ehwucj30oy088wet.jpg)

10. mget

一次获取多个key值.如果key不存在返回nil

11. incr

对key的值加加操作,返回新的值

12. incrby

加指定的值, key不存在会设置key,并默认为原来的value是0

13. decr

对key的值减减操作,返回新的值

14. decrby

减指定的值.

15. append

给指定key的字符串追加value,返回新字符串的长度.

16. strlen

查看value值的长度

## Lists - 列表

![](https://ws1.sinaimg.cn/large/006tNbRwly1fhcgy8tchcj31260l0myp.jpg)

### 常用方法

1. lpush (栈)

从list的头部添加元素`LPUSH list01 zongqi niuniu dada `

2. lrange

从头部取元素

`LRANGE list01 0 -1` — // dada niuniu zongqi  

3. rpush (队列)

从尾部添加元素 `RPUSH list02 zongqi niuniu dada`

` LRANGE list02 0 -1` — //zongqi niuniu dada

4. linsert

在list的特定位置添加values

`linsert list02 before niuniu jingjing` — 在niuniu的前面添加jingjing

`linsert list02 after niuniu guoguo` — 在niuniu的后面添加guoguo

5. lset

设置list中指定下标的元素值.

![](https://ws1.sinaimg.cn/large/006tNbRwly1fhchlrn15yj30cy05cjrg.jpg)

6. lrem

从list中删除n个和value相同的元素. n<0从尾删除,n=0 全部删除

![](https://ws1.sinaimg.cn/large/006tNbRwly1fhchojicfdj30vk098q3h.jpg)

以上是,删除1个hello

7. ltrim

保留范围内的数据.

![](https://ws3.sinaimg.cn/large/006tNbRwly1fhchy7ruv2j30ei07bjrk.jpg)

8. lpop

从头部删除元素,并返回删除元素

9. rpop
10. rpoplpush

从尾部移除元素,并添加到第二个list的头部

![](https://ws1.sinaimg.cn/large/006tNbRwly1fhci6f60m0j314g0samyn.jpg)

11. lindex

在indext位置 的 元素

![](https://ws2.sinaimg.cn/large/006tNbRwly1fhcie5lusfj30qe0cm3z0.jpg)

12. llen

list的长度 .` llen list02`







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

set是 ***无序集合***

![](https://ws1.sinaimg.cn/large/006tNbRwly1fhcil1r2myj31260hyt9w.jpg)

###  常用方法

1. sadd \[key]\[ value]

添加元素, 不允许有重复的值

2. smembers \[key]

查看set集合

3. srem \[key]\[value]

删除一个元素

4. spop \[key]

随机删除.(因为sets是无序集合)

5. sdiff \[key1] [key2]  差集

key1 为基准, 与key2的差集.

![](https://ws3.sinaimg.cn/large/006tNbRwly1fhcj7vgiqyj30tg0cu3zb.jpg)

6. sdiffstore

将返回的差集 存储为另外一个key

![](https://ws2.sinaimg.cn/large/006tNbRwly1fhcjaknylzj30xg0bw3z3.jpg)

7. sinter  交集

返回 交集

![](https://ws2.sinaimg.cn/large/006tNbRwly1fhcjhmmi80j30r00cmgm7.jpg)

8. sinterstore

将差集存到另一个key里面

![](https://ws3.sinaimg.cn/large/006tNbRwly1fhcjkv9id1j30xc0cc0td.jpg)

9. sunion  并集

返回并集

10. sunionstore

将并集存储在另一个key

![](https://ws4.sinaimg.cn/large/006tNbRwly1fhcjnpndqsj30ym0cujs0.jpg)

11. smove

![](https://ws1.sinaimg.cn/large/006tNbRwly1fhcjpkmiynj30uk0ciwf5.jpg)

将myset2 中的three 移除, 并添加到 myset7中

12. scard

返回set 元素的个数

![](https://ws4.sinaimg.cn/large/006tNbRwly1fhcju4vwh0j30p204wdfw.jpg)

13. sismember

测试member是否是key的元素

![](https://ws4.sinaimg.cn/large/006tNbRwly1fhcjvs9p36j30uo09k0t7.jpg)

14. srandmember

随机返回一个元素,但是不删除

![](https://ws1.sinaimg.cn/large/006tNbRwly1fhcjwyig1vj30sq0b0gm3.jpg)











该类型应用场合：qq好友推荐、微博系统的关注关系使用

。

关于set集合类型除了基本的添加删除操作，其他有用的操作还包含集合的取并集(union)，交集(intersection)，差集(difference)。通过这些操作可以很容易的实现sns中的好友推荐功能。

![](https://ws1.sinaimg.cn/large/006tNc79ly1fh5nvftz3cj30nh08zdgw.jpg)



## Sorted Set 排序集合类型





## 常用方法

1. zadd \[key]\[score][member]

添加

2. zrange

取元素

![](https://ws3.sinaimg.cn/large/006tNbRwly1fhck5et7czj31b60pwq4f.jpg)

3. zrem ![](https://ws2.sinaimg.cn/large/006tNbRwly1fhckd4olkrj30xe0f6jsb.jpg)
4. zincrby

![](https://ws4.sinaimg.cn/large/006tNbRwly1fhckej6h2yj30xs0i43zq.jpg)

5. zrank

,按 score值从小到排序,返回score 索引值

![](https://ws2.sinaimg.cn/large/006tNbRwly1fhckjf4j3jj30xs0hcgma.jpg)

6. zrevrank

按 score值从大到小排序,返回score 索引值

![](https://ws1.sinaimg.cn/large/006tNbRwly1fhckmoltc6j30y80h2t9f.jpg)

7. zrangebyscore

找到某个范围内的元素

![](https://ws1.sinaimg.cn/large/006tNbRwly1fhcl61xxjtj30zy0iwq3w.jpg)

8. zcount

某个范围内的数量

![](https://ws4.sinaimg.cn/large/006tNbRwly1fhcl7vih5wj30x40hagm9.jpg)

9. zcard

集合中的元素个数

![](https://ws4.sinaimg.cn/large/006tNbRwly1fhcl9wmhwcj30wu0gy3z7.jpg)

10. zremrangebyrank

删除某区间内的元素

![](https://ws1.sinaimg.cn/large/006tNbRwly1fhclck10unj30yy0get9p.jpg)

11. zremrangebyscore

删除score区间内的元素, 

![](https://ws4.sinaimg.cn/large/006tNbRwly1fhclfyj1l9j30xy0i2t9q.jpg)







set类型：集合类型、内部元素没有顺序，同一个集合没有重复元素

list链表类型：内部元素有彼此的先后顺序，同一个链表允许有重复元素

Sortset类型：排序集合类型，相比set类型有排序功能

![](https://ws1.sinaimg.cn/large/006tKfTcly1fh6g3s0n8cj30m407wjs6.jpg)







### Sort set类型适合场合：

获得热门帖子(回复量)信息：select * from message order by backnum desc limit 5;

根据学生成绩排序获得信息等: select * from student order by 成绩 desc limit 100;

(以上需求可以通过简单sql语句实现，但是sql语句比较耗费mysql数据库资源，不如使用redis的sort set更加科学)

案例：利用sort set实现获取成绩高的前5个学生信息（500万个学生）

![](https://ws1.sinaimg.cn/large/006tKfTcly1fh6gsugmq0j30hs080q30.jpg)





## hash 数据类型

![](https://ws3.sinaimg.cn/large/006tNbRwly1fhcc90xk2yj30n00e2wfd.jpg)



### 常用方法

1. hset

设置hash field. ` hset zongqi_redis user zongqi` , `zongqi_redis`表明

![](https://ws3.sinaimg.cn/large/006tNbRwly1fhccitxg04j313y05kq37.jpg)

2. hget

获取一个value.`hget zongqi_redis user`

3. hsetnx
4. hmset

同事设置hash的多个field.`hmet hashName field1 hello field2 world`

5. hmget
6. hincrby

给hash field加定值

7. hexists

测试指定的field是否存在

8. hlen

指定hash的field数量

10. hkeys

返回hash的所有field

11. hvals

返回hash的所有value

9. hdel

删除指定hash的field. ` hdel zongqi_redis_hash name`

12. hgetall

获取莫哥hash中全部的field和value.` HGETALL zongqi_redis`



# 主从复制

![](https://ws4.sinaimg.cn/large/006tNbRwly1fhcm9z77i6j311a0lmgn7.jpg)



![](https://ws3.sinaimg.cn/large/006tNbRwly1fhcmdc3wblj310s0jyq4c.jpg)



![](https://ws2.sinaimg.cn/large/006tNbRwly1fhcmfrta6xj310s0fuq41.jpg)

# 事务处理

## 进入事务队列

`multi`  `exec`

当一个client在一个连接中发出`multi`命令时,这个连接会进入一个事务上下文, 该连接接到后续的命令 **不会立即执行**, 而是先放到一个队列中, 当执行`exec`时, redis会顺序执行队列中的所有命令.

![](https://ws2.sinaimg.cn/large/006tKfTcly1fhagt8dfyqj30i60fkmxp.jpg)



## 取消前面所有的事务队列

`discard`命令就是清空事务的命令队列并退出事务上下文, 也就是我们常说的事务回滚.

>  队列中有一个队列执行错误,整个事务不会回滚.

![](https://ws2.sinaimg.cn/large/006tKfTcly1fhaenem4ydj30hh06mweq.jpg)



#  乐观锁

一般是为数据库添加一个'version' 字段来实现, 对此版本号`+1`.将提交数据的版本号与数据库表对应的距离的当前版本号进行比对.如果提交的数据版本号大于数据库当前版本号,则予以更新,否则认为是过期数据.

## redis乐观锁实例:

假设有一个name的key,开2个session来对name进行赋值操作.

session1

![](https://ws3.sinaimg.cn/large/006tNbRwly1fhb2um7eqxj30c903ymx4.jpg)

session2

![](https://ws3.sinaimg.cn/large/006tNbRwly1fhb2uydw5gj30e002xdfq.jpg)

对session1执行`exec`

![](https://ws4.sinaimg.cn/large/006tNbRwly1fhb2vltgnxj30de05ajrg.jpg)



`watch`命令会监视给定的key

![](https://ws4.sinaimg.cn/large/006tKfTcly1fhaf05xstaj31080nsjtd.jpg)



事务回滚



# 持久化机制

![](https://ws4.sinaimg.cn/large/006tKfTcly1fhaf2ffxl2j312g0gkmyc.jpg)

![](https://ws1.sinaimg.cn/large/006tKfTcly1fhaf3m6r1mj311s0mo409.jpg)

![](https://ws4.sinaimg.cn/large/006tKfTcly1fhaf6oefpxj31280memyl.jpg)

![](https://ws4.sinaimg.cn/large/006tKfTcly1fhaf8ga6f5j311y0oodi4.jpg)

在配置文件中

会生成  appendonly.aof 文件,里面记录我们的操作



# 发布与订阅消息

![](https://ws4.sinaimg.cn/large/006tKfTcly1fhafor36rhj311y0p440t.jpg)



![](https://ws3.sinaimg.cn/large/006tKfTcly1fhag7cerh7j30zi0gkabf.jpg)





# 虚拟内存的使用



![](https://ws2.sinaimg.cn/large/006tKfTcly1fhag3ipeszj31280o4mzf.jpg)

![](https://ws4.sinaimg.cn/large/006tKfTcly1fhag562vugj313i0f6myh.jpg)



# 网易云课堂--学习未完成



http://study.163.com/course/courseLearn.htm?courseId=265010#/learn/video?lessonId=373693&courseId=265010

