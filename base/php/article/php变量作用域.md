[TOC]

# 变量作用域

和`javascript`大不同 

```php
$v = 100; // 此变量 除了函数内部  , 全局可见
function test()
{
    $a = 200; // 函数内局部变量, 函数内可见
  // $v 先找函数内部的, 没找到 undefined, 不可访问
  print_r($v); // 函数内部,不可访问.
  // 要想使用 global
    global $v;
    print_r($v); // 100
  // 或者使用 超全局数组 $GLOBALS[]
  print_r($GLOBALS['v']);  // 100
}
test();

print_r($v); // 100
print_r($a); // 函数外部 不可访问
```



## $GLOBALS[] 和 global 有什么区别呢

`$GLOBALS['v']` 是外部的全局变量本身.

`global $v` 是外部`$v`的同名引用或者指针.

`global $v` 和 `&$GLOBALS['v']` 是等价的.

```php
$v = 100; // 此变量 除了函数内部  , 全局可见
function test()
{
   unset($GLOBALS['v']);
}
test();
echo @$v; // 空
```

```php
$v = 100; // 此变量 除了函数内部  , 全局可见
function test()
{
    global $v;
    unset($v);
}
test();
echo @$v; // 100
```

