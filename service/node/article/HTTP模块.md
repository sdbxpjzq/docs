# http模块

```js
let http = require('http');

// createServer([requestListener]) requestListener 是一个函数，会被自动添加到 'request' 事件。
let server = http.createServer(function (requst, response) {


    // response.writeHead(statusCode[, statusMessage][, headers])
    // response.setHeader() 设置的响应头会与 response.writeHead() 设置的响应头合并，且 response.writeHead() 的优先。
    response.setHeader('Content-Type','text/plain');
    response.setHeader('X-Foo', 'bar');
    response.writeHead(200,{'Content-Type': 'text/html'});

    //该方法会通知服务器，所有响应头和响应主体都已被发送，即服务器将其视为已完成。
    // 每次响应都必须调用 response.end() 方法。
    //
    // 如果指定了 data，则相当于调用 response.write(data, encoding) 之后再调用 response.end(callback)。
    // 如果指定了 callback，则当响应流结束时被调用。
    response.write(requst.url);
    response.write('---haha');
    response.end();
});

server.listen(3000,'127.0.0.1');

```



http://blog.csdn.net/msmile_my/article/details/52167698

http://blog.csdn.net/gxhacx/article/details/12433285

![](https://ws3.sinaimg.cn/large/006tKfTcly1flfim92wgkj30z00oawgn.jpg)



函数的功能是作为客户端向HTTP服务器发起请求。

## 接收参数

option   数组对象，包含以下参数：

- host:

  表示请求网站的域名或IP地址（请求的地址）。 默认为'localhost'。    

- hostname

  服务器名称，主机名是首选的值

- port

 请求网站的端口，默认为 80。

- localAddress

建立网络连接的本地 

- socketPath

Unix Domain Socket（Domain套接字路径）

- method

 HTTP请求方法，默认是 ‘GET'。

- path

请求的相对于根的路径，默认是'/'。QueryString应该包含在其中。例如：/index.html?page=12

- headers

 请求头对象。

- auth

Basic认证（基本身份验证），这个值将被计算成请求头中的 Authorization 部分。

- callback

  回调，传递一个参数，为 http.ClientResponse的实例。http.request 返回一个 http.ClientRequest 的实例。               

