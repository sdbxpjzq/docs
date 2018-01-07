[Laravel5.5 + Vue2 + Element 环境搭建](http://mrzhouxiaofei.com/2017/09/17/Laravel5.5%20+%20Vue2%20+%20Element%20%E7%8E%AF%E5%A2%83%E6%90%AD%E5%BB%BA/)

[laravel学院](http://laravelacademy.org/)



## 安装

```shell
composer create-project laravel/laravel --prefer-dist
```

## 关闭CSRF token

### 方法一

打开文件：app\Http\Kernel.php

把这行注释掉：

```
'App\Http\Middleware\VerifyCsrfToken'
```

# 安装Laravel 5 IDE Helper Generator

1. `composer require barryvdh/laravel-ide-helper  `
2. 下载完成后加入 **config/app.php** 中的 **providers** 数组中

   `Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider::class,`

3. 仅在开发系统中安装提示包

   `composer require --dev barryvdh/laravel-ide-helper`

4. 在 **app/Providers/AppServiceProvider.php **文件中注册
    ```php
    public function register()
    {
        if ($this->app->environment() !== 'production') {
            $this->app->register(\Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider::class);
        }
    ```
5. 生成代码跟踪支持

    `php artisan ide-helper:generate`



# 目录说明

![](https://ws4.sinaimg.cn/large/006tNc79ly1fn7sq6b78vj312k0mc0yx.jpg)

![](https://ws4.sinaimg.cn/large/006tNc79ly1fn7u402do9j31260den19.jpg)



# 路由

`\Illuminate\Support\Facades\Route`



![](https://ws1.sinaimg.cn/large/006tNc79ly1fn7u4wje4uj310w0ly449.jpg)

```php
Route::match(['GET','POST'],'/match',function (){
    return "get || post hello world";
});

Route::any('/any',function (){
    return "回响应所有的http请求";
});

// 传参
Route::any('/goods/{id}',function ($id = null) {
    return $id;
});

//路由别名
Route::any('/hello/list',['as' =>'list',function () {
    return route('list');// 获得路由地址
}]);
//路由分组
Route::group(['prefix'=>'home'],function (){
    Route::any('/test1',function (){
        return "回响应home的test1 http请求";
    });
    Route::any('/test2',function (){
        return "回响应home的test2 http请求";
    });
});

```



# Artisan控制台

![](https://ws2.sinaimg.cn/large/006tNc79ly1fn7uz6j19gj312205igog.jpg)

![](https://ws4.sinaimg.cn/large/006tNc79ly1fn7uzrk6znj30v80j0wir.jpg)



## 创建控制器

控制器是保存在`app/Http/COntrollers`里面,而且所有的控制器都会继承基础控制器(`Controllers`)

`php artisan make:controller GoodsController`



## 控制器处理请求

![](https://ws4.sinaimg.cn/large/006tNc79ly1fn81nh5tqtj311g0iiter.jpg)

![](https://ws2.sinaimg.cn/large/006tNc79ly1fn82fx0xcej31260kkjvy.jpg)

![](https://ws3.sinaimg.cn/large/006tNc79ly1fn82iyyfcaj319i0q845z.jpg)



# 使用session

session相关配置在`config/session.php`

![](https://ws3.sinaimg.cn/large/006tNc79ly1fn836eyhg1j30xo0iagqq.jpg)

![](https://ws1.sinaimg.cn/large/006tNc79ly1fn83a1vlo7j30n80eyq65.jpg)



# 数据库操作

## 配置文件

`config/database.php`

设置`.env`文件

```shell
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=zongqi
DB_USERNAME=zongqi
DB_PASSWORD=zongqi
```



## 数据库迁移

![](https://ws1.sinaimg.cn/large/006tNc79ly1fn851mbukoj313m0pa7b0.jpg)



## 数据库查询

3种操作方式









