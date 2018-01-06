[TOC]

# axios

http://www.jianshu.com/p/df464b26ae58

https://www.kancloud.cn/yunye/axios/234845

**安装**

`npm install axios --save`

**跨域问题解决**

首先说明当前访问的url地址: `http://localhost:8080/#/`

1. 就是在config这个文件里的index.js这个文件夹了 里面有个proxyTable 这个可以给你代理域名到你想要的域名。 简书搜索 proxyTable 跨域 就可以得到你想要的答案了. **需要配合chrome跨域插件好使(Allow-Control-Allow-Origin: *)**

```js
proxyTable: {
        '/sales/activity/ajax.php': {
            target: "https://m.mafengwo.cn/sales/activity/ajax.php",
            changeOrigin: true,
            pathRewrite: {
              '^/sales/activity/ajax.php': ""
            }
        },
}
```



> 以上方法若没解决(就像我😂),使用代理的方式吧
>
> 我是用 whistle 代理解决的

## 默认设置

### 全局默认设置

```js
axios.defaults.baseURL = 'https://api.example.com';
axios.defaults.headers.common['Authorization'] = AUTH_TOKEN;
axios.defaults.headers.post['Content-Type']='application/x-www-form-urlencoded';
```



## 跨域下post请求产生的问题

发送`post`请求时, 你会发现先发送`options`请求(具体可以去看[http基础](HTTP/index)).

https://juejin.im/entry/58eaf351a22b9d0058a8e35c

除了上面这篇文章提到的方法. 还可以使用`proxyTable`解决.

`/api/User/sLogin`

```js
proxyTable: {
      '/api':{
          target: 'http://api.zongqilive.cn',
          changeOrigin: true,
          pathRewrite: {
            '^/api': '/api'
          }
     }
}
```

又可以爽爽的开发了.



## 跨域携带cookie

main.js

```js
axios.defaults.withCredentials = true; // 跨域发送cookie
```

php

```php
header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}"); // // 当跨域携带cookie的时候, 不能使用 *
header("Access-Control-Allow-Methods: GET,POST");
header('Access-Control-Allow-Credentials: true'); // 设置cookie
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, Set-Cookie, sessionId");
```









`post`请求:

需要`qs.stringify(params)`

```js
import qs from 'qs';
// 数据格式
var params = {
    sName: this.userName,
    sPassWord: this.passWord
}
axios.post('/api/User/sLogin',qs.stringify(params)).then((res)=>{});
```

`get`请求:

```js
// 数据格式
var data = {
       params: {
          sName: this.userName,
          sPassWord: this.passWord
       }
}

axios.get('/api/User/sLogin',data).then((res)=>{});
```



