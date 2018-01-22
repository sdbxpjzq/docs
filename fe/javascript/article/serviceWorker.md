# serviceWorker

## 有故事的serviceWorker

​	在此之前，已经有一位老员工，它叫Web Worker。那么问题来了，Boss是谁？Boss就是浏览器。准确来说，每个页面的javascript运行主线程都是一个Boss。

​	这里先谈一下大的背景。Boss很厉害，在页面上指点江山，呼风唤雨。但他有个局限：同一时刻只做一件事（**单线程**）。当一些很耗时的杂事让Boss去处理时，在处理的过程中他就无暇顾及其它重要的事了。在用户看来，页面没人管了，Boss不干事了！这时Boss就很郁闷。为了保证Boss能处理更重要的事情，董事会（**W3C**）终于招聘了一个新员工：Web worker。这下，Boss终于可以从耗时的杂事中解放出来了，他只需要把Web worker叫过来说：“这些事情拿去做，没做完不要来找我”。Web worker领到任务后默默地到自己的工位（**线程**）去干活，完成之后给Boss发了个邮件（**postMessage**）。Boss收到邮件（**onmessage**）后欣慰地点了点头。

​	扯了半天好像还没谈到新员工啊。。。不急，下面就讲到了。

​	Boss下班了（**页面关闭**）,Web worker也收拾东西回家了。这样执行了很久，直至2014年6月，董事会发现一个问题：“居然没有人在老板下班后加班？”。于是，又招了一个专职加班的：Service Worker。它被赋予的绩效目标如下：

1. 入职（install）后永不下班，而能更新。
2. 能处理Boss需要的资源（HTTPS请求），以便离线时也能让BOSS取到数据（从cache中）。
3. 能向客户推送消息([push notifications](https://developers.google.com/web/updates/2015/03/push-notifications-on-the-open-web))
4. 不允许越权管理Boss的事（DOM ACCESS）

总地来说，Service worker是独立于页面的一个运行环境，它在页面关闭后仍可以运行。同时，也能对它负责的页面的网络请求进行截取和返回请求（类似于Fiddler）。

## 使用条件

### **请求协议条件 HTTPS**

当然localhost是一个特例。

 毕竟给Service Worker的权利较大，可以直接截取和返回用户的请求，所以了于安全考虑，目前只能在HTTPS环境下才能使用Service Worker。

### 浏览器支持

![](https://ws1.sinaimg.cn/large/006tNc79ly1fno0g0j3ucj30yr08iaao.jpg)



## 生命周期

![](https://ws4.sinaimg.cn/large/006tNc79ly1fno1ttbky3j30jk0i3weu.jpg)

图中可以看到，一个service worker要经历以下过程：
1. 安装
2. 激活，激活成功之后，打开`chrome://inspect/#service-workers`(或者打开`chrome://serviceworker-internals`)可以查看到当前运行的`service worker`

![](https://ws2.sinaimg.cn/large/006tNc79ly1fno1vkn240j30pe07gdft.jpg)

3. 监听fetch和message事件
4. 销毁，是否销毁由浏览器决定，如果一个`service worker`长期不使用或者机器内存有限，则可能会销毁这个worker



### fetch事件

​	在页面发起http请求时，service worker可以通过`fetch`事件拦截请求，并且给出自己的响应。w3c提供了一个新的fetch api，用于取代XMLHttpRequest，与XMLHttpRequest最大不同有两点：

1. fetch()方法返回的是Promise对象，通过then方法进行连续调用，减少嵌套。ES6的Promise在成为标准之后，会越来越方便开发人员。


2. 提供了Request、Response对象，前端要发起请求可以通过url发起，也可以使用Request对象发起，而且Request可以复用。但是Response用在哪里呢？在service worker出现之前，前端确实不会自己给自己发消息，但是有了service worker，就可以在拦截请求之后根据需要发回自己的响应，对页面而言，这个普通的请求结果并没有区别，这是Response的一处应用。

```js
/* 由于是get请求，直接把参数作为query string传递了 */
var URL = 'https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=your_api_key&format=json&nojsoncallback=1&tags=penguins';
 
function fetchDemo() {
  // fetch(url, option)支持两个参数，option中可以设置header、body、method信息
  fetch(URL).then(function(response) {
    // 通过promise 对象获得相应内容，并且将响应内容按照json格式转成对象，json()方法调用之后返回的依然是promise对象
    // 也可以把内容转化成arraybuffer、blob对象
    return response.json();
  }).then(function(json) {
    // 渲染页面
    insertPhotos(json);
  });
}
 
fetchDemo();
```

fetch api与XMLHttpRequest相比，更加简洁，并且提供的功能更全面，资源获取方式比ajax更优雅。兼容性方面：chrome 42开始支持，对于旧浏览器，可以通过官方维护的polyfill支持。

### message事件

页面和serviceWorker之间可以通过posetMessage()方法发送消息，发送的消息可以通过message事件接收到。

这是一个双向的过程，页面可以发消息给service worker，service worker也可以发送消息给页面，由于这个特性，可以将service worker作为中间纽带，使得一个域名或者子域名下的多个页面可以自由通信。

这里是一个小的页面之间通信[demo](https://nzv3tos3n.qnssl.com/message/msg-demo.html)

















http://web.jobbole.com/84792/



http://imweb.io/topic/56592b8a823633e31839fc01
https://zqianduan.com/2017/07/17/service-worker/










