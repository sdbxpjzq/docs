[TOC]

# 安装

`npm install -g pm2`

# 常用命令

`pm2 start ./bin/www --watch`

这里用了`--watch`参数，意味着当你的应用代码发生变化时，pm2会帮你重启服务

参数说明：

- `--watch`：监听应用目录的变化，一旦发生变化，自动重启。如果要精确监听、不见听的目录，最好通过配置文件。
- `-i --instances`：启用多少个实例，可用于负载均衡。如果`-i 0`或者`-i max`，则根据当前机器核数确定实例数目。
- `--ignore-watch`：排除监听的目录/文件，可以是特定的文件名，也可以是正则。比如`--ignore-watch="test node_modules "some scripts""`
- `-n --name`：应用的名称。查看应用信息的时候可以用到。
- `-o --output <path>`：标准输出日志文件的路径。
- `-e --error <path>`：错误输出日志文件的路径。
- `--interpreter <interpreter>`：the interpreter pm2 should use for executing app (bash, python...)。比如你用的coffee script来编写应用。

`pm2 start app.js --watch -i 2`

`pm2 restart app.js`

`pm2 stop app_name|app_id`

`pm2 delete app_name|app_id`

`pm2 list`



[参考--PM2实用入门指南](http://www.cnblogs.com/chyingp/p/pm2-documentation.html)



