# thinkphp

## 路由

![](https://ws3.sinaimg.cn/large/006tNbRwly1fpljkb1sw5j31jq0rejua.jpg)

普通模式

`http://domain/模块/控制器/方法名`  

- `http://10.211.55.7:81/index/api/demo`





### 路由定义

- \think\Route::rule

> #### Route::rule('路由表达式','路由地址','请求类型','路由参数（数组）','变量规则（数组）');

```
\think\Route::rule('demo','index/api/demo2');
```

- Route::get();  或者 Route::post();

传参:

```
Route::post('demo','index/api/demo2',['iNumber']);
```

