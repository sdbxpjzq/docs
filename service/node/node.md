[TOC]

https://github.com/Molunerfinn/vue-koa-demo/blob/master/Vue%2BKoa.md

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





# 管理node版本 — n

`npm install -g n`

安装node最新版本：

​     `n latest`

​     安装稳定版

   `  n stable`

​     查看已安装版本

   `  n`

删除指定版本

​    `n rm 0.10.1`

指定某个版本运行脚本

​    `n use 0.10.1`

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