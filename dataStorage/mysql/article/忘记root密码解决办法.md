[TOC]

# 忘记root密码解决办法

1. 停止mysqld； 

	`/etc/init.d/mysql stop`

2. 用以下命令启动MySQL，以不检查权限的方式启动； 

	`mysqld --skip-grant-tables &`

3. 然后用空密码方式使用root用户登录 MySQL； 

	`mysql -u root`

4. 修改root用户的密码； 

	`update mysql.user set password=password('root') where User='root';`; 

	5.7版本会报错`Unknown column 'password' in 'field list'`.原来是mysql数据库下已经没有password这个字段了, 改成了`authentication_string`

	所以运行

	`update mysql.user set authentication_string=password('root') where user='root';`

	`flush privileges;`
	`quit `

5. 重新启动MySQL

	`/etc/init.d/mysql restart`
	就可以使用新密码 newpassword 登录了。