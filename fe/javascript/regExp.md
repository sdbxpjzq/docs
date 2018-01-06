[TOC]

# 创建正则

`var patt=new RegExp(pattern,modifiers);`

或者更简单的方式:

`var patt=/pattern/modifiers;`

- pattern（模式） 描述了表达式的模式
- modifiers(修饰符) 用于指定全局匹配、区分大小写的匹配和多行匹配



# 修饰符

修饰符用于执行区分大小写和全局匹配:

| 修饰符                                      | 描述                           |
| ---------------------------------------- | ---------------------------- |
| [i](http://www.runoob.com/js/jsref-regexp-i.html) | 执行对大小写不敏感的匹配。                |
| [g](http://www.runoob.com/js/jsref-regexp-g.html) | 执行全局匹配（查找所有匹配而非在找到第一个匹配后停止）。 |
| m                                        | 执行多行匹配。                      |



# RegExp 对象方法



| 方法                                       | 描述                          | FF   | IE   |
| ---------------------------------------- | --------------------------- | ---- | ---- |
| [compile](http://www.runoob.com/jsref/jsref-regexp-compile.html) | 编译正则表达式。                    | 1    | 4    |
| [exec](http://www.runoob.com/jsref/jsref-exec-regexp.html) | 检索字符串中指定的值。返回找到的值，并确定其位置。   | 1    | 4    |
| [test](http://www.runoob.com/jsref/jsref-test-regexp.html) | 检索字符串中指定的值。返回 true 或 false。 | 1    | 4    |



# 支持正则表达式的 String 对象的方法



| 方法                                       | 描述               | FF   | IE   |
| ---------------------------------------- | ---------------- | ---- | ---- |
| [search](http://www.runoob.com/js/jsref-search.html) | 检索与正则表达式相匹配的值。   | 1    | 4    |
| [match](http://www.runoob.com/js/jsref-match.html) | 找到一个或多个正则表达式的匹配。 | 1    | 4    |
| [replace](http://www.runoob.com/js/jsref-replace.html) | 替换与正则表达式匹配的子串。   | 1    | 4    |
| [split](http://www.runoob.com/js/jsref-split.html) | 把字符串分割为字符串数组。    | 1    | 4    |





http://www.runoob.com/jsref/jsref-obj-regexp.html



