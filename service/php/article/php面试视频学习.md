[TOC]

# php基础

![](https://ws1.sinaimg.cn/large/006tKfTcly1fmqr9ukol4j31kw06c0ug.jpg)



```php
// unset 只会取消引用，不会销毁空间
$a = 1;

$b = &$a;

unset($b);

echo $a. "\n";
```



todo 这里不明白

```php
/**
 * 写出如下程序的输出结果
 * <?php
 *
 * $data = ['a', 'b', 'c'];
 *
 * foreach($data as $key => $val)
 * {
 *      $val = &$data[$key];
 * }
 * 程序运行时，每一次循环结束后变量$data的值是什么？请解释
 * 程序执行完成后，变量$data的值是什么？请解释
 */

$data = ['a', 'b', 'c'];

foreach ($data as $key=>$val)
{
    $val = &$data[$key];
    var_dump($data);
}

var_dump($data);
```

常量和数据类型

![](https://ws3.sinaimg.cn/large/006tKfTcly1fmqruef3duj312q05cabe.jpg)

![](https://ws1.sinaimg.cn/large/006tKfTcly1fmqrypsgwej30lg0gsaba.jpg)

![](https://ws4.sinaimg.cn/large/006tKfTcly1fmqrzbi6ixj31kw0d2gqf.jpg)

![](https://ws3.sinaimg.cn/large/006tKfTcly1fmqrzorkm9j31j00e0q6l.jpg)

![](https://ws2.sinaimg.cn/large/006tKfTcly1fmqrzx1wgrj30lk05umxh.jpg)



浮点数不能用于 等于计算

```php
$a = 0.1;
$b = 0.7;
if($a+$b == 0.8){  // 计算机计算出来的结果: 0.7999999999999
    echo(2323);
}else {
    echo('不是0.8');
}

```



都是false

![](https://ws3.sinaimg.cn/large/006tKfTcly1fmqsary4ykj31do07odgh.jpg)



超全局数据



![](https://ws1.sinaimg.cn/large/006tKfTcly1fmqse1ychvj31k00fotbe.jpg)



const 和 define

![](https://ws4.sinaimg.cn/large/006tKfTcly1fmqseydoeij31680i6jtx.jpg)



![](https://ws4.sinaimg.cn/large/006tKfTcly1fmqsfhgidlj31kw0chn0b.jpg)



$_Server

![](https://ws1.sinaimg.cn/large/006tKfTcly1fmqsgd86yqj31au082gnh.jpg)



# 运算符

![](https://ws3.sinaimg.cn/large/006tKfTcly1fmqsi96jjaj30wy04et9g.jpg)

@-- 错误控制符

![](https://ws4.sinaimg.cn/large/006tKfTcly1fmqsjguhvrj31kw088tdg.jpg)

![](https://ws2.sinaimg.cn/large/006tKfTcly1fmqsncqiywj31ka0lajzq.jpg)

```php
$a = 0;
$b = 0;

if ($a = 3 > 0 || $b = 3 > 0) 
{
    $a++;
    $b++;
    echo $a. "\n"; // 1
    echo $b. "\n"; // 1
}


// 真是的执行顺序

$a = 0;
$b = 0;

if ($a = ( (3 > 0) || $b = 3 > 0 ) ) 
{
    $a++;
    $b++;
    echo $a. "\n";
    echo $b. "\n";
}
```





#  流程控制考察点

![](https://ws2.sinaimg.cn/large/006tKfTcly1fmqst53dqmj314q05q75p.jpg)

![](https://ws4.sinaimg.cn/large/006tKfTcly1fmqt17rn00j31500eeack.jpg)

![](https://ws1.sinaimg.cn/large/006tKfTcly1fmqt2ti1bfj31kw0f57cp.jpg)



把命中频率比较高的条件网前放.

![](https://ws3.sinaimg.cn/large/006tKfTcly1fmqt4qmt16j31kw0j5wnq.jpg)



![](https://ws4.sinaimg.cn/large/006tKfTcly1fmqt6oxdt0j31kw0djtd2.jpg)



![](https://ws4.sinaimg.cn/large/006tKfTcly1fmqtaicaorj31dw054wgb.jpg)



# 自定义函数及内部函数考察点



```php
$count = 5;
function get_count()
{
    static $count;  
    return $count++; // 先返回值 在 ++
}

echo $count; //5
++$count; //6

var_dump(get_count()) ;// NULL
var_dump(get_count()) ;// 1
```

![](https://ws1.sinaimg.cn/large/006tKfTcly1fmqtju860yj30r80nwgnu.jpg)



include 和 require

![](https://ws4.sinaimg.cn/large/006tKfTcly1fmqu5vm2uej31kw0cfdjm.jpg)

![](https://ws3.sinaimg.cn/large/006tKfTcly1fmqu6sggcwj31g80fu77b.jpg)



# 正则表达式的考点

![](https://ws2.sinaimg.cn/large/006tKfTcgy1fmquiyom9kj31kw05jwga.jpg)

![](https://ws2.sinaimg.cn/large/006tKfTcgy1fmqujwdjalj31kw06cdhf.jpg)

![](https://ws2.sinaimg.cn/large/006tKfTcgy1fmqulvmb8wj31fg0fytd9.jpg)







