# array_flip删除数组重复元素

array_flip()用于将一个数组的每个元素的键和值交换

array_flip(array_flip($arr))　可以删除数组中重复的元素了。首先，$arr里的值会变成键名，因为值是有重复的，变成键名之后这些重复的值便成了重复的键名，ＰＨＰ引擎将重复的键名删除，只保留最后一个。如： 

```php
$arr1 = array (”age” => 30, “name” => “快乐园”, “age” => 20); 
$arr1 = array_flip($arr1); //$arr1 变成了 array(”快乐园” => “name”, 20 => “age”); 
//再把 $arr1 的键名与值还复：
$arr1 = array_flip($arr1); 
```

上面的代码写得简洁一些就是： 

```php
$arr1 = array_flip(array_flip($arr1));
```



