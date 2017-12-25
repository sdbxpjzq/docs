[TOC]

# 判断一个dom元素是否已经绑定了某个事件

jquery:

```js
$._data($('.sider_hide')[0], 'events');
```

原生js:

```js
window.getEventListeners($('.sider_hide')[0]);
```





