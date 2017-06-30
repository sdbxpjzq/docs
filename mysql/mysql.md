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