[TOC]

什么叫设计模式

就是一些解决问题的常规做法, 是一种认为较好的经验总结

# 工厂模式

工厂类是指包含了一个专门用来创建其他对象的方法类.

一般原则被命名为`factory`的`静态方法`

```php
interface IImage{
    function getWidth();
    function getHeight();
    function getData();
}

// 处理 JPG图片
class Image_JPG implements IImage {

    private $_file;
    private $_width;
    private $_height;
    private $_data;
    public function __construct($fileName)
    {
        $this->_file = $fileName;
        $this->_parse();
    }
    public function _parse()
    {
        // 赋值 $_width $_height $_data
    }

    public function getData()
    {
        // TODO: Implement getData() method.
    }
    function getHeight()
    {
        // TODO: Implement getHeight() method.
    }
    function getWidth()
    {
        // TODO: Implement getWidth() method.
    }

}
// 处理 PNG图片
class Image_PNG implements IImage {

    private $_file;
    private $_width;
    private $_height;
    private $_data;
    public function __construct($fileName)
    {
        $this->_file = $fileName;
        $this->_parse();
    }
    public function _parse()
    {
        // 赋值 $_width $_height $_data
    }

    public function getData()
    {
        // TODO: Implement getData() method.
    }
    function getHeight()
    {
        // TODO: Implement getHeight() method.
    }
    function getWidth()
    {
        // TODO: Implement getWidth() method.
    }

}

// 图片工厂
class ImageFactory {
    public static function factory($file)
    {
        $sPathParts = pathinfo($file);
        switch (strtolower($sPathParts['extension'])) {
            case 'jpg':
                $ret = new Image_JPG($file);
                break;
            case 'png':
                $ret = new Image_PNG($file);
                break;
        }

        if ($ret instanceof IImage) {
            return $ret;
        }
    }
}

// 调用
$image = ImageFactory::factory('./my.jpg');
```







# 单例模式



```php
class single
{

  // 禁止 new
    private function __construct(){}
    // 禁止 clone
    public function __clone(){}
  
    private static $_oInstance;
    public static function oInstance()
    {
        if (!self::$_oInstance) {
            self::$_oInstance = new self();
        }
        return self::$_oInstance;
    }
}
```







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



# 门面模式 (Facade Pattern 外观模式)

http://blog.csdn.net/xingjiarong/article/details/50066133







# 设计模式学习资料

http://binaryify.github.io/archives/page/3/





