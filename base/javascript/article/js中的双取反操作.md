[TOC]



# js中的双取反操作-"!!"

首先看看判断`IE`浏览器的`Code`

```js
function ie(){
    //ie版本
    var agent = navigator.userAgent.toLowerCase();
    return (!!window.ActiveXObject || "ActiveXObject" in window) ? (
        (agent.match(/msie\s(\d+)/) || [])[1] || '11' //由于ie11并没有msie的标识
    ) : false;
};
```
竟然用到了"!!", 这个东东.
这里出现了两个感叹号"!!"，其实它不是一个操作符，而是我们熟悉的取反操作“!”执行了两次.

**why**
为什么要这么写呢?
其实就是将目标对象转变成对应的boolean类型而已.
在非`IE`浏览器中,执行

* `window.ActiveXObject`, 返回`undefined`
* `!window.ActiveXObject`, 返回`true`
* `!!window.ActiveXObject`, 返回`false`
* `Boolean(window.ActiveXObject)`, 返回`false`

也就是说, 执行`Boolean(xx)`和`!!xx`是一样的.只是编程技巧而已~