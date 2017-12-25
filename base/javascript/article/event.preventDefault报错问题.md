[TOC]

# event.preventDefault()报错

```js
document.addEventListener('touchstart', function(event) {
    event.preventDefault();
}, false);
```

报错信息:

> Unable to preventDefault inside passive event listener due to target being treated as passive. See [https://www.chromestatus.com/...](https://www.chromestatus.com/features/5093566007214080)

原因:

> 是新版chrome，给这个preventDefault返回了naive，不再是清除浏览器默认行为了



优化代码:

```js
document.addEventListener('touchstart', function(event) {
    // 判断默认行为是否可以被禁用
    if (event.cancelable) {
        // 判断默认行为是否已经被禁用
        if (!event.defaultPrevented) {
            event.preventDefault();
        }
    }
}, false);
```

