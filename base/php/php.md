[TOC]



# PHP数据类型

整型(int)

浮点型(float)

复合数据类型

​	数组(Array)

​	对象(Object)

NULL

资源(resource)





# 超全局数组变量

![](https://ws3.sinaimg.cn/large/006tNc79gy1fkcvf9w5ibj31f60o042h.jpg)

## $_ENV

如果打印输出 `$_ENV` 为空，可以检查一下 php.ini 的配置：

`variables_order = "EGPCS"`

上述配置表示 PHP 接受的外部变量来源及顺序，`EGPCS` 是 `Environment`、`Get`、`Post`、`Cookies` 和 `Server` 的缩写。如果 `variables_order` 的配置中缺少` E` ，则 PHP 无法接受环境变量，那么 `$_ENV `也就为空了。

# empty, isset, is_null

## isset

检测一个变量是否已经声明,并且值**不为**`NULL`.

## empty

检测变量是否为空.

空字符串, `false`, 0, 空数组(`array()`), `NULL` , `unset`删除之后的变量 — 返回`true`.

## is_null

判断变量值是否为`NULL`

`is_null()`是`isset()`的反函数. 

区别: `is_null()`只能检测已经存在的变量.`isset()`可以检测未知变量.

# 常量

`PHP_INT_SIZE`：表示整数integer值的字长

`PHP_INT_MAX`：表示整数integer值的最大值

> 注意

32位中PHP_INT_SIZE：4，

PHP_INT_MAX：2147483647

64位中

PHP_INT_SIZE：8，

PHP_INT_MAX：9223372036854775807

# header() 

```
header(string,replace,http_response_code)
```

| 参数                 | 描述                                       |
| ------------------ | ---------------------------------------- |
| string             | 必需。规定要发送的报头字符串。                          |
| replace            | 可选。指示该报头是否替换之前的报头，或添加第二个报头。默认是 true（替换）。false（允许相同类型的多个报头）。 |
| http_response_code | 可选。把 HTTP 响应代码强制为指定的值。（PHP 4 以及更高版本可用）   |

![](https://ws3.sinaimg.cn/large/006tKfTcly1fisuq92eujj30z60remy3.jpg)



1. `header('Location: url')`
2. `header('Content-Type: ')`

跳转之后直接使用`exit()`或者 `die()`退出.

## 延时跳转

```php
header("refresh:3;url=https://m.mafengwo.cn");
echo "正在加载,3秒后自动跳转...";
```





# 跑数据时常见问题

由于数据量比较大, 可能会遇到执行超时,超出内存等其他问题.

```php
ini_set('memory_limit', '1024M');
ini_set('max_execution_time', '0');
```

# function use 匿名函数(闭包函数)

```php
$message = 'world';
// 继承 $message
$example = function ($info) use ($message) {
    var_dump($message);
};
echo $example('hello'); // hello world
```

http://blog.csdn.net/suiye/article/details/8742380



# 序列化数据

`serialize` 和 `unserialize`

serialize,会自动调用 `__sleep()`

unserialize,会自动调用 `__wakeup()`

`json_encode` 和 `json_decode`

```php
$arr  = array('hello','world');
$str = serialize($arr);
$arr3 = unserialize($str);

$arr4  = array('hello','world');
$str2 = json_encode($arr);
$arr5 = json_decode($str2,true);

```







# 异常处理

![](https://ws1.sinaimg.cn/large/006tNc79ly1fjmjgf2bauj317c0s8dh9.jpg)



# is_callable() 与 method_exists()

![](https://ws1.sinaimg.cn/large/006tKfTcgy1fkejg5xaadj31io0pywhg.jpg)



# 输出缓冲控制(ob缓存)

php缓冲区是默认开启的. `php.ini` 中  `output_buffering`.默认值是 `4096`

```
output_buffering = On
output_buffering = 4096
```

php一旦调用了`ob_start()`函数,就会将php缓冲区扩展到足够大,直到调用`ob_end_flush()`或者脚本运行结束, 才将php缓冲区的数据发送到浏览器.













 























# 网址收藏

https://laravel-china.github.io/php-the-right-way/





http://www.cnblogs.com/52fhy/p/6931261.html