[TOC]

# 简介

什么叫设计模式?

就是一些解决问题的常规做法, 是一种认为较好的经验总结

共有`23`种设计模式.

设计模式主要分三个类型:创建型、结构型和行为型。  

## 创建型

创建模型用来处理对象的创建过程.

1. Singleton，单例模式：保证一个类只有一个实例，并提供一个访问它的全局访问点 ；     

应用场景：一个无状态的类使用单例模式节省内存资源。  

2. Abstract Factory，抽象工厂：提供一个创建一系列相关或相互依赖对象的接口，而无须指定它们的具体类。        

 应用场景：一系列相互依赖的对象有不同的具体实现。提供一种“封装机制”来避免客户程序和这种“多系列具体对象创建工作”的紧耦合。  

3. Factory Method，工厂方法：定义一个用于创建对象的接口，让子类决定实例化哪一个类，Factory Method使一个类的实例化延迟到了子类。 

应用场景：由于需求的变化，一个类的子类经常面临着剧烈的变化，但他却拥有比较稳定的接口。使用一种封装机制来“隔离这种易变对象的变化”，工厂方法定义一个用于创建对象的接口，让子类来确定创建哪一个具体类的对象，将对象的实例化延迟。  

3. Builder，建造模式：将一个复杂对象的构建与他的表示相分离，使得同样的构建过程可以创建不同的表示。     

应用场景：一个类的各个组成部分的具体实现类或者算法经常面临着变化，但是将他们组合在一起的算法却相对稳定。提供一种封装机制 将稳定的组合算法于易变的各个组成部分隔离开来。  

5. Prototype，原型模式：用原型实例指定创建对象的种类，并且通过拷贝这些原型来创建新的对象。       

应用场景：用new创建一个对象需要非常繁琐的数据准备或者权限  

## 行为型

用来处理类和对象的组合

1. Iterator，迭代器模式：提供一个方法顺序访问一个聚合对象的各个元素，而又不需要暴露该对象的内部表示。     

  应用场景：迭代。  

2. Observer，观察者模式：定义对象间一对多的依赖关系，当一个对象的状态发生改变时，所有依赖于它的对象都得到通知自动更新。     

应用场景： 某个实例的变化将影响其他多个对象。  

3. Template Method，模板方法：定义一个操作中的算法的骨架，而将一些步骤延迟到子类中，TemplateMethod使得子类可以不改变一个算法的结构即可以重定义该算法的某些特定步骤。  

应用场景：一个操作的步骤稳定，而具体细节的改变延迟的子类  

4. Command，命令模式：将一个请求封装为一个对象，从而使你可以用不同的请求对客户进行参数化，对请求排队和记录请求日志，以及支持可撤销的操作。       

应用场景：将命令者与执行者完全解耦。  

5. State，状态模式：允许对象在其内部状态改变时改变他的行为。对象看起来似乎改变了他的类。           

应用场景：一个对象的内部状态改变时，他的行为剧烈的变化。  

7. Strategy，策略模式：定义一系列的算法，把他们一个个封装起来，并使他们可以互相替换，本模式使得算法可以独立于使用它们的客户。       应用场景：  
8. China of Responsibility，职责链模式：使多个对象都有机会处理请求，从而避免请求的送发者和接收者之间的耦合关系  
9. Mediator，中介者模式：用一个中介对象封装一些列的对象交互。  
10. Visitor，访问者模式：表示一个作用于某对象结构中的各元素的操作，它使你可以在不改变各元素类的前提下定义作用于这个元素的新操作。  
11. Interpreter，解释器模式：给定一个语言，定义他的文法的一个表示，并定义一个解释器，这个解释器使用该表示来解释语言中的句子。  
12. Memento，备忘录模式：在不破坏对象的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态。 

## 结构型

1. Composite，组合模式：将对象组合成树形结构以表示部分整体的关系，Composite使得用户对单个对象和组合对象的使用具有一致性。  
2. Facade，外观模式：为子系统中的一组接口提供一致的界面，fa?ade提供了一高层接口，这个接口使得子系统更容易使用。  
3. Proxy，代理模式：为其他对象提供一种代理以控制对这个对象的访问  
4. Adapter,适配器模式：将一类的接口转换成客户希望的另外一个接口，Adapter模式使得原本由于接口不兼容而不能一起工作那些类可以一起工作。  
5. Decrator，装饰模式：动态地给一个对象增加一些额外的职责，就增加的功能来说，Decorator模式相比生成子类更加灵活。  
6. Bridge，桥模式：将抽象部分与它的实现部分相分离，使他们可以独立的变化。  
7. Flyweight，享元模式 

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

http://blog.csdn.net/psp0001060/article/details/50749267







![](https://ws2.sinaimg.cn/large/006tNc79ly1fkohjlb7vdj30il0fjdg0.jpg)



# 装饰模式  Decrator

`装饰器模式`是一种结构型模式，它动态的给一个对象添加一些额外的职责。就增加功能来说，Decorator模式相比生成子类更为灵活。











# 设计模式学习资料

http://binaryify.github.io/archives/page/3/

推荐你一本好书《软件秘笈：设计模式那点事》

http://www.57fx.com/search/

