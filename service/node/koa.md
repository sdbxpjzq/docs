



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





# async/await的使用方法

## async

```node
async function testAsync(){
    return 'Hello async';
}
const result = testAsync();
console.log(result);
```

输出一个promise:

`Promise { 'Hello async' }`

## await

这是 `async` 和 `wait`的简写.

await一般在等待async方法执行完毕.但是其实await等待的只是一个表达式，这个表达式在官方文档里说的是Promise对象，可是它也可以接受普通值.

```node
function getSomething(){
    return 'something';
}
 
async function testAsync(){
    return 'Hello async';
}
 
async function test(){
    const v1=await getSomething();
    const v2=await testAsync();
    console.log(v1,v2);
}
 
test();
```

实际项目中多是去后台请求数据，等数据回来后进行执行。

```node
function takeLongTime() {
    return new Promise(resolve => {
        setTimeout(() => resolve("long_time_value"), 3000);
    });
}
 
async function test() {
    const v = await takeLongTime();
    console.log(v);
}
 
test();
```





















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



### post请求

`npm install koa-bodyparser --save`

当然`koa-bodyparser`也能接收Get请求的参数

```node
static async postIndex(context,next)
    {
        context.body = {
            value:context.request.body // post参数
        };

    }
```



# cookie

- ctx.cookies.get(name,[optins]):读取上下文请求中的cookie。
- ctx.cookies.set(name,value,[options])：在上下文中写入cookie。

### 写入Cookie操作：

```node
const Koa  = require('koa');
const app = new Koa();
 
app.use(async(ctx)=>{
    if(ctx.url=== '/index'){
        ctx.cookies.set(
            'MyName','JSPang'
        );
        ctx.body = 'cookie is ok';
    }else{
        ctx.body = 'hello world'
    }
});
 
app.listen(3000,()=>{
    console.log('[demo] server is starting at port 3000');
})
```

### Cookie选项

比如我们要存储用户名，保留用户登录状态时，你可以选择7天内不用登录，也可以选择30天内不用登录。这就需要在写入是配置一些选项：

- domain：写入cookie所在的域名
- path：写入cookie所在的路径
- maxAge：Cookie最大有效时长
- expires：cookie失效时间
- httpOnly:是否只用http请求中获得
- overwirte：是否允许重写

```node
const Koa  = require('koa');
const app = new Koa();
 
app.use(async(ctx)=>{
    if(ctx.url=== '/index'){
        ctx.cookies.set(
            'MyName','JSPang',{
                domain:'127.0.0.1', // 写cookie所在的域名
                path:'/index',       // 写cookie所在的路径
                maxAge:1000*60*60*24,   // cookie有效时长
                expires:new Date('2018-12-31'), // cookie失效时间
                httpOnly:false,  // 是否只用于http请求中获取
                overwrite:false  // 是否允许重写
            }
        );
        ctx.body = 'cookie is ok';
    }else{
        ctx.body = 'hello world'
    }
});
 
app.listen(3000,()=>{
    console.log('[demo] server is starting at port 3000');
})
```



### 读取Cookie：

```node
 ctx.body = ctx.cookies.get('MyName');
```



# koa-static静态资源中间件

`npm install --save koa-static`

我们新建一个demo12.js文件，引入koa-static中间件，并用app.use方法进行使用。

```node
const Koa = require('koa')
const path = require('path')
const static = require('koa-static')
 
const app = new Koa()
 
 
const staticPath = './static'
 
app.use(static(
  path.join( __dirname,  staticPath)
))
 
 
app.use( async ( ctx ) => {
  ctx.body = 'hello world'
})
 
app.listen(3000, () => {
  console.log('[demo] static-use-middleware is starting at port 3000')
```





# 跨域问题

https://github.com/zadzbw/koa2-cors

http://www.jianshu.com/p/d7fcd17d79a9



















[参考廖雪峰js教程](https://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/001471087582981d6c0ea265bf241b59a04fa6f61d767f6000)







