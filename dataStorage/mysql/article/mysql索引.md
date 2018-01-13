# mysql索引

## 主键索引  primary key

一个表只能指定一个主键，且主键的值不能为空。

## 唯一索引  unique

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

   // length注意: 
   如果是CHAR，VARCHAR类型，length可以小于字段实际长度；
   如果是BLOB和TEXT类型，必须指定 length。
   ```

3. 修改表结构

   ```sql
   ALTER table mytable ADD UNIQUE [uniq_name] ([字段1,字段2])
   ```

4. 删除索引

   ```sql
   alter table [table_name] drop key [key_name]
   ```