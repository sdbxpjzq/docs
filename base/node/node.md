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





很好的聊天方式啊

http://zhangwenli.com/#ovilia-home