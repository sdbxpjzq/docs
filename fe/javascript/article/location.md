[TOC]

# location — url信息

## 属性

| 属性                                       | 描述                                       |
| ---------------------------------------- | ---------------------------------------- |
| [hash](http://www.w3school.com.cn/jsref/prop_loc_hash.asp) | 设置或返回从井号 (#) 开始的 URL（锚）。                 |
| [host](http://www.w3school.com.cn/jsref/prop_loc_host.asp) | 设置或返回主机名和当前 URL 的端口号。                    |
| [hostname](http://www.w3school.com.cn/jsref/prop_loc_hostname.asp) | 设置或返回当前 URL 的主机名。                        |
| [href](http://www.w3school.com.cn/jsref/prop_loc_href.asp) | 设置或返回完整的 URL。 2> 也可以跳转页面使用 (推荐 在客户端就可以执行) |
| [pathname](http://www.w3school.com.cn/jsref/prop_loc_pathname.asp) | 设置或返回当前 URL 的路径部分。                       |
| [port](http://www.w3school.com.cn/jsref/prop_loc_port.asp) | 设置或返回当前 URL 的端口号。                        |
| [protocol](http://www.w3school.com.cn/jsref/prop_loc_protocol.asp) | 设置或返回当前 URL 的协议。                         |
| [search](http://www.w3school.com.cn/jsref/prop_loc_search.asp) | 设置或返回从问号 (?) 开始的 URL（查询部分）。              |



## 方法

| 属性                                       | 描述                                       |
| ---------------------------------------- | ---------------------------------------- |
| [assign()](http://www.w3school.com.cn/jsref/met_loc_assign.asp) | 加载新的文档。                                  |
| [reload()](http://www.w3school.com.cn/jsref/met_loc_reload.asp)window.location.reload() | 重新加载当前文档。说明如果该方法没有规定参数，或者参数是 false，它就会用 HTTP 头 If-Modified-Since 来检测服务器上的文档是否已改变。如果文档已改变，reload() 会再次下载该文档。如果文档未改变，则该方法将从缓存中装载文档。这与用户单击浏览器的刷新按钮的效果是完全一样的。如果把该方法的参数设置为 true，那么无论文档的最后修改日期是什么，它都会绕过缓存，从服务器上重新下载该文档。 |
| [replace()](http://www.w3school.com.cn/jsref/met_loc_replace.asp) | 用新的文档替换当前文档。                             |



url: `http://localhost:8080/#/honey_center`

1. hash:"#/honey_center"
2. host:"localhost:8080"
3. hostname:"localhost"
4. href:"http://localhost:8080/#/honey_center"
5. origin:"http://localhost:8080"
6. pathname:"/"
7. port:"8080"
8. protocol:"http:"
9. reload:ƒ reload()
10. replace:ƒ ()
11. search:""




## onhashchange() 事件

当url的hash值(#后面的值)发生改变的时候触发. .

hashchange事件触发时，事件对象会有hash改变前的URL（oldURL）和hash改变后的URL（newURL）两个属性

```js
if ('onhashchange' in window) {
        window.onhashchange = function (e) {
            alert('hash变了:'+window.location.hash);
            alert(e.oldURL);
            alert(e.newURL);
        }
    }
```

### 实际应用

点击小图时在当前页面上展示大图.

![](https://ws3.sinaimg.cn/large/006tKfTcly1fj6giv8s91j317i10owj9.jpg)

当进入大图展示状态时，如何返回？这是手机的页面，对于用惯APP的用户来说，他很可能会点击左下角的返回键。然而这是个浏览器，返回就意味着**回到上一页**而不是退出大图展示状态.

当URL的hash改变时，虽然页面不会重新加载，但仍然会被记录到浏览器的**历史记录**中。也就是说，如果依次访问a.html、b.html、b.html#abc，然后点击后退，此时会返回b.html而不是a.html。而且，由于hash改变了，所以会触发hashchange事件。这样一来，只要在进入大图展示状态时加上一个特定的hash，点击返回键触发hashchange时退出此状态即可。代码实现也很简单：

```js
// 假设大图展示状态的hash为imgSlider
window.addEventListener('hashchange', function(e) {
    var re = /#imgSlider$/;
    if ( re.test(e.oldURL) && !re.test(e.newURL) ) {
        // 假设imgSlider为大图展示组件对象
        imgSlider.hide();
    }
}, false);
```