

```php
$iCurrent = 0;
do {

    $aResult = $oRedis->vHScan($sKey, $iCurrent, 100);
    foreach ($aResult as $iSalesId=>$value) {

    }

} while($iCurrent!=0);
```

[SCAN](http://www.redis.cn/commands/scan.html)命令是一个基于游标的迭代器。这意味着命令每次被调用都需要使用上一次这个调用返回的游标作为该次调用的游标参数，以此来延续之前的迭代过程

当[SCAN](http://www.redis.cn/commands/scan.html)命令的游标参数（即cursor）被设置为 0 时， 服务器将开始一次新的迭代， 而当服务器向用户返回值为 0 的游标时， 表示迭代已结束。