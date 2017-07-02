[TOC]



days8开始学习





# 创建数据库

```sql
CREATE DATABASE zongqi;
```

每个数据库对应有个opt文件,每个表都有frm文件.有的表有3个文件(和表设置的类型有关).

![](https://ws3.sinaimg.cn/large/006tNc79ly1fh4qlansgkj30pk0tmgoj.jpg)





# 数据库编码问题

### utf8 和 utf8mb4(支持表情)

utf8mb4兼容utf8，且比utf8能表示更多的字符。在做移动应用时，会遇到ios用户会在文本的区域输入emoji表情，如果不做一定处理，就会导致插入数据库异常。需要 >= MySQL 5.5.3版本、从库也必须是5.5的了、低版本不支持这个字符集、复制报错

### 查看字符集设置

`show variables like 'collation_%';`

`show variables like 'character_set_%';`



# 创建表

```sql
CREATE table sales_activity_honey_center {
`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
`uid` int(11) not null default 0 COMMENT '用户id',
`ling_num`  int(11)  COMMENT '领取次数'
`ling_time`  timestamp DEFAULT NULL COMMENT '领取事件'
-- 下面2行建议必须写
 `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `mtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`)
}ENGINE=InnoDB DEFAULT CHARSET=utf8;
```



# 索引

### 主键索引  primary key

一个表只能指定一个主键，且主键的值不能为空。

### 唯一索引  unique

一个表中可以有多个唯一索引。
主要是为了避免数据出现重复。

主键和唯一键约束是通过参考索引实施的，如果插入的值均为NULL，则根据索引的原理，全NULL值不被记录在索引上，所以插入全NULL值时，可以有重复的，而其他的则不能插入重复值。 
alter table t add constraint uk_t_1 unique (a,b); 
insert into t (a ,b ) values (null,1);    # 不能重复 
insert into t (a ,b ) values (null,null);#可以重复 .

1. 创建表的时候直接指定

   ```sql
   CREATE TABLE `sales_activity_honey` (
     `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
     `type` tinyint(4) DEFAULT '0' COMMENT '活动类型ID',
     `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
     `num` int(11) DEFAULT NULL COMMENT '连续领取次数',
     `honey` int(11) DEFAULT NULL COMMENT '总领取数量',
     `last_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     PRIMARY KEY (`id`),
     UNIQUE KEY `unq_uid_type` (`uid`,`type`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
   ```

2. 创建索引

   ```sql
   CREATE UNIQUE INDEX indexName ON mytable(username(length)) 
   ```

3. 修改表结构

   ```sql
   ALTER table mytable ADD UNIQUE [indexName] ON (username(length)) 
   ```

### 常规索引  index || key

关键字 index 或 key
索引应该建立在搜索，排序，分组等操涉及的数据列上，就是在 where字句，from字句，order by字句，group by字句
不要建立太多索引，索引会消耗系统资源。

1. 创建表的时候直接指定

```sql
create table if not exists you(
id int not null ,
youname CHAR(20),
index indexname(youname(20))
);
```

2. 创建索引

   ```sql
   CREATE INDEX indexName ON mytable(username(length)); 
   ```

3. 修改表结构

```sql
ALTER mytable ADD INDEX [indexName] ON (username(length)) 
```



### 删除索引

```sql
DROP INDEX [indexName] ON mytable; 
```











# CURD

###  插入数据

```sql
insert into [tables_name](column1,column2,...) values(value1, value2,..)
```

### 更新数据

```sql
update [tables_name]set column1 = new_value1,column2 = new_value2,… WHERE definition
```

**update 表达式**

```sql
UPDATE article SET pv = pv+1 WHERE id = 123
```

**同时更新多个表**

```sql
update emp as a,dept as b set 
```



### 查询数据

```sql
select column1,column1,... FROM tb_name
```

### 替换数据

【主键或唯一索引冲突，执行替换，否则插入】

