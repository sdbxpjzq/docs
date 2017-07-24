[TOC]



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









# PHP 日期 加减 月数,天数,周数,小时,分,秒

- PHP 日期 加减 周  

  `date("Y-m-d",strtotime("2013-11-12 +1 week")) `

- PHP 日期 加减 天数 

  `date("Y-m-d",strtotime("2013-11-12 12:12:12 +1 day"))  `

- PHP 日期加减小时  

  `date("Y-m-d h:i:s",strtotime("2013-11-12 12:12:12 +1 hour"))`  


- PHP 日期 加减 月数  

  `date("Y-m-d",strtotime("2013-11-12 12:12:12 +1 month"))  `

- PHP 日期 加减 分  

  `date("Y-m-d h:i:s",strtotime("2013-11-12 12:12:12 +1 minute"))  `

- PHP 日期 加减 秒  

  `date("Y-m-d h:i:s",strtotime("2013-11-12 12:12:12 +1 second"))  `



# date() 格式化时间

## 年

- Y - 年份的四位数表示 // 2017
- y - 年份的两位数表示 // 07
- L - 是否是闰年（如果是闰年则为 1，否则为 0）
- o - ISO-8601 标准下的年份数字

## 月

- m - 月份的数字表示（从 01 到 12）
- M - 月份的短文本表示（用三个字母表示）
- n - 月份的数字表示，不带前导零（1 到 12）
- F - 月份的完整的文本表示（January[一月份] 到 December[十二月份]）
- t - 给定月份中包含的天数

## 日

- d - 一个月中的第几天（从 01 到 31）
- j - 一个月中的第几天，不带前导零（1 到 31）
- z - 一年中的第几天（从 0 到 365）



## 星期几

- D - 星期几的文本表示（用三个字母表示）
- l（'L' 的小写形式）- 星期几的完整的文本表示
- N - 星期几的 ISO-8601 数字格式表示（1表示Monday[星期一]，7表示Sunday[星期日]）
- w - 星期几的数字表示（0 表示 Sunday[星期日]，6 表示 Saturday[星期六]）
- W - 用 ISO-8601 数字格式表示一年中的星期数字（每周从 Monday[星期一]开始）



## 时

- a - 小写形式表示：am 或 pm
- A - 大写形式表示：AM 或 PM



- g - 12 小时制，不带前导零（1 到 12）
- G - 24 小时制，不带前导零（0 到 23）
- h - 12 小时制，带前导零（01 到 12）
- H - 24 小时制，带前导零（00 到 23）

## 分

- i - 分，带前导零（00 到 59）

## 秒

- s - 秒，带前导零（00 到 59）
- u - 微秒（PHP 5.2.2 中新增的）



## 其他

- S - 一个月中的第几天的英语序数后缀（2 个字符：st、nd、rd 或 th。与 j 搭配使用）
- B - Swatch Internet Time（000 到 999）
- e - 时区标识符（例如：UTC、GMT、Atlantic/Azores）
- I（i 的大写形式）- 日期是否是在夏令时（如果是夏令时则为 1，否则为 0）
- O - 格林威治时间（GMT）的差值，单位是小时（实例：+0100）
- P - 格林威治时间（GMT）的差值，单位是 hours:minutes（PHP 5.1.3 中新增的）
- T - 时区的简写（实例：EST、MDT）
- Z - 以秒为单位的时区偏移量。UTC 以西时区的偏移量为负数（-43200 到 50400）
- c - ISO-8601 标准的日期（例如 2013-05-05T16:34:42+00:00）
- r - RFC 2822 格式的日期（例如 Fri, 12 Apr 2013 12:01:05 +0200）
- U - 自 Unix 纪元（January 1 1970 00:00:00 GMT）以来经过的秒数





# Array



| 函数                                       | 描述                                       |
| ---------------------------------------- | ---------------------------------------- |
| [array()](http://www.w3school.com.cn/php/func_array.asp) | 创建数组。                                    |
| [array_change_key_case()](http://www.w3school.com.cn/php/func_array_change_key_case.asp) | 把数组中所有键更改为小写或大写。                         |
| [array_chunk()](http://www.w3school.com.cn/php/func_array_chunk.asp) | 把一个数组分割为新的数组块。                           |
| [array_column()](http://www.w3school.com.cn/php/func_array_column.asp) | 返回输入数组中某个单一列的值。                          |
| [array_combine()](http://www.w3school.com.cn/php/func_array_combine.asp) | 通过合并两个数组来创建一个新数组。                        |
| [array_count_values()](http://www.w3school.com.cn/php/func_array_count_values.asp) | 用于统计数组中所有值出现的次数。                         |
| [array_diff()](http://www.w3school.com.cn/php/func_array_diff.asp) | 比较数组，返回差集（只比较键值）。                        |
| [array_diff_assoc()](http://www.w3school.com.cn/php/func_array_diff_assoc.asp) | 比较数组，返回差集（比较键名和键值）。                      |
| [array_diff_key()](http://www.w3school.com.cn/php/func_array_diff_key.asp) | 比较数组，返回差集（只比较键名）。                        |
| [array_diff_uassoc()](http://www.w3school.com.cn/php/func_array_diff_uassoc.asp) | 比较数组，返回差集（比较键名和键值，使用用户自定义的键名比较函数）。       |
| [array_diff_ukey()](http://www.w3school.com.cn/php/func_array_diff_ukey.asp) | 比较数组，返回差集（只比较键名，使用用户自定义的键名比较函数）。         |
| [array_fill()](http://www.w3school.com.cn/php/func_array_fill.asp) | 用给定的键值填充数组。                              |
| [array_fill_keys()](http://www.w3school.com.cn/php/func_array_fill_keys.asp) | 用指定键名的给定键值填充数组。                          |
| [array_filter()](http://www.w3school.com.cn/php/func_array_filter.asp) | 用回调函数过滤数组中的元素。                           |
| [array_flip()](http://www.w3school.com.cn/php/func_array_flip.asp) | 交换数组中的键和值。                               |
| [array_intersect()](http://www.w3school.com.cn/php/func_array_intersect.asp) | 比较数组，返回交集（只比较键值）。                        |
| [array_intersect_assoc()](http://www.w3school.com.cn/php/func_array_intersect_assoc.asp) | 比较数组，返回交集（比较键名和键值）。                      |
| [array_intersect_key()](http://www.w3school.com.cn/php/func_array_intersect_key.asp) | 比较数组，返回交集（只比较键名）。                        |
| [array_intersect_uassoc()](http://www.w3school.com.cn/php/func_array_intersect_uassoc.asp) | 比较数组，返回交集（比较键名和键值，使用用户自定义的键名比较函数）。       |
| [array_intersect_ukey()](http://www.w3school.com.cn/php/func_array_intersect_ukey.asp) | 比较数组，返回交集（只比较键名，使用用户自定义的键名比较函数）。         |
| [array_key_exists()](http://www.w3school.com.cn/php/func_array_key_exists.asp) | 检查指定的键名是否存在于数组中。                         |
| [array_keys()](http://www.w3school.com.cn/php/func_array_keys.asp) | 返回数组中所有的键名。                              |
| [array_map()](http://www.w3school.com.cn/php/func_array_map.asp) | 把数组中的每个值发送到用户自定义函数，返回新的值。                |
| [array_merge()](http://www.w3school.com.cn/php/func_array_merge.asp) | 把一个或多个数组合并为一个数组。                         |
| [array_merge_recursive()](http://www.w3school.com.cn/php/func_array_merge_recursive.asp) | 递归地合并一个或多个数组。                            |
| [array_multisort()](http://www.w3school.com.cn/php/func_array_multisort.asp) | 对多个数组或多维数组进行排序。                          |
| [array_pad()](http://www.w3school.com.cn/php/func_array_pad.asp) | 用值将数组填补到指定长度。                            |
| [array_pop()](http://www.w3school.com.cn/php/func_array_pop.asp) | 删除数组的最后一个元素（出栈）。[ 返回数组的**最后一个值**。如果数组是空的，或者非数组，将返回 NULL] |
| [array_product()](http://www.w3school.com.cn/php/func_array_product.asp) | 计算数组中所有值的乘积。                             |
| [array_push()](http://www.w3school.com.cn/php/func_array_push.asp) | 将一个或多个元素插入数组的末尾（入栈）。                     |
| [array_rand()](http://www.w3school.com.cn/php/func_array_rand.asp) | 返回数组中一个或多个随机的键。                          |
| [array_reduce()](http://www.w3school.com.cn/php/func_array_reduce.asp) | 通过使用用户自定义函数，以字符串返回数组。                    |
| [array_replace()](http://www.w3school.com.cn/php/func_array_replace.asp) | 使用后面数组的值替换第一个数组的值。                       |
| [array_replace_recursive()](http://www.w3school.com.cn/php/func_array_replace_recursive.asp) | 递归地使用后面数组的值替换第一个数组的值。                    |
| [array_reverse()](http://www.w3school.com.cn/php/func_array_reverse.asp) | 以相反的顺序返回数组。                              |
| [array_search()](http://www.w3school.com.cn/php/func_array_search.asp) | 搜索数组中给定的值并返回键名。                          |
| [array_shift()](http://www.w3school.com.cn/php/func_array_shift.asp) | 删除数组中首个元素，并返回被删除元素的值。                    |
| [array_slice()](http://www.w3school.com.cn/php/func_array_slice.asp) | 返回数组中被选定的部分。                             |
| [array_splice()](http://www.w3school.com.cn/php/func_array_splice.asp) | 删除并替换数组中指定的元素。                           |
| [array_sum()](http://www.w3school.com.cn/php/func_array_sum.asp) | 返回数组中值的和。                                |
| [array_udiff()](http://www.w3school.com.cn/php/func_array_udiff.asp) | 比较数组，返回差集（只比较值，使用一个用户自定义的键名比较函数）。        |
| [array_udiff_assoc()](http://www.w3school.com.cn/php/func_array_udiff_assoc.asp) | 比较数组，返回差集（比较键和值，使用内建函数比较键名，使用用户自定义函数比较键值）。 |
| [array_udiff_uassoc()](http://www.w3school.com.cn/php/func_array_udiff_uassoc.asp) | 比较数组，返回差集（比较键和值，使用两个用户自定义的键名比较函数）。       |
| [array_uintersect()](http://www.w3school.com.cn/php/func_array_uintersect.asp) | 比较数组，返回交集（只比较值，使用一个用户自定义的键名比较函数）。        |
| [array_uintersect_assoc()](http://www.w3school.com.cn/php/func_array_uintersect_assoc.asp) | 比较数组，返回交集（比较键和值，使用内建函数比较键名，使用用户自定义函数比较键值）。 |
| [array_uintersect_uassoc()](http://www.w3school.com.cn/php/func_array_uintersect_uassoc.asp) | 比较数组，返回交集（比较键和值，使用两个用户自定义的键名比较函数）。       |
| [array_unique()](http://www.w3school.com.cn/php/func_array_unique.asp) | 删除数组中的重复值。                               |
| [array_unshift()](http://www.w3school.com.cn/php/func_array_unshift.asp) | 在数组开头插入一个或多个元素。                          |
| [array_values()](http://www.w3school.com.cn/php/func_array_values.asp) | 返回数组中所有的值。                               |
| [array_walk()](http://www.w3school.com.cn/php/func_array_walk.asp) | 对数组中的每个成员应用用户函数。                         |
| [array_walk_recursive()](http://www.w3school.com.cn/php/func_array_walk_recursive.asp) | 对数组中的每个成员递归地应用用户函数。                      |
| [arsort()](http://www.w3school.com.cn/php/func_array_arsort.asp) | 对关联数组按照键值进行降序排序。                         |
| [asort()](http://www.w3school.com.cn/php/func_array_asort.asp) | 对关联数组按照键值进行升序排序。                         |
| [compact()](http://www.w3school.com.cn/php/func_array_compact.asp) | 创建包含变量名和它们的值的数组。                         |
| [count()](http://www.w3school.com.cn/php/func_array_count.asp) | 返回数组中元素的数目。                              |
| [current()](http://www.w3school.com.cn/php/func_array_current.asp) | 返回数组中的当前元素。                              |
| [each()](http://www.w3school.com.cn/php/func_array_each.asp) | 返回数组中当前的键／值对。                            |
| [end()](http://www.w3school.com.cn/php/func_array_end.asp) | 将数组的内部指针指向最后一个元素。                        |
| [extract()](http://www.w3school.com.cn/php/func_array_extract.asp) | 从数组中将变量导入到当前的符号表。                        |
| [in_array()](http://www.w3school.com.cn/php/func_array_in_array.asp) | 检查数组中是否存在指定的值。                           |
| [key()](http://www.w3school.com.cn/php/func_array_key.asp) | 从关联数组中取得键名。                              |
| [krsort()](http://www.w3school.com.cn/php/func_array_krsort.asp) | 对数组按照键名逆向排序。                             |
| [ksort()](http://www.w3school.com.cn/php/func_array_ksort.asp) | 对数组按照键名排序。                               |
| [list()](http://www.w3school.com.cn/php/func_array_list.asp) | 把数组中的值赋给一些变量。                            |
| [natcasesort()](http://www.w3school.com.cn/php/func_array_natcasesort.asp) | 用“自然排序”算法对数组进行不区分大小写字母的排序。               |
| [natsort()](http://www.w3school.com.cn/php/func_array_natsort.asp) | 用“自然排序”算法对数组排序。                          |
| [next()](http://www.w3school.com.cn/php/func_array_next.asp) | 将数组中的内部指针向前移动一位。                         |
| [pos()](http://www.w3school.com.cn/php/func_array_pos.asp) | current() 的别名。                           |
| [prev()](http://www.w3school.com.cn/php/func_array_prev.asp) | 将数组的内部指针倒回一位。                            |
| [range()](http://www.w3school.com.cn/php/func_array_range.asp) | 创建包含指定范围单元的数组。                           |
| [reset()](http://www.w3school.com.cn/php/func_array_reset.asp) | 将数组的内部指针指向第一个元素。                         |
| [rsort()](http://www.w3school.com.cn/php/func_array_rsort.asp) | 对数组逆向排序。                                 |
| [shuffle()](http://www.w3school.com.cn/php/func_array_shuffle.asp) | 将数组打乱。                                   |
| [sizeof()](http://www.w3school.com.cn/php/func_array_sizeof.asp) | count() 的别名。                             |
| [sort()](http://www.w3school.com.cn/php/func_array_sort.asp) | 对数组排序。                                   |
| [uasort()](http://www.w3school.com.cn/php/func_array_uasort.asp) | 使用用户自定义的比较函数对数组中的键值进行排序。                 |
| [uksort()](http://www.w3school.com.cn/php/func_array_uksort.asp) | 使用用户自定义的比较函数对数组中的键名进行排序。                 |
| [usort()](http://www.w3school.com.cn/php/func_array_usort.asp) | 使用用户自定义的比较函数对数组进行排序。                     |





# 序列化数据

`serialize` 和 `unserialize`

serialize,会自动调用 `__sleep()`

unserialize,会自动调用 `__wakeup()`



`json_encode` 和 `json_decode`

```
$arr  = array('hello','world');
$str = serialize($arr);
$arr3 = unserialize($str);

$arr4  = array('hello','world');
$str2 = json_encode($arr);
$arr5 = json_decode($str2,true);

```



# 面向对象

属性, 常量 , 方法 

## 对象创建的基本形式:

1. `$对象名 = new 类名()`;

2. 可变类名

   ```php
   $CName = 'Human';
   $persion1 = new $CName();
   ```

3. `$对象名 = new self;` //

![](https://ws3.sinaimg.cn/large/006tKfTcly1fhkpx5iqltj315806kt92.jpg)

`self`指代类本身,运行代码只能在类内部方法中使用.

4. 通过对象创建类的新对象

![](https://ws2.sinaimg.cn/large/006tKfTcly1fhejl79yuij30c104paa4.jpg)



## 值的传递解析 

![](https://ws4.sinaimg.cn/large/006tNc79ly1fhg9fcvjg3j317o0n60uk.jpg)



## 静态属性 — static

- 一般属性,他的值是隶属于该类的具体某个对象.(也就是说: 每个对象的相同属性的值,有可能不一样) 
- 静态属性只隶属于类本身, 也可以看作是所有对象的`共有的数据`

![](https://ws4.sinaimg.cn/large/006tKfTcly1fhkkwqbk47j30zi09cdha.jpg)



## 静态方法

静态方法同样隶属于类. 

静态方法只能访问静态成员

类名::静态方法

![](https://ws2.sinaimg.cn/large/006tKfTcly1fhkojud10aj31c202caag.jpg)

## 构造方法 — __construct

创建对象的时候自动调用

1. 构造函构造方法不要设置成私有的
2. 必须是普通方法,不能是 static 方法
3. 名字固定 `__construct` 

```php
 public function __construct(){
} 
```

要执行父类的构造函数，需要在子类的构造函数中调用 parent::__construct() 



## 析构方法 — __destruct

对象的引用一旦失去，这个对象就成为垃圾，垃圾回收程序就会自动启动并回收对象占用的内存。就会自动去调用析构函数。

1. 析构函数不能有形参
2. 必须是public
3. 若一个类中没有定义析构函数,则销毁对象就会调用父类的析构函数(如果有)

```php
public function __destruct(){
}
```

执行父类的析构函数，必须在子类的析构函数体中显式调用 `parent::__destruct()` 。

```php
function __destruct(){
echo "hello".$this->name;
}
$people1=new people("张三");
$people1=null;
$people2=new people("李四");
$people3= new people("王五");
执行结果;
hello 张三
hello 王五
hello 李四
```

$people1 置为null，先失去引用，成为垃圾，第一个调用析构函数。

对象的引用存放在 栈内存中，后进先出的特点，所以最后创建的对象，最先被释放.

$people3 先释放，

$people2 后释放。



### 对象销毁的几种情况

1. 脚本运行结束,自动销毁
2. 明确的`unset()`一个对象,被销毁
3. 改变对象变量的值,被销毁



## 构造函数和析构函数在集成中的变现

- 子类没有定义`__construct`, 会自动跳用父类的构造方法.
- 子类定义了`__construct`,则不会自动调用父类的构造函数, 但可以手动调用`parent::__construct`
- 子类没有定义`__destruct`,会自动跳用父类的析构函数
- 子类定义了`__destruct`,则不会自动调用父类的析构函数, 但可以手动调用`parent::__destruct`

## 类常量

const 常量名 = 初值;

使用: 类名::常量名



## 继承 —  extends

php是单继承

### 重写

参数要保持一致. 但是构造函数可以不用保持一致.



## final class && final method

- 如果一个`class`被` final` 修饰，这个类`不能被继承`，
- 如果一个`method`被`final` 修饰，则这个方法`不能被子类重写`

```php
final class className
{
    final public function method()
    {
        
    }
}
```



## clone

```php
$p1=new people();
$p2= clone $p1; //复制对象. (生成新的对象)
```

该方法自动调用 __clone()魔术方法，



## 设计模式

什么叫设计模式

就是一些解决问题的常规做法, 是一种认为较好的经验总结

### 工厂模式

我们总是需要去实例化很多很多的类, 来的到对象.



### 单例模式

```php
class single
{

  // 禁止 new
    private function __construct(){}
    // 禁止 clone
    public function __clone(){}
  
    private static $_oInstance;
    public static function oInstance()
    {
        if (!self::$_oInstance) {
            self::$_oInstance = new self();
        }
        return self::$_oInstance;
    }
}
```



##  抽象类,抽象方法

abstract

### 抽象类

```
abstract class className(){}
```

只要一个类里面有一个方法是抽象方法，那么这个类就要定义为抽象类。

在抽象类中可以有不是抽象的成员方法和属性，但访问权限不能是private.

抽象类同样用 abstract 关键字来定义

- 抽象类不能产生实例对象

#### 抽象类有什么用?

抽象类可以用来规范一些类的共同特征, 但又不需要去对其进行实例化.

怎么规范: 继承它. 也就是说,抽象类的使命是专门做"`父类`"

### 抽象方法

1. 方法声明的时候没有 {} 括弧以及其中的内容，
2. 直接在声明时在方法名后加上分号结束

```php
abstract function function_name();
```

#### 抽象方法有什么用?

和抽象类一样,配合抽象类,实现对下级类的"行为规范"

```php
<?php
abstract class AbstractClass{
    // 定义抽象方法
    abstract protected function getValue();
    // 普通方法
    public function printOut(){
        print $this->getValue()."<br />";
    }
}
class ConcreteClass extends AbstractClass{
    protected function getValue(){
        return "抽象方法的实现";
    }
}

$class1 = new ConcreteClass;
$class1->printOut();
?>
```



## 接口技术 interface

接口可以实现多继承

接口中只有2种类型:

1. 常量(public 权限)
2. 抽象方法(public 权限)

```php
interface 接口名称{
        常量成员;
        抽象方法;  // 可以省略 abstract
}
```

接口使用关键字 interface 来定义，并使用关键字 implements 来实现接口中的方法，且必须完全实现。

```php
<?php
//定义接口
interface User{
    function getDiscount();
    function getUserType();
}
//VIP用户 接口实现
class VipUser implements User{
    // VIP 用户折扣系数
    private $discount = 0.8;
    function getDiscount() {
        return $this->discount;
    }
    function getUserType() {
        return "VIP用户";
    }
}
class Goods{
    var $price = 100;
    var $vc;
    //定义 User 接口类型参数，这时并不知道是什么用户
    function run(User $vc){
        $this->vc = $vc;
        $discount = $this->vc->getDiscount();
	$usertype = $this->vc->getUserType();
        echo $usertype."商品价格：".$this->price*$discount;
    }
}

$display = new Goods();
$display ->run(new VipUser);	//可以是更多其他用户类型
?>
```

该例子演示了一个 PHP 接口的简单应用。该例子中，User 接口实现用户的折扣，而在 VipUser 类里面实现了具体的折扣系数。最后商品类 Goods 根据 User 接口来实现不同的用户报价。





## php中的重载技术

通常在面向对象的语言中,同名方法的参数不同.这种现象称为 "重载".

参数不同包括: 个数不同, 类型不同,顺序不同.

![](https://ws3.sinaimg.cn/large/006tNc79ly1fhssnhm9q7j30oo090q31.jpg)

>  但是,在php中, 一个class中, 不可以定义多个同名的函数. — 这是语法错误.

### 属性重载: 

如果使用一个不存在的属性, 就会去自动调用类中预先定义好的某个方法, 来处理数据

有4种情况:

1. 取值: $object->属性;   ==属性不存在时自动调用==>  __get()
2. 赋值:$object->属性 = XXX; ==属性不存在时自动调用==>  __set()
3. 判断是否存在:isset($object->属性); ==属性不存在时自动调用==>  __isset()
4. unset($object->属性); ==属性不存在时自动调用==>  __unset()

> 类中要预先定义好上面的方法. 如果没有,显然是报错的

方法重载:

如果使用一个不存在的方法, 就会去自动调用类中预先定义好的某个方法, 来处理该行为.

2种情况:

1. $object->方法(); === 调用`普通方法`不存在自动调用==> `__call($funcName,$argument)`
2. $object::方法(); === 调用`静态方法`不存在自动调用==> `__calstaticl($funcName,$argument)`

![](https://ws1.sinaimg.cn/large/006tNc79ly1fhstlxeba7j30vq0r4tam.jpg)



## 类的自动加载

### __autoload() 

__autoload() 方法接收的一个参数，就是欲加载的类的类名，

>  所以这时候需要类名与文件名对应

Pserson.php

```
<?php
<?php
class Person {
    private $name;
    private $age;

    function __construct($name, $age) {
        $this->name = $name;
        $this->age = $age;
    }

    function say() {
	echo "我的名字叫：".$this->name."<br />";
	echo " 我的年龄是：".$this->age;
    }
}
?>
```

test.php

```
<?php
function __autoload($class_name) 
{
    require_once $class_name.'.php';
}

//当前页面 Pserson 类不存在则自动调用 __autoload() 方法，传入参数 Person
$p1 = new Person("张三","20");
$p1 -> say();
?>

```

运行 test.php ，输出：

```
我的名字叫：张三
我的年龄是：20
```



### spl_autoload_register

"注册"一个或者多个函数, 用来代替`__autoload` 函数的作用

![](https://ws4.sinaimg.cn/large/006tKfTcly1fhtupuu7bnj30to0k8761.jpg)



### spl_autoload_register() 调用静态方法 

```php

class test {
 public static function loadprint( $class ) {
  $file = $class . '.class.php';  
  if (is_file($file)) {  
   require_once($file);  
  } 
 }
} 
 
spl_autoload_register(  array('test','loadprint')  );
//另一种写法：spl_autoload_register(  "test::loadprint"  ); 
 
$obj = new PRINTIT();
$obj->doPrint();
```



## 对象的复制

### 浅克隆   clone

浅拷贝, 只能克隆对象中的`非对象非资源`数据

![](https://ws2.sinaimg.cn/large/006tKfTcly1fhtux3r3tgj30rk0aa3z8.jpg)

![](https://ws3.sinaimg.cn/large/006tKfTcly1fhtv0gwz9wj31f00n60ux.jpg)

![](https://ws4.sinaimg.cn/large/006tKfTcly1fhtv1sujjyj31fg0li40n.jpg)

可见并没有实现完全复制.

### 深克隆 __clone

当对象被克隆时，被调用

该方法中自动包含$this 和 $that

$this---副本对象的引用

$that---原本对象的引用

![](https://ws2.sinaimg.cn/large/006tKfTcly1fhtv9wf3dlj31ek0na0us.jpg)



## 对象遍历

对象可以使用 `foreach`进行遍历

1. 只能遍历属性
2. 受访问范围的限制

类外遍历:

![](https://ws4.sinaimg.cn/large/006tKfTcly1fhtvfd0o1zj30ts0b2wfb.jpg)

类内遍历

![](https://ws1.sinaimg.cn/large/006tKfTcly1fhtvhdc34zj310a0fkab5.jpg)



## php内置类  stdClass



![](https://ws4.sinaimg.cn/large/006tKfTcly1fhtvsr2qxhj30xc0ck755.jpg)



## 与类有关的魔术方法

`__class__`

`__METHOD__`

```php
class A
{
    function hello()
    {
        print_r(__CLASS__); // A
        print_r(__METHOD__); // A::hello
    }
}

$obj = new A();
$obj->hello();
```



## 其他的一些方法和运算符

![](https://ws4.sinaimg.cn/large/006tKfTcly1fhtysvr4x7j317m0d8tab.jpg)



### instanceof

```php
class A{}
class B extends A{}
$obj = new B;
var_dump($obj instanceof A); // true
```



## 对象向下传递

![](https://ws2.sinaimg.cn/large/006tKfTcly1fhtz3lx37yj311w0i4gn9.jpg)



## static后期静态绑定特征



```php
class A
{
    static $p1 = 1;
    static function show()
    {
        // self 永远代表其所在代码的类, 所以永远 1
        echo self::$p1;
    }
    static function show2()
    {
        //static 代表调用本方法的类
        echo static::$p1;
    }
}
class B extends A
{
    static $p1 = 10;
}
A::show(); // 1
B::show(); // 1 self 永远代表其所在代码的类, 所以是 1
A::show2();
B::show2(); // 10  static 代表调用本方法的类
```









# 魔术方法

## __tostring()

 __toString方法在将一个对象转化成字符串时自动调用

## __invoke()

对象当做一个函数的时候, 会自动调用.

```php
$v1 = $obj(1,2); $obj是一个对象
```

![](https://ws3.sinaimg.cn/large/006tKfTcly1fhtyhoxpelj30vm0ei0te.jpg)





