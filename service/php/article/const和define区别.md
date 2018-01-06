# `const` 和 `define`区别

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

1. const定义的常量时大小写敏感，而define可以通过第三个参数（为true表示大小写不敏感）来指定大小写是否敏感。

```php
define('FOO', 'BAR', true);
echo FOO; // BAR
echo foo; // BAR
```

