[TOC]



# 远程连接

`mysql -hlocalhost -p3306 –uroot –p`

UPDATE user SET PASSWORD=PASSWORD('sdbxpjzq1234') where USER='root'; 

SET PASSWORD = PASSWORD("sdbxpjzq1234");

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







#  列属性

## unsigned

- 只能用于数值类型,表示无符号的。
- 不允许数据出现负数。
- 紧跟在 数字类型后面，

```sql
create table if not exists USER(
    id int(10) unsigned not null auto_increment primary key ,
    username varchar(20) not null
);
```



## zerofill

- 只能用于数值类型，在数值之前自动用0  补齐不足的位数
- 当给一个字段使用`zerofill`修饰时，该字段自动应用`unsigned`。



## auto_increment

自动增量属性。此字段**不允许重复**，只能修饰**整数类**的字段，

设置auto_increment必须设置一个key



## null和 not null

  null是特殊的值，代表无值，与0和空字符串都不相同



## default

指定一个默认值

# CURD

##  插入数据

```sql
insert into [tables_name](column1,column2,...) values(value1, value2,..)
```

## 更新数据

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



## 查询数据

```sql
select column1,column1,... FROM tb_name where a =1;
```

### where条件

- `like`进行模糊查询

两个通配符 `_ `和`%`
`%` --表示0个或多个任意字符
`_`  ----单个任意字符

- 排序

`ASC`--升序【默认】(从小到大)
`DESC`--降序(从大到小)

- limit

序号从0开始计算

放在sql语句的最后.

- 聚合(having)

```sql
select  * from tablename where 条件 group by 关键字 having 条件;
```

`having`和`where` 的区别:

`having`是对聚合后的结果进行条件过滤，`where `是在聚合前对记录进行过滤，

栗子:

Q: 查询table表查询每一个班级中年龄大于20，性别为男的人数.

```sql
select COUNT(*)as '>20岁人数',classid  from Table1 where sex='男' group by classid,age having age>20;
```

--需要注意说明：当同时含有where子句、group by 子句 、having子句及聚集函数时，执行顺序如下：
--执行where子句查找符合条件的数据；
--使用group by 子句对数据进行分组；对group by 子句形成的组运行聚集函数计算每一组的值；最后用having 子句去掉不符合条件的组。
--having 子句中的每一个元素也必须出现在select列表中。有些数据库例外，如oracle.
--having子句和where子句都可以用来设定限制条件以使查询结果满足一定的条件限制。
--having子句限制的是组，而不是行。where子句中不能使用聚集函数，而having子句中可以



## 替换数据

【主键或唯一索引冲突，执行替换，否则插入】



## 查找重复数据

```sql
select id,uid,count(*) as count from sales_photopk_list group by activity_id having count>1;

```



# 连表查询

![](https://ws2.sinaimg.cn/large/006tKfTcly1figufzvzo3j30fd09zglt.jpg)

## 内连接

选出两张表中相互匹配的记录，连接的多个数据必须存在才能进行连接 .

方式一:

```sql
select a.ename, b.deptname from emp as a,dept as b where a.deptno=b.deptno; //在没有用关键字的情况下，使用on条件会报错
```

方式二:

`inner join`关键字

```sql
select * from news inner join you on news.id = you.id; 
```

方式三:
`using()`关键字

要求：**连接的两个实体之间的字段名称一致**

```sql
select * from news inner join you using(id); 
```



## 外连接

### 左连接(left  outer  join)

包含所有左边表中的记录，甚至是右表中没有和他相匹配的记录.

### 右连接(right outer  join)

包含所有的右边的记录，甚至是左边表中没有与他相匹配的记录

### 注意事项

1. 不支持`where`作为连接条件, 使用 `on`
2. `using`：会去掉结果中的重复字段，并将判断条件放在第一列
3. 外连接不能缺少连接条件，否则会报错

```sql
A left join B ON 条件表达式;
select * from news left join you on news.id=you.id;
```



## 自然连接(natural join)

通过mysql自己的判断完成连接的过程，不需要指定连接条件，mysql会使用多表内的，相同的字段，作为连接条件。

```sql
select * from  table1  natrual  join  table2;
```

分类：

- 内连接：`natural join`
- 左外连接：`natural left join`
- 右外连接：`natural right join`



# SQL中on条件与where条件的区别

数据库在通过连接两张或多张表来返回记录时，都会生成一张中间的临时表，然后再将这张临时表返回给用户。 

在使用`left jion`时，`on`和`where`条件的区别如下：

1、 `on`条件是在生成临时表时使用的条件，它不管on中的条件是否为真，都会返回左边表中的记录。

2、`where`条件是在临时表生成好后，再对临时表进行过滤的条件。这时已经没有`left join`的含义（必须返回左边表的记录）了，条件不为真的就全部过滤掉。







# 联合查询 - union ,union all

合并两个或多个 SELECT 语句的结果集

`union` 、`union all`

## union和union all的区别

- union all是把结果直接合并在一起
- union是将union all的后的结果进行一次`distinct`(去重),之后的结果

栗子:

```sql
(select id from news)
union all
(select id from you);//推荐将select语句用（）包起来
```

```txt
id  
--------
       2
       3
       4
       5
       2
       3
```

```sql
(select id from news)
union
(select id from you);
```

```txt
 id  
--------
       2
       3
       4
       5
```



## 注意事项

1. **子语句的 order by，只有在配合limit时，才会生效**.

原因：union会对没有limit 的 order by 忽略。

```sql
(SELECT id,name FROM table_name1 order by id limit 100)
union
(SELECT id,name FROM table_name2 order by id limit 100);
```

对union结果排序

```sql
(SELECT id, name FROM table_name1)
union
(SELECT id,name FROM table_name2)order by id asc|desc;
```



2. **UNION 内部的 SELECT 语句必须拥有相同数量的列**
3. **列也必须拥有相似的数据类型。同时，每条 SELECT 语句中的列的顺序必须相同**







# 模式问题



## 查看模式

```sql
select @@sql_mode;
SELECT @@GLOBAL.sql_mode;
```

## 修改模式

需要root权限

### 修改配置文件

  `  vim /etc/my.cnf`

在`[mysqld]`下面添加如下列：

`sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES`

### 执行sql

```sql
SET @@sql_mode="NO_ENGINE_SUBSTITUTION";
SET @@GLOBAL.sql_mode="NO_ENGINE_SUBSTITUTION";
```



http://www.ywnds.com/?p=8865



# sql注入

```
mysql_real_escape_string(string,connection)
```

转义 SQL 语句中使用的字符串中的特殊字符.

下列字符受影响：

- \x00
- \n
- \r
- \
- '
- "
- \x1a

如果成功，则该函数返回被转义的字符串。如果失败，则返回 false

| 参数         | 描述                             |
| ---------- | ------------------------------ |
| string     | 必需。规定要转义的字符串。                  |
| connection | 可选。规定 MySQL 连接。如果未规定，则使用上一个连接。 |



![](https://ws3.sinaimg.cn/large/006tKfTcly1fj21hpty5qj31a60ccgmg.jpg)

小技巧: 为了避免整形数据可能不被SQL中增加引号, 强制在转换后的数据使用引号包裹.









# MySQL 5.7全新功能

http://www.jb51.net/article/87092.htm

## **JSON**

`MySQL`数据库从`5.7.8`版本开始，也提供了对`JSON`的支持.























