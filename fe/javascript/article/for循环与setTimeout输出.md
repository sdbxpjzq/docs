[TOC]

每秒输出

```js
for (var i = 0; i < 5; i++) {
    setTimeout((function (a) {
            return function () {
                console.log(a);
            }
        })(i), (function (b) {
            return b * 1000
        })(i)
    );
}
```