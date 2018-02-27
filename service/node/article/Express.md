# Express

[中文官网](http://www.expressjs.com.cn/)



```node

```



https://juejin.im/post/59bce35f5188257e70531ec0



## 路由

```js
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

```js
app.get('/teacher/:gonghao',function (req,res) {
    console.log(req.params);
    res.send('老师工号'+ req.params['gonghao']);
});
```



## post和get请求

![](https://ws1.sinaimg.cn/large/006tNc79gy1fosn1zh2y7j31400fidj7.jpg)

### get参数

```js
app.get('/admin/login',function (req,res) {
    res.send(req.query);
});
```

### post参数

https://www.npmjs.com/package/body-parser

`npm install body-parser --save`

```js
const express = require('express');
const bodyParser = require('body-parser');
let app = express();
// for parsing application/json
app.use(bodyParser.json()); 
// for parsing application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }));

app.post('/admin/login',function (req,res) {
    res.send(req.body);
});
```



### 文件上传

https://github.com/expressjs/multer/blob/master/doc/README-zh-cn.md

`npm install --save multer`















