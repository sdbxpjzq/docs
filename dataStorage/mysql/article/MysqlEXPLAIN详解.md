# Mysql  explain

```sql
EXPLAIN SELECT * FROM sales_promotion WHERE component_unique_key='20180101';
```

![](https://ws4.sinaimg.cn/large/006tNc79gy1fnafpu2mfgj31iu05aq30.jpg)

https://www.jianshu.com/p/ea3fc71fdc45

| 列名          | 说明                                       |
| ----------- | ---------------------------------------- |
| id          | 执行编号，标识select所属的行。如果在语句中没子查询或关联查询，只有唯一的select，每行都将显示1。否则，内层的select语句一般会顺序编号，对应于其在原始语句中的位置 |
| select_type | 显示本行是简单或复杂select。如果查询有任何复杂的子查询，则最外层标记为PRIMARY（DERIVED、UNION、UNION RESUlT） |
| table       | 访问引用哪个表（引用某个查询，如“derived3”）              |
|             |                                          |
|             |                                          |
|             |                                          |
|             |                                          |
|             |                                          |
|             |                                          |
|             |                                          |
|             |                                          |













