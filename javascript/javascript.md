[TOC]



# ajax





# Fetch

https://juejin.im/entry/599cfac56fb9a0249b4841b8?utm_source=gold_browser_extension







# for循环 与 setTimeout

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





# 跨域

## 什么是跨域

javascript出于安全方面的考虑,不允许跨域调用其他页面的对象.

简单的理解就是:  因为javascript同源策略的限制,a.com域名下的js无法操作b.com或者c.a.com域名下的对象.

![](https://ws3.sinaimg.cn/large/006tNc79ly1fhj6m9h6b9j30zs0kcdgz.jpg)



## 解决跨域的办法

### 服务端设置

背后的基本思想是：

​        使用自定义的HTTP头部让浏览器与服务器进行沟通，从而决定请求或响应是应该成功还是 应该失败。

在PHP页面下 写上:

```php
header("Access-Control-Allow-Origin:*"); 
header("Access-Control-Allow-Methods","GET,POST");
```

但是IE并不支持

IE8中引入了XDR(XDomainRequest)类型.

  ![](https://ws1.sinaimg.cn/large/006tKfTcly1fia0tqpwi6j30jq050dfw.jpg)

![](https://ws4.sinaimg.cn/large/006tKfTcly1fia0twuazaj30l907qwew.jpg)

![](https://ws2.sinaimg.cn/large/006tKfTcly1fia0ue5v27j30vh0bpdh0.jpg)

检测浏览器是否支持 cors

检测XHR 是否支持 CORS，就是检测withCreadentials属性。再结合 XDomainRequest对象是否存在.

![](https://ws1.sinaimg.cn/large/006tKfTcly1fia0v0pskrj30k005udg3.jpg)

![](https://ws4.sinaimg.cn/large/006tKfTcly1fia0v61jf8j30rx08u0sy.jpg)

```js
function createCORS(fn,url){
			var xhr = new XMLHttpRequest();
			if('withCredentials' in xhr){
				xhr.open(fn,url,true);
			}else if(typeof XDomainRequest() != 'undefined'){
				cxhr = new XDomainRequest();
				cxhr.open(fn,url);
			}
		}
```



### 使用`jsonp`

JSONP的最基本的原理是：动态添加一个<script>标签，而script标签的src属性是没有跨域的限制的。这样说来，这种跨域方式其实与ajax XmlHttpRequest协议无关了.

只支持 GET 请求,不支持 POST 请求

![](https://ws1.sinaimg.cn/large/006tNc79ly1fhj6qi6e2ij30xi0gk3yw.jpg)

```js
function getJSON(url,fn){
				// 创建 script标签
				var oScript = document.createElement('script');
				oScript.src = url;
				document.body.appendChild(oScript);
				var reg = /callback=([^&]+)/;
				var fnName = url.match(reg)[1];
				// 挂载window
				window[fnName] = fn;   // 函数在服务器端 执行
				oScript.onload = function(){
					document.body.removeChild(oScript);
					delete(window[fnName]);
				}
			}

```

```php
echo $_GET['callback'].'({"name":"hello"})';
```

![](https://ws1.sinaimg.cn/large/006tKfTcly1fia14ogv14j30j30cndgd.jpg)



## 纯前端实现

https://juejin.im/entry/599697c06fb9a0249471a7d6?utm_source=gold_browser_extension







# 原生js创建和触发自定义事件

使用 Event构造函数创建,dispatchEvent触发

```js
// Listen for the event.
elem.addEventListener('build', function (e) { ... }, false);
var event = new Event('build');
// Dispatch the event.
elem.dispatchEvent(event);
```



https://developer.mozilla.org/zh-CN/docs/Web/Guide/Events/Creating_and_triggering_events



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



# Beacon API

Beacon API是W3C仍在草案阶段的一项新API，这个API主要用于发送不需要服务器回应的HTTP请求或强制浏览器发送一个请求。

```js
window.addEventListener('unload', logData, false);

function logData() {
    var client = new XMLHttpRequest();
    client you can find out more.open("POST", "/log", true);
    client.setRequestHeader("Content-Type", "text/plain;charset=UTF-8");
    client.send(analyticsData);
}
```

这段代码是在做什么呢？如果做过页面统计、埋点，应该能看出来，这段代码实际上是在用户切换页面时试图向服务器发送一些统计数据。

理想情况下没什么问题，然而由于这个请求是在unload事件的handler当中，浏览器可能会忽略这个请求。因此出现了下面这样的代码：
```js
window.addEventListener('unload', logData, false);

function logData() {
    var client = new XMLHttpRequest();
    client.open("POST", "/log", false); // 注意这里
    client.setRequestHeader("Content-Type", "text/plain;charset=UTF-8");
    client.send(analyticsData);
}
```
XMLHttpRequest.open的第三个参数表示这个HTTP请求是否异步发送。这段代码将强制浏览器进行一个同步的HTTP请求来确保浏览器不会无视这个请求。

现在数据肯定能发出去了，然而网速无情，一个同步的请求意味着浏览器必须等待整个请求发送完成直至收到整条HTTP回应。这对于页面切换来说是致命的延迟。

说到这大家应该明白了，Beacon API 的作用就是为了能让浏览器在类似unload这样的情况下成功发送请求，同时不影响下一个页面的载入。如何使用呢，W3C的例子如下：
```js
window.addEventListener('unload', logData, false);

function logData() {
    navigator.sendBeacon("/log", analyticsData);
}
```
好吧，太简单了，没啥可说的了。哦不，简单确实，但是太简单了，它隐藏了点细节：
*   `sendBeacon`只能用`POST`请求来发送信息；
*   `sendBeacon`的第二个参数是可选的，如果提供的话，参数类型可以是ArrayBufferView、Blob、DOMString或者FormData；
*   `sendBeacon`所收到的HTTP回应会被无视。实际上即使不无视你也不见得能拿到回应，因为整个请求发送或者收到回应的时候，页面可能早就不存在了；
*   `sendBeacon`是有返回值的，类型为`bool`：`true`表示浏览器已经将这个请求纳入队列稍后处理，`false`表示浏览器无法完成这个请求，其原因不详，不过通常来说就是浏览器的HTTP请求队列已满；




# 页面埋点

http://www.barretlee.com/blog/2016/02/20/navigator-beacon-api/



# window.open被浏览器拦截

```js
$('.onebuy').one('click', function () {
     $.post('', function (res) {
         if (res.data.code == 1000) {
              window.open(res.data.url)
         } else {
             return;
         }
      }, 'json');
           
        });
    }
```

可惜不幸的是被浏览器拦截了.😂

**被拦截的原因：**

浏览器安全机制中，页面弹窗，必须是在用户触发的，才算合法弹窗；由ajax或定时执行的弹窗均为非用户触发。会被浏览器或相关安全软件理解为广告被拦截掉.

## 解决

但是当遇到错误的时候会打开空白页面

```js
xx.addEventListener('click', function () {
 var url = '';
            ajax().done(function() {
                // 重定向到目标页面
              url = 'target url';
            });
  // 先发请求, 等待执行
  setTimeout(function(){
    // 打开页面，此处最好使用提示页面
     var newWin = window.open('loading page');
     newWin.location.href = ;
  })
        },500);
```



# localStorage



```js
var localStorage =  window.localStorage;
    function put(key,sales_id,flag) {
        // 保存到 localStorage
        var str = localStorage.getItem(key);
        if(str) {
            str += (sales_id+flag);
            localStorage.setItem(key,str);
        }else {
            localStorage.setItem(key,sales_id+flag);
        }
    }
    // 取 storage
    function get(key,flag) {
        var uid = localStorage.getItem('promorion_browse_uid_key');
        if(uid != 0){
            var str = localStorage.getItem(key);
            if(str){
               
            }

            localStorage.setItem(key,'');
        }
    }
```



# location

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























































































































































