[TOC]



# 中文文档

http://www.expressjs.com.cn/



# express 入门

`npm install express --save-dev`

```js
var express = require('express');
var app = express();

var server = app.listen(3000, function () {
  var host = server.address().address;
  var port = server.address().port;
  console.log('wating...');
})
```



## app.use()

```js
app.use(function (req,res,next) { // 三个参数
    //http://172.18.20.134:8080/?bar=1
    // GET /?bar=1 /
    console.log(req.method,req.url,req.path);
    // res.send('hello world')
    next() // 继续往下执行的话
})

app.use(function(req,res){
    res.send('zongqi') // 只能发送一次 http 协议
})
```





# 路由



```js
//app.get 自带 next 参数, 自己往下执行

app.get('/',function(req,res){
    res.send('<h1>root</h1>')
});

app.get('/foo',function(req,res){
    res.send('<h1>foo</h1>')
});
app.use(function (req,res,next) {
    // 设置404
    res.status(404).send('<h1>404页面</h1>')
})
```



## 路由匹配

```js

// ? 匹配前一个字母,为可选字母
http://172.18.20.134:8080/abcd
http://172.18.20.134:8080/acd
app.get('/ab?cd',function(req,res){
    res.send('<h1>root</h1>')
});

// + 匹配前一个字母,为n个重复出现
http://172.18.20.134:8080/abbbbcd
http://172.18.20.134:8080/abcd
app.get('/ab+cd',function(req,res){
    res.send('<h1>root</h1>')
});

// * 匹配当前位置可是任意字母
app.get('/ab*cd',function(req,res){
    res.send('<h1>root</h1>')
});

// 正则的写法, 还有很多写法
app.get('/a/',function(req,res){
    res.send('<h1>/a/</h1>')
});


// () 配合 ? 使用, ()内的字母可以出现
app.get('/ab(cd)?e',function(req,res){
    res.send('<h1>root</h1>')
});

// 最后是404 设置
app.use(function (req,res,next) {
    // 设置404
    res.status(404).send('<h1>404页面</h1>')
})
```



### 特殊情况

出现了两个回调函数, 第一个要调用 next()

```js
app.get('/a/',function(req,res,next){
    console.log('<h1>root</h1>')
    next() //  要想执行 第二个回调函数, 需要用 next()
},function (req,res) {
    res.send('<h1>root</h1>');
});
```





