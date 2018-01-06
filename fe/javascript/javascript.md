[TOC]



# 变量命名

1. 第一个字符必须是字母、下划线（_）或美元符号（$）


2. 余下的字符可以是下划线、美元符号或任何字母或数字字符 


3. 不能以数字开头


4. **区分大小写**




# 序列化

```
var data = 'name=王硕&age=20岁&beizhu=测试反序列化';
var targetObj = { };
data.split('&').forEach(function (item) {  //js的forEach()方法
    item = item.split('=');
    var name = item[0],
        val = item[1];
    Object.assign(targetObj,targetObj,{name: val});
});
```





# Object.assign()

`**Object.assign()**` 方法用于将所有可枚举的属性的值从一个或多个源对象复制到目标对象。它将返回目标对象。

https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/assign

```
Object.assign(target, ...sources)
```







# ajax— XMLHttpRequest 对象

js是单线程的 这意味着只有一个执行栈,但是浏览器在执行时有一个任务队列 ,,,这个队列用来保存异步任务.











# Fetch

https://juejin.im/entry/599cfac56fb9a0249b4841b8?utm_source=gold_browser_extension





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

## 使用`image`对象

在浏览器中，图片（img标签）是不受[同源策略](https://developer.mozilla.org/en-US/docs/Web/Security/Same-origin_policy)限制的，因此，我们可以利用这一点来进行跨域通信，这就是图像Ping技术。

```js
<script>
    var img = new Image();
    img.onload = img.onerror = function(){
         console.log(new Date().getTime());
    }
    img.src = "http://test.com?test=true";
</script>
```

我们创建一个Image实例，将图片的src属性指向请求的地址，然后将onload和onerror事件指向同一个函数，即可得知响应接受的时间。响应的数据可以是任意内容，但通常是像素图或204

图像Ping的特点

1. 兼容性非常好
2. 只支持GET请求
3. 请求只能是单向从客户端发服务器的，浏览器无法得到响应的内容

图像Ping的应用

由于这种图像Ping只能单向由客户端向服务器发送数据，因此主要用于数据统计功能中。













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































































































































































































