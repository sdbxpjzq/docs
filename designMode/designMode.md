[TOC]

#  公司的单例模式

```php
private static $_oInstance;
public static function oInstance()
{
    if (!self::$_oInstance) {
        self::$_oInstance = new self();
    }
    return self::$_oInstance;
}
```


# 设计模式学习资料

http://binaryify.github.io/archives/page/3/



