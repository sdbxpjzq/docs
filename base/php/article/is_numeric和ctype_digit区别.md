[TOC]

# is_numeric和ctype_digit 区别

`is_numeric`：检测是否为数字字符串，可为负数和小数 

`ctype_digit`：检测字符串中的字符是否都是数字，负数和小数会检测不通过.参数一定要是字符串，如果不是字符串，则会返回0/FASLE 

```php
var_dump(is_numeric('12.2')); //true
var_dump(is_numeric(-12)); //true
var_dump(ctype_digit(12.2)); // false
var_dump(ctype_digit('12')); //true
var_dump(ctype_digit(-12)); // false
```

