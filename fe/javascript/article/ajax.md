[TOC]



# Ajax异步请求是否真的异步?

既然说[JavaScript](http://caibaojian.com/t/javascript)是单线程运行的，那么XMLHttpRequest在连接后是否真的异步?

其实请求确实是异步的，这请求是由**浏览器新开一个线程请求**（见前面的浏览器多线程）。当请求的状态变更时，如果先前已设置回调，这异步线程就产生状态变更事件放到 JavaScript引擎的事件处理队列中等待处理。当浏览器空闲的时候出队列任务被处理，JavaScript引擎始终是单线程运行回调函数。javascript引擎确实是单线程处理它的任务队列，能理解成就是普通函数和回调函数构成的队列。

>  总结一下，Ajax请求确实是异步的，这请求是由**浏览器新开一个线程请求，事件回调的时候是放入Event loop单线程事件队列等候处理。**

ajax默认是utf-8编码.

# get请求

```js
xmlhttp.open('POST','login_chk.php',true);
                   xmlhttp.send(null);
                   xmlhttp.onreadystatechange=function(){
                 if(xmlhttp.readyState==4 && xmlhttp.status==200){
                 // 获取login_chk.php页的返回信息
                 var msg=xmlhttp.responseText;
                   }
```



# post请求

```js
url="";
          xmlhttp.open('POST','login_chk.php',true);
          // 用post传输，需要写setRequestHeader
         xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
         xmlhttp.send(url);
          xmlhttp.onreadystatechange=function(){
                 if(xmlhttp.readyState==4 && xmlhttp.status==200){
                 // 获取login_chk.php页的返回信息
                 var msg=xmlhttp.responseText;
                   }
```















