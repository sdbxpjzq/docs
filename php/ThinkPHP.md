[TOC]



# Nginx解析

http://wp.iyouths.org/343.html

1. 将`root`配置为 `root /home/wwwroot/xxx.com/public;`
2. `fastcgi.conf`

添加: `fastcgi_param PHP_ADMIN_VALUE $basedir if_not_empty;`

`$basedir`变量就可以在`nginx/conf/vhost/xxx.com.conf`配置文件里的

`include enable-php.conf`前(这里可能每个人不同)赋值：

`set $basedir "open_basedir=/home/wwwroot/xxx.com/:/tmp/:/proc/";`

**注意rewrite规则：**

```shell
location / {
            if (!-e $request_filename){
                rewrite ^/(.*)$ /index.php?s=/$1 last;
            }
}
```



https://www.kancloud.cn/manual/thinkphp5/177576

enable-php.conf

```php
location ~ [^/]\.php(/|$)
{
try_files $uri =404;
fastcgi_pass  unix:/tmp/php-cgi.sock;
fastcgi_index index.php;
include fastcgi.conf;
set $fastcgi_script_name2 $fastcgi_script_name;
    if ($fastcgi_script_name ~ "^(.+\.php)(/.+)$") {
        set $fastcgi_script_name2 $1;
        set $path_info $2;
    }
    fastcgi_param   PATH_INFO $path_info;
   fastcgi_param   SCRIPT_FILENAME   $document_root$fastcgi_script_name2;
   fastcgi_param   SCRIPT_NAME   $fastcgi_script_name2;
}
```



### 目录和文件

- 目录使用小写+下划线；
- 类库、函数文件统一以`.php`为后缀；
- 类的文件名均以命名空间定义，并且命名空间的路径和类库文件所在路径一致；
- 类文件采用驼峰法命名（首字母大写），其它文件采用小写+下划线命名；
- 类名和类文件名保持一致，统一采用驼峰法命名（首字母大写）；

### 函数和类、属性命名

- 类的命名采用驼峰法（首字母大写），例如 `User`、`UserType`，默认不需要添加后缀，例如`UserController`应该直接命名为`User`；
- 函数的命名使用小写字母和下划线（小写字母开头）的方式，例如 `get_client_ip`；
- 方法的命名使用驼峰法（首字母小写），例如 `getUserName`；
- 属性的命名使用驼峰法（首字母小写），例如 `tableName`、`instance`；
- 以双下划线“__”打头的函数或方法作为魔术方法，例如 `__call` 和 `__autoload`；

### 常量和配置

- 常量以大写字母和下划线命名，例如 `APP_PATH`和 `THINK_PATH`；
- 配置参数以小写字母和下划线命名，例如 `url_route_on` 和`url_convert`；

### 数据表和字段

- 数据表和字段采用小写加下划线方式命名，并注意字段名不要以下划线开头，例如 `think_user` 表和 `user_name`字段，不建议使用驼峰和中文作为数据表字段命名。

### 应用类库命名空间规范

应用类库的根命名空间统一为app（不建议更改，可以设置`app_namespace`配置参数更改，`V5.0.8`版本开始使用`APP_NAMESPACE`常量定义）；
例如：`app\index\controller\Index`和`app\index\model\User`。



# Model层

### 连接数据库

```php
Db::table() 是单例模式
db() 并不是单例模式,默认每次都会重新连接数据库
```

### where

```php
Db::table()->where('name','thinkphp')->select();
```

数组形式

```php
$aData = array(
	'name'=>'thinkphp'
);
Db::table()->where($aData)->select();
```



# 命令执行接口

























