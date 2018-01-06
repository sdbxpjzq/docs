[TOC]

# scrollIntoView系列

移动web页面，input获取焦点弹出系统虚拟键盘时，偶尔会出现挡住input的情况，尽管概率不大，但是十分影响用户体验。

## scrollIntoView

```js
element.scrollIntoView(alignToTop);
```

*alignToTop*

`Boolean`

- 如果为`true`，元素的顶端将和其所在滚动区的可视区域的顶端对齐。
- 如果为`false，`元素的底端将和其所在滚动区的可视区域的底端对齐。



## scrollIntoViewIfNeeded

```js
Element.scrollIntoViewIfNeeded(opt_center)
```

*opt_center*

`Boolean` 默认`true`

- 如果为true，则元素将在其所在滚动区的可视区域中居中对其。
- 如果为false，则元素将与其所在滚动区的可视区域最近的边缘对齐。 根据可见区域最靠近元素的哪个边缘，元素的顶部将与可见区域的顶部边缘对准，或者元素的底部边缘将与可见区域的底部边缘对准。



推荐使用 `scrollIntoViewIfNeeded`

代码实例

```js
 $('input').on('click', function () {
            var target = this;
            // 使用定时器是为了让输入框上滑时更加自然
            setTimeout(function(){
               // target.scrollIntoView(true);
               target.scrollIntoViewIfNeeded(true); // 推荐使用
            },100);
        });
```

参考:

https://github.com/justjavac/the-front-end-knowledge-you-may-dont-know/issues/3