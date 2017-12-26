[TOC]

# ios和safari下new Date()格式问题

1. 在`chrome`浏览器下,我们通常会使用:

```js
new Date('2017-03-07');
new Date('2017-03-13 00:00:00')
```

![](http://img.zongqilive.cn/1488853743879.jpg)

2. `safari`浏览器下

![](http://img.zongqilive.cn/1488853840321.jpg)

可见在`Safari`下会报错.

> **解决办法**: 将`-` 替换成`/`
>
> ```
> sFormalDay.replace(/-/g, "/");
> ```