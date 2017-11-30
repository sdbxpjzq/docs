[TOC]

https://github.com/Molunerfinn/vue-koa-demo/blob/master/Vue%2BKoa.md

# url模块

```js
const url = require('url');
```



# http模块

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





# querystring模块





# Net模块



# Buffer

http://www.runoob.com/nodejs/nodejs-buffer.html

JavaScript 语言自身只有字符串数据类型，没有二进制数据类型。

但在处理像TCP流或文件流时，必须使用到二进制数据。因此在 Node.js中，定义了一个 Buffer 类，该类用来创建一个专门存放二进制数据的缓存区。

## 创建 Buffer 类

- 创建长度为 10 字节的 Buffer 实例：

```js
var buf = new Buffer(10);
```

- 通过给定的数组创建 Buffer 实例：

```js
 var buf = new Buffer([1,3.14]);
buf[0]; // 1
buf[1]; // 3 并不是 3.14,
```



![](https://ws1.sinaimg.cn/large/006tKfTcly1flhdc4f6zsj30po0gkdgg.jpg)



![](https://ws3.sinaimg.cn/large/006tKfTcly1flhdbnybvlj314o0kwdjt.jpg)



# fs 模块  — 文件系统

fs 模块）模块中的方法均有异步和同步版本.例如读取文件内容的函数有异步的 fs.readFile() 和同步的 fs.readFileSync()。

异步的方法函数最后一个参数为回调函数，回调函数的第一个参数包含了错误信息(error)。

![](https://ws1.sinaimg.cn/large/006tKfTcly1fliimiz92kj31900sudnz.jpg)





# Stream 流

`Stream` 有四种流类型：

- **Readable** - 可读操作。
- **Writable** - 可写操作。
- **Duplex** - 可读可写操作.
- **Transform** - 操作被写入数据，然后读出结果

![](https://ws3.sinaimg.cn/large/006tKfTcgy1fliplexywej30ys0ewabe.jpg)



所有的 `Stream` 对象都是` EventEmitter` 的实例。常用的事件有：

- **data** - 当有数据可读时触发。
- **end** - 没有更多的数据可读时触发。
- **error** - 在接收和写入过程中发生错误时触发。
- **finish** - 所有数据已被写入到底层系统时触发。





![](https://ws1.sinaimg.cn/large/006tKfTcgy1flijcpy0shj313a0s2tex.jpg)










# module.exports与exports

http://weizhifeng.net/node-js-exports-vs-module-exports.html







# nrm 源管理

**nrm - 源管理**

`npm install -g nrm`

`nrm ls`

* npm ---- https://registry.npmjs.org/
  cnpm --- http://r.cnpmjs.org/
  taobao - http://registry.npm.taobao.org/
  eu ----- http://registry.npmjs.eu/
  au ----- http://registry.npmjs.org.au/
  sl ----- http://npm.strongloop.com/
  nj ----- https://registry.nodejitsu.com/``

`nrm use taobao`

`nrm add  <registry> <url> [home]`

`nrm del <registry>`

`nrm test npm  `

`nrm test`





# now

`npm i -g --unsafe-perm now`





# 服务端使用node 无法加载模块

安装全局模块

```
npm install -g cron
```

执行`cron.js`

```js
let  cronJob = require("cron").CronJob;
new cronJob('* * * * * *', function () {
    console.log(1232323)
}, null, true, 'Asia/Chongqing');
```



```shell
node cron.js
```

> 报错:
>
> **Error: Cannot find module 'cron'**

解决:

设置系统变量

```shell
export NODE_PATH=/node/lib/node_modules/
```







# nodemon 时时监测你的文件

http://bubkoo.com/2014/12/02/use-nodemon-with-node-applications/#undefined





# 发送请求的模块

[SuperAgent](http://www.jianshu.com/p/98b854322260)

request模块



很好的聊天方式啊

http://zhangwenli.com/#ovilia-home