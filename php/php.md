[TOC]





# include 和 require

## `include`

当引入的文件不存在时, 代码会继续执行



## `require`

当引入的文件不存在时, 代码会停止运行 , 并抛出一个致命错误.









# 类型转换

## 强制类型转换

允许的强制转换有：

1.(int), (integer) - 转换为整形 integer  

2.(bool), (boolean) - 转换为布尔类型 boolean  

3.(float), (double), (real) - 转换为浮点型 float  

4.(string) - 转换为字符串 string  

5.(array) - 转换为数组 array  

6.(object) - 转换为对象 object  

7.(unset) - 转换为 NULL  (PHP 5) 

```php
<?php
$foo = 10;        // $foo 为整型
$bar = (boolean) $foo;    // $bar 为布尔型
?>
```



## settype()

```php
<?php
$foo  =  "5bar" ;  // string
 $bar  =  true ;    // boolean
 
 settype ( $foo ,  "integer" );  // $foo 现在是 5   (integer)
 settype ( $bar ,  "string" );   // $bar 现在是 "1" (string)
?> 
```

`type` 的可能值为：

- “boolean” （或为“bool”，从 PHP 4.2.0 起）
- “integer” （或为“int”，从 PHP 4.2.0 起）
- “float” （只在 PHP 4.2.0 之后可以使用，对于旧版本中使用的“double”现已停用）
- "string"
- "array"
- "object"
- “null” （从 PHP 4.2.0 起）

## intval ()和 floatval()和strval()

```php
$a="12.56hello23";  // string
$b=12.56;          //float
var_dump(intval($a)); // int 12
var_dump(intval($b)); // int 12
     $c=10;           //int
     var_dump(floatval($c)); // float 10
     var_dump(strval($c));   // string '10'
```

















# 超全局变量

## $_ENV

如果打印输出 `$_ENV` 为空，可以检查一下 php.ini 的配置：

`variables_order = "EGPCS"`

上述配置表示 PHP 接受的外部变量来源及顺序，`EGPCS` 是 `Environment`、`Get`、`Post`、`Cookies` 和 `Server` 的缩写。如果 `variables_order` 的配置中缺少` E` ，则 PHP 无法接受环境变量，那么 `$_ENV `也就为空了。

# 常量

`PHP_INT_SIZE`：表示整数integer值的字长

`PHP_INT_MAX`：表示整数integer值的最大值

> 注意

32位中PHP_INT_SIZE：4，

PHP_INT_MAX：2147483647

64位中

PHP_INT_SIZE：8，

PHP_INT_MAX：9223372036854775807



## 定义常量

### `const` 和 `define`区别

1. `const`用于类成员变量的定义，一经定义，不可修改。

   `define`不可以用于类成员变量的定义，可用于全局常量.

2. Const可在类中使用，define不能

3. Const不能再条件语句中定义常量. define() 可以.

4. const只能接受静态的标量，define可以采用表达式作为名称

```php
const  FOO = 'BAR';
for ($i = 0; $i < 32; ++$i) {
define('BIT_' . $i, 1 << $i);
}

const BIT_5 = 1 << 5;    // 无效的invalid (php5.6+ 支持)
define('BIT_5', 1 << 5); // 有效的valid
```

5. const定义的常量时大小写敏感，而define可以通过第三个参数（为true表示大小写不敏感）来指定大小写是否敏感。

```php
define('FOO', 'BAR', true);
echo FOO; // BAR
echo foo; // BAR
```



# header() 跳转

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
3. `header('Refresh: 3; url=www.baidu.com')`— 3s后跳转

跳转之后直接使用`exit()`或者 `die()`退出.



# 变量作用域

和`javascript`大不同 

```php
$v = 100; // 此变量 除了函数内部  , 全局可见
function test()
{
    $a = 200; // 函数内局部变量, 函数内可见
  // $v 先找函数内部的, 没找到 undefined, 不可访问
    print_r($v); // 函数内部 不可访问
}
test();

print_r($v); // 100
print_r($a); // 函数外部 不可访问
```





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

```
$arr  = array('hello','world');
$str = serialize($arr);
$arr3 = unserialize($str);

$arr4  = array('hello','world');
$str2 = json_encode($arr);
$arr5 = json_decode($str2,true);

```



# 命名空间

![](https://ws1.sinaimg.cn/large/006tKfTcly1fhwekz0osjj316o0ou0v4.jpg)



一个php文件中可以存在多个命名空间

受命名空间影响的数据:

类

函数

接口

const定义的常量





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

## self与static区别

在继承的情况下会有区别:

`self`情况:

```php
 class Boo {  
        
      protected static $str = "This is class Boo";  
        
      public static function get_info(){  
            
          echo get_called_class()."<br>";  
          echo self::$str;   // 使用 self
      }   
        
        
  }  
  class Foo extends Boo{  
        
      protected static $str = "This is class Foo";  
        
  }  
    
    
   Foo::get_info();   // Foo  This is class Boo
```

static情况: 

```php
 class Boo {  
        
      protected static $str = "This is class Boo";  
      public static function get_info(){  
            
          echo get_called_class()."<br>";  
          echo static::$str;   // 使用 static
      }   
        
  }  
  class Foo extends Boo{  
        
      protected static $str = "This is class Foo";  
        
  }  
    
    
   Foo::get_info();  // FOO This is class Foo

```

可以发现,结果是不一样的.

self调用的就是本身代码片段这个类，而static调用的是从堆内存中提取出来，访问的是当前实例化的那个类，那么 static 代表的就是那个类.

其实static就是调用的当前调用的类



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













# 网址收藏

https://laravel-china.github.io/php-the-right-way/





