[TOC]



[koa实战](http://book.apebook.org/minghe/koa-action/hello-koa/index.html)

# 简单入门

```js
// 导入koa，和koa 1.x不同，在koa2中，我们导入的是一个class，因此用大写的Koa表示:
const Koa = require('koa');

// 创建一个Koa对象表示web app本身:
const app = new Koa();

// 对于任何请求，app将调用该异步函数处理请求：
app.use(async (ctx, next) => {
    await next();
    ctx.response.type = 'text/html';
    ctx.response.body = '<h1>Hello, koa2!</h1>';
});

// 在端口3000监听:
app.listen(3000);
console.log('app started at port 3000...');
```

每一个http请求,koa将调用我们传入的异步函数来处理.

```js
async (ctx, next) => {  // ctx是 context 的缩写 
    await next();
    // 设置response的Content-Type:
    ctx.response.type = 'text/html';
    // 设置response的内容:
    ctx.response.body = '<h1>Hello, koa2!</h1>';
}
```

由`async`标记的函数称为异步函数，在异步函数中，可以用`await`调用另一个异步函数.

参数`ctx`是由koa传入的封装了`request`和`response`的变量，我们可以通过它访问`request`和`response`，`next`是koa传入的将要处理的下一个异步函数。

>  为什么要调用`next`呢?  继续往下看

```js
app.use(async (ctx, next) => {
    ctx.body = 'one';
    await next(); // 调用下一个middleware
});

app.use(async (ctx, next) => {
    const start = new Date().getTime(); // 当前时间
    ctx.body += 'two'; // 打印耗费时间
    await next(); // 调用下一个middleware
    const ms = new Date().getTime() - start; // 耗费时间
    ctx.body +=  ms+ 'two 耗时';
});

app.use(async (ctx, next) => {
    await next();
    ctx.response.type = 'text/html';
    ctx.response.body += '<h1>Hello, koa!</h1>';
});

```

![](https://ws1.sinaimg.cn/large/006tKfTcgy1fl7h597f3nj30eo0960sn.jpg)



# koa-router

[github](https://github.com/alexmingoia/koa-router)



https://chenshenhai.github.io/koa2-note/note/route/koa-router.html

https://github.com/chenshenhai

## 设置前缀

```node
const router = new Router({
      prefix:'/zongqi'
})
```

访问链接: http://127.0.0.1:3000/zongqi/test

## 嵌套路由

```nodejs
const Koa = require('koa');
const app = new Koa();
const Router = require('koa-router');
 
 
let home = new Router();
home.get('/zongqi',async(ctx)=>{
    ctx.body="Home zongqi";
}).get('/todo',async(ctx)=>{
    ctx.body ='Home ToDo';
})
 
 
 
let page = new Router();
page.get('/zongqi',async(ctx)=>{
    ctx.body="Page zongqi";
}).get('/todo',async(ctx)=>{
    ctx.body ='Page ToDo';
})
 
//装载所有子路由
let router = new Router();
router.use('/home',home.routes(),home.allowedMethods());
router.use('/page',page.routes(),page.allowedMethods());
 
 
//加载路由中间件
app.use(router.routes()).use(router.allowedMethods());
 
app.listen(3000,()=>{
    console.log('[demo] server is starting at port 3000');
});
```

## 接收参数

### get请求

`ctx.query` `ctx.params`

```node
const Koa = require('koa');
const Router = require('koa-router');
const app = new Koa();
const router = new Router();

// http://127.0.0.1:3000?name=zongqi
router.get('/', function (ctx, next) {
    ctx.body=ctx.query; // query, 接收get参数
});

// http://127.0.0.1:3000/test2/zongqi
router.get('/test/:name', function (ctx, next) {
    ctx.body=ctx.params; // params, 接收get参数
});

app
  .use(router.routes())
  .use(router.allowedMethods());
  app.listen(3000,()=>{
      console.log('starting at port 3000');
  });
```





# 跨域问题

https://github.com/zadzbw/koa2-cors

http://www.jianshu.com/p/d7fcd17d79a9



















[参考廖雪峰js教程](https://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/001471087582981d6c0ea265bf241b59a04fa6f61d767f6000)







