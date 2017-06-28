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

