[TOC]



# History — url历史纪录

## History 对象属性

| 属性                                       | 描述                  |
| ---------------------------------------- | ------------------- |
| [length](http://www.w3school.com.cn/jsref/prop_his_length.asp) | 返回浏览器历史列表中的 URL 数量。 |

## History 对象方法

| 方法                                       | 描述                      |
| ---------------------------------------- | ----------------------- |
| [back()](http://www.w3school.com.cn/jsref/met_his_back.asp) | 加载 history 列表中的前一个 URL。 |
| [forward()](http://www.w3school.com.cn/jsref/met_his_forward.asp) | 加载 history 列表中的下一个 URL。 |
| [go()](http://www.w3school.com.cn/jsref/met_his_go.asp) | 加载 history 列表中的某个具体页面。  |

> history.go(0); //相当于 刷新当前页面



## HTML5新增API

### history.pushState(state,title,url)

- **state**：一个与指定网址相关的状态对象，popstate事件触发时，该对象会传入回调函数。如果不需要这个对象，此处可以填null。
- **title**：新页面的标题，但是所有浏览器目前都忽略这个值，因此这里可以填null。
- **url**：新的网址，必须与当前页面处在`同一个域`。浏览器的地址栏将显示这个网址。

> **pushState方法不会触发页面刷新.**

如果 pushState 的url参数，设置了一个当前网页的`#`号值（即`hash`），并不会触发`hashchange`事件。如果设置了一个非同域的网址，则会报错。

```js
// 报错history.pushState(null, null, 'https://twitter.com/hello');

```



###  history.replaceState(state,title,url)

```js
history.replaceState(null, "页面标题", "xxx.html");
```



栗子:

[demo](http://www.zhangxinxu.com/study/201306/ajax-page-html5-history-api.html?area=pudong)
