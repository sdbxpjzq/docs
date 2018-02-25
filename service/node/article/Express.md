# Express

[中文官网](http://www.expressjs.com.cn/)



```node

```



https://juejin.im/post/59bce35f5188257e70531ec0



## 路由

```express
var express = require('express');
var app = express();

// GET method route
app.get('/', function (req, res) {
  res.send('GET request to the homepage');
});

// POST method route
app.post('/', function (req, res) {
  res.send('POST request to the homepage');
});

```



### app.all()

`app.all()` 是一个特殊的路由方法，没有任何 HTTP 方法与其对应，它的作用是对于一个路径上的所有请求加载中间件

## 参数

```node
app.get('/teacher/:gonghao',function (req,res) {
    console.log(req.params);
    res.send('老师工号'+ req.params['gonghao']);
});
```















