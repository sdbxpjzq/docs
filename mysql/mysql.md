[TOC]

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

