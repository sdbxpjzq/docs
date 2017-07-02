[TOC]

# 什么是 Redis

Redis是Remote Dictionary Server(远程数据服务)的缩写

由意大利人 antirez(Salvatore Sanfilippo) 开发的一款 内存高速缓存数据库

该软件使用C语言编写,它的数据模型为 key-value

它支持丰富的数据结构，比如 String  list  hash  set  sorted set。

可持久化，保证了数据安全。



# redis和memcache比较

-  Redis不仅仅支持简单的k/v类型的数据，同时还提供list，set，zset，hash等数据结构的存储。
- Redis支持master-slave(主—从)模式应用。
- Redis支持数据的持久化，可以将内存中的数据保持在磁盘中，重启的时候可以再次加载进行使用。
- Redis单个value的最大限制是1GB， memcached只能保存1MB的数据



# 配置文件 — redis.conf

daemonize yes — 设置成 `yes` 后台启动



# 简单使用

redis-cli        redis-server   

![](https://ws4.sinaimg.cn/large/006tNc79ly1fh5il0cej2j30pw08g74t.jpg)



