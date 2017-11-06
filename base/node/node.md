[TOC]









https://github.com/Molunerfinn/vue-koa-demo/blob/master/Vue%2BKoa.md





# url模块

```js
const url = require('url');

```



# http模块







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









