# FIND_IN_SET查询



测试代码:

```sql
CREATE TABLE `test` ( 
 `id` int(8) NOT NULL auto_increment, 
 `name` varchar(255) NOT NULL, 
 `list` varchar(255) NOT NULL, 
 PRIMARY KEY (`id`) 
) 
INSERT INTO `test` VALUES (1, 'name', 'daodao,xiaohu,xiaoqin'); 
INSERT INTO `test` VALUES (2, 'name2', 'xiaohu,daodao,xiaoqin'); 
INSERT INTO `test` VALUES (3, 'name3', 'xiaoqin,daodao,xiaohu'); 


test1:sql = select * from `test` where 'daodao' IN (`list`); 
得到结果空值. 
test2:sql = select * from `test` where FIND_IN_SET('daodao',`list`); 
得到三条数据。 

```



http://www.jb51.net/article/125744.htm