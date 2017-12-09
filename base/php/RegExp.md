

[TOC]

# 基本方法

- [preg_filter](http://php.net/manual/zh/function.preg-filter.php) — 执行一个正则表达式搜索和替换
- [preg_grep](http://php.net/manual/zh/function.preg-grep.php) — 返回匹配模式的数组条目
- [preg_last_error](http://php.net/manual/zh/function.preg-last-error.php) — 返回最后一个PCRE正则执行产生的错误代码
- [preg_match_all](http://php.net/manual/zh/function.preg-match-all.php) — 执行一个全局正则表达式匹配
- [preg_match](http://php.net/manual/zh/function.preg-match.php) — 执行匹配正则表达式
- [preg_quote](http://php.net/manual/zh/function.preg-quote.php) — 转义正则表达式字符
- [preg_replace_callback_array](http://php.net/manual/zh/function.preg-replace-callback-array.php) — Perform a regular expression search and replace using callbacks
- [preg_replace_callback](http://php.net/manual/zh/function.preg-replace-callback.php) — 执行一个正则表达式搜索并且使用一个回调进行替换
- [preg_replace](http://php.net/manual/zh/function.preg-replace.php) — 执行一个正则表达式的搜索和替换
- [preg_split](http://php.net/manual/zh/function.preg-split.php) — 通过一个正则表达式分隔字符串

# preg_replace

`mixed preg_replace ( mixed $pattern , mixed $replacement , mixed $subject [, int $limit = -1 [, int &$count ]] )`

- $pattern: 要搜索的模式，可以使字符串或一个字符串数组。
- $replacement: 用于替换的字符串或字符串数组。
- $subject: 要搜索替换的目标字符串或字符串数组。
- $limit: 可选，对于每个模式用于每个 subject 字符串的最大可替换次数。 默认是-1（无限制）。
- $count: 可选，为替换执行的次数。

> 默认就是全局匹配, 不需要 g 参数



# 匹配 

```php
preg_replace('/\\\/g','/','DL\namesp\aceClass');
```

