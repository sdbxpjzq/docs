

# preg_replace

`mixed preg_replace ( mixed $pattern , mixed $replacement , mixed $subject [, int $limit = -1 [, int &$count ]] )`

- $pattern: 要搜索的模式，可以使字符串或一个字符串数组。
- $replacement: 用于替换的字符串或字符串数组。
- $subject: 要搜索替换的目标字符串或字符串数组。
- $limit: 可选，对于每个模式用于每个 subject 字符串的最大可替换次数。 默认是-1（无限制）。
- $count: 可选，为替换执行的次数。

> 默认就是全局匹配, 不需要 g 参数



# 匹配 \

```php
preg_replace('/\\\/g','/','DL\namesp\aceClass');
```

