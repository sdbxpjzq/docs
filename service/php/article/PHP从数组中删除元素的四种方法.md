# PHP从数组中删除元素的四种方法

## unset

**删除一个元素，且保持原有索引不变**

```php
 $array = array(0 => "a", 1 => "b", 2 => "c");
  unset($array[1]);
```

输出:

```php
Array (
    [0] => a
    [2] => c
)
```



使用 `unset` 并未改变数组的原有索引。如果打算重排索引（让索引从0开始，并且连续），可以使用 `array_values` 函数：

```php
$array = array_values($array);
/*
输出
array(2) {
 [0]=>
 string(1) "a"
 [1]=>
 string(1) "c"
}
*/
```



## array_splice

**删除一个元素，不保持索引**

```php
 $array = array(0 => "a", 1 => "b", 2 => "c");
  array_splice($array, 1, 1);
            //↑ 你想删除的元素的Offset
```

输出:

```php
Array (
    [0] => a
    [1] => c
)
```



## array_diff

**按值删除多个元素，保持索引**

```php
$array = array(0 => "a", 1 => "b", 2 => "c");
  $array = array_diff($array, ["a", "c"]);
               //└────────┘→ 你想删除的数组元素值values
```

输出

```php
Array (
    [1] => b
)
```

与 unset 类似，array_diff 也将保持索引。

## array_diff_key

**按键删除多个元素，保持索引**

```php
$array = array(0 => "a", 1 => "b", 2 => "c");
  $array = array_diff_key($array, [0 => "xy", "2" => "xy"]);
                  //↑      ↑ 你想删除的数组键keys
```

输出

```php
Array (
    [1] => b
)
```

与 unset 类似，array_diff_key 也将保持索引。































