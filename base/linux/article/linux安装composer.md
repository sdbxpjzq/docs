# [Linux 安装composer](http://www.cnblogs.com/gouge/p/7098697.html)

#### 1、下载composer.phar

```
curl -sS https://getcomposer.org/installer | php
```

#### 2、全局调用

```
1 mv composer.phar /usr/local/bin/composer
2 chmod +x composer
```

#### 3、测试安装结果

```
composer about
```

