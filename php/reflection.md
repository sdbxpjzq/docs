[TOC]

# 反射基础



```php
class Person
{
    public $name = 'chenqionghe';
    public $age = 18;
    public function hello()
    {
        print_r('hello');
    }

    public function test()
    {
        print_r('test');
    }
}
```



```php
$reflect = new ReflectionClass('Person'); //建立 Person这个类的反射类
$instance  = $reflect->newInstanceArgs();//相当于实例化 Person 类
$props = $reflect->getProperties(); //获取属性的名字
$methods = $reflect->getMethods(); //获取对象方法列表

$helloMethod = $reflect->getmethod('hello'); //获取指定列表
$helloMethod->invoke($instance); // 执行hello

// 另外一种执行方法
$instance->test(); // 执行test

// 获取注释 getDocComment
foreach($properties as $property) {  
    if($property->isProtected()) {  
        $docblock = $property->getDocComment();  
        preg_match('/ type\=([a-z_]*) /', $property->getDocComment(), $matches);  
        echo $matches[1]."\n";  
    }  
}  
```



默认情况下，`ReflectionClass`会获取到所有的属性，`private` 和 `protected`的也可以.

如果只想获取到private属性，就要额外传个参数：
`$private_properties = $class->getProperties(ReflectionProperty::IS_PRIVATE);`
可用参数列表：
​               `ReflectionProperty::IS_STATIC`
​               `ReflectionProperty::IS_PUBLIC`
​               `ReflectionProperty::IS_PROTECTED`
​               `ReflectionProperty::IS_PRIVATE`
​     如果要同时获取`public` 和`private` 属性，就这样写：`ReflectionProperty::IS_PUBLIC | ReflectionProperty::IS_PROTECTED`。
   通过`$property->getName()`可以得到属性名。



