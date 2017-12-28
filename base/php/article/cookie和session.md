[TOC]

# 会话技术

## cookie

`setcookie(name,value,expire,path,domain,secure)`

| 参数     | 说明                                       |                                          |
| ------ | ---------------------------------------- | ---------------------------------------- |
| name   | cookie 名称                                |                                          |
| value  | 可选，cookie 值。不要保存敏感数据                     |                                          |
| expire | 可选，过期时间，时间戳格式                            | 如 time()+60\*60\*24\*7将设定cookie在一周后失效。如果未设置，则在会话结束后立即失效。若设置`PHP_INT_MAX`表示永久有效 |
| path   | 可选，服务器端有效路径，/ 表示整个域名有效，默认为当前设置 cookie 时页面的路径 |                                          |
| domain | 可选，该 cookie 有效的域名                        | 要使cookie能在如`www.zongqi.com`  域名下的所有子域名都有效的话，该参数应该`http://www.zongqi.com`域名下的所有子域名都有效的话，该参数应该为 "`.zongqi.com`"。虽然“`.`”并不是必须的，但加上他会兼容更多的浏览器。 |
| secure | 指明cookie是否仅通过安全的HTTPS连接传送                | 设置为true时，cookie仅在安全的连接中设置。默认是false,HTTP和HTTPS上都有效 |

不同路径下, 同名cookie可以同时存在浏览器,但是会出现重写, 先查看找当前目录下的cookie,再向上查找. 

### 删除 cookie

设置cookie在当前时间已经过期，系统会自动删除

`setcookie（$name,$value, time()-1）`

### 读取cookie

`$_COOKIE[“name”]`



### 数组形式的cookie

```php
setcookie("user[username]","zongqi");  // $_COOKIE["user"]["username"]
setcookie("user[password]",  md5("123456"));  //$_COOKIE["user"]["password"]
setcookie("user[email]","1165064143@qq.com");//$_COOKIE["user"]["email"]

foreach($_COOKIE["user"] as key=>val){
    echo $key.":".$val;
}
```



## HTTPONLY

默认: 

浏览器存储的cookie可以被其他脚本所处理.

设置`HTTPONLY`,表示仅在http请求中使用

http://www.cnblogs.com/milantgh/p/3766967.html

## 注意事项

![](https://ws3.sinaimg.cn/large/006tKfTcly1fipbi9a0o3j31ay0jq0vj.jpg)



## session

默认保存在临时文件中, 文件的形式存在.

### 开始session

`session_start();` 

或者在配置文件`php.ini`

`session.auto_start`

`session_start()`函数会创建一个唯一的`session ID`，并自动通过HTTP的响应头，将这个session  ID保存到客户端cookie中。同时也在服务器端创建一个以这个session  ID命名的文件，用于保存这个用户的会话信息。
当同一个用户再次访问这个网站时，也会自动通过HTTP的请求头将cookie中的session  ID再携带过来，这时`session_start()`就不会再去分配一个新的session  ID，而是在服务器的硬盘里去寻找和这个session  ID同名的session文件，将之前为这个用户保存的会话信息读出，达到在跟踪用户的目的。

### 读取session

`$_SESSION`

```php
$_SESSION['name'] = 'zongqi';
unset($_SESSION['name'])

```

### 销毁session

```php
session_destroy();  //销毁和当前session有关的所有资料
```

该函数用来删除session文件，如果成功返回true。

但是不会释放和当前session相关的变量，也不会删除保存在客户端cookie中的session  ID。

### 释放session变量

```php
unset($_SESSION["name"]);
```



### 完整销毁session数据

![](https://ws1.sinaimg.cn/large/006tNc79ly1fixbwck65nj30zq0gyabe.jpg)

上面销毁session.

```php
$_SESSION = array(); //清空session数据
```

### 垃圾回收

“垃圾回收程序”就是根据session文件修改时间，将过期的session文件全部删除。通过`session.gc_maxlifetime` = 1440 设置时间，若修改时间距离当前系统时间大于1440秒，就会被删除

垃圾回收机制是在调用session_start()函数启动的，有时很有可能session_start()在一秒内内调用N次，每次都会启动垃圾回收机制，这是合不合理的。

通过修改`session.gc_probability = 1`和`session.gc_divisor = 1000` ，设置启动垃圾回收程序的概率。 —`1/1000`.