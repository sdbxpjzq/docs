# include一个目录下的所有php文件

指定一个文件夹，在php里include这个文件夹下的所有.php文件

```php
const PATH =  __DIR__.'/router/';
foreach (glob(PATH.'*.php') as $filename){
    include_once $filename;
}
```

