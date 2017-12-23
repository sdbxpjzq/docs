[TOC]

# 简介

什么叫设计模式?

就是一些解决问题的常规做法, 是一种认为较好的经验总结

共有`23`种设计模式.

设计模式主要分三个类型:创建型、结构型和行为型。  

## 创建型

创建模型用来处理对象的创建过程. 主要包括5种设计模式.

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

用来对类或者对象怎么交互和怎么分配职责进行描述, 主要包括11种设计模式.

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

用来处理类或者对象的组合, 主要包括7种设计模式.

1. Composite，组合模式：将对象组合成树形结构以表示部分整体的关系，Composite使得用户对单个对象和组合对象的使用具有一致性。  
2. Facade，外观模式：为子系统中的一组接口提供一致的界面，fa?ade提供了一高层接口，这个接口使得子系统更容易使用。  
3. Proxy，代理模式：为其他对象提供一种代理以控制对这个对象的访问  
4. Adapter,适配器模式：将一类的接口转换成客户希望的另外一个接口，Adapter模式使得原本由于接口不兼容而不能一起工作那些类可以一起工作。  
5. Decrator，装饰模式：动态地给一个对象增加一些额外的职责，就增加的功能来说，Decorator模式相比生成子类更加灵活。  
6. Bridge，桥模式：将抽象部分与它的实现部分相分离，使他们可以独立的变化。  
7. Flyweight，享元模式 




![](https://ws3.sinaimg.cn/large/006tNc79ly1fmd31g9uulj31kw0ptdsn.jpg)





# 原型模式 — Object.create 与 prototype

## 说明

使用原型实例来 拷贝 创建新的可定制的对象；新建的对象，不需要知道原对象创建的具体过程

过程：`Prototype => new ProtoExam => clone to new Object`

## 应用场景

原型模式，一般用于 抽象结构复杂，但内容组成差不多，抽象内容可定制，新创建只需在原创建对象上稍微修改即可达到需求的情况；

## 相关代码:

```js
function UserInfo() {
        this.name = '';
        this.age = 0;
        this.sex = '';
    }
    UserInfo.prototype.listInfo = function () {
        let info = '个人信息, 姓名: '+this.name+', 年龄: '+this.age+', 性别:'+this.sex;
        console.log(info)
    }

    let _userInfo = new UserInfo(); // 原型实例
    let person_01 = Object.create(_userInfo);
    person_01.name = '小明';
    person_01.age = 20;
    person_01.sex = '男';
    person_01.listInfo();

    let  person_02 = Object.create(_userInfo);
    person_02.name = '小红';
    person_02.age = 25;
    person_02.sex = '女';
    person_02.listInfo();
```

输出:

```js
个人信息, 姓名: 小明, 年龄: 35, 性别: 男
个人信息, 姓名: 小华, 年龄: 33, 性别: 女
```



## 作用和注意:

![](https://ws2.sinaimg.cn/large/006tKfTcgy1fmoeml3zzlj31gc0f0777.jpg)

## 深拷贝和浅拷贝

 js中`基本类型的赋值`为深拷贝，而`引用类型的赋值`为浅拷贝.

###### 浅拷贝:

就是把**数据的地址**赋值给对应变量，而没有把具体的数据复制给变量，变量会随数据值的变化而变化。

```js
var myobj = {
        str: 'zongqi',
        num:1,
        myarr:[30,{
            arrgo: 'i am arr'
        }],
        myobj:{
            innerobj:{
                test:25
            },
            innerstr:"innerstrzongqi"
        }
    }

    // 浅拷贝
    function clone(obj) {
        var ret = {};
        for (var k in obj){
            ret[k] = obj[k]
        }
        return ret;
    }

var res = clone(myobj);
    res.myobj.innerstr = 6000; // 将原型给改了  这浅拷贝
    console.log('outres');
    console.log(res);
    console.log('myobj');
    console.log(myobj);
```



###### 深拷贝:

就是把数据赋值给对应的变量，从而产生一个与源数据不相干的新数据(数据地址已变化)。

```js
var myobj = {
        str: 'zongqi',
        num:1,
        myarr:[30,{
            arrgo: 'i am arr'
        }],
        myobj:{
            innerobj:{
                test:25
            },
            innerstr:"innerstrzongqi"
        }
    }

// 深拷贝
    function clone2(obj) {
        var ret,b;
        if ( (b = obj instanceof Array) || obj instanceof Object){
            ret = b? []: {};
            for (var k in obj){
                if (obj[k] instanceof Array || obj[k] instanceof Object){
                    ret[k] = clone2(obj[k]);
                }else {
                    ret[k] = obj[k];
                }
            }
        }
        return ret;
    }

var res2 = clone2(myobj);
    res2.myobj.innerstr = 6000; // 只是修改了res2的数据, myobj数据没有修改
    console.log('outres2');
    console.log(res2);
    console.log('myobj');
    console.log(myobj);
```

[设计模式 JavaScript 之 原型模式 : Object.create 与 prototype](http://www.cnblogs.com/editor/p/4167653.html)



# 责任链模式

## 定义

责任链接模式又称职责链模式，是一种对象的行为模式；它是一种链式结构，每个节点都有可能两种操作，要么处理该请求停止该请求操作，要么把请求转发到下一个节点，让下一个节点来处理请求；该模式定义了一些可能的处理请求的节点对象，请求的起点跟顺序都可能不一样，处理的节点根据请求的不一样而不同；请求者不必知道数据处理完成是由谁来操作的，内部是一个黑箱的操作过程，这是它的一个核心内容；

demo解读:

 BOSS要用php实现一段功能, 但是BOSS可不会写代码, 然后交给了项目经理, 项目经理也不会写代码, 最终交给了Coder来实现.

BOSS —> 项目经理 —> Coder

类似于 DOM冒泡

```js

 // 程序员
    function Coder() {}
    Coder.prototype.writeCode = function (code) {
        console.log('ing....'+code);
    }

    // 项目经理
    function XiangMuVp() {
        this.Coder = new Coder;
    }
    XiangMuVp.prototype.writeCode = function (code) {
        this.Coder.writeCode(code);
    }

    // 老板
    function Boss() {
        this.XiangMuVp = new XiangMuVp;
    }
    // 老板的需求
    Boss.prototype.writeCode = function (code) {
        // 用代码实现功能
        // 找项目经理实现一个功能
        this.XiangMuVp.writeCode(code);
    }


    var  begain = new Boss(new XiangMuVp(new Coder()));
    begain.writeCode('php');

```

参考:

[javascript 之 责任链模式](http://www.cnblogs.com/editor/p/5679552.html)

# 迭代器模式

## 定义

迭代子模式，又称游标模式，是一种用于对聚集进行顺序访问规则的模式，是一种行为模式；它用于提供对聚集对象的一种统一的访问接口，使客户能够在不了解聚集对象内部结构的情况对聚集对象进行访问。它涉及两个部分，一个是聚集对象，一个迭代子对象，迭代对象(Iterator)用于提供访问聚集对象的标题访问方法；

## 主要组成角色:

- 抽象迭代子角色：用于定义访问聚集的标准方法
- 具体迭代子角色：用于实现访问聚集的访问方法
- 抽象聚集角色：用于定义公共的聚集对象访问方法，主要的有迭代对象，当前元素获取，聚集对象大小;
- 具体聚集角色：用于实现聚集对象的公共访问;



代码实例:

```js
// 抽象迭代角色
    function abstractIterator() {
        this.prev = function(){}

        this.next = function() {

        };

        this.first = function() {

        };

        this.hasNext = function() {

        };

        this.get = function() {

        };
    }

//具体迭代角色
    function Inteator(colls) {
        this.colls = colls;
        this.index = 0;
    };

    Inteator.prototype = abstractIterator.prototype;

    Inteator.prototype.prev = function() {
        if (this.index > 0)
            this.index --;
    };

    Inteator.prototype.next = function() {
        if (this.index < this.colls.size()) {
            this.index++;
        }
    };

    Inteator.prototype.first = function() {
        this.index = 0;
    };

    Inteator.prototype.hasNext = function() {
        return this.index < this.colls.size();
    };

    Inteator.prototype.get = function() {
        return this.colls.get(this.index);
    };

    // 抽象聚集角色
    function abstractCollection() {
        this.iterator = function() {
            return null;
        };
    }

    // 具体实现聚集角色公共方法
    function Collection() {
        this.array = ['XXX', 'yyy', 'ZZZ'];
    };

    Collection.prototype = abstractCollection.prototype;

    Collection.prototype.iterator = function() {
        return new Inteator(this);
    };

    Collection.prototype.size = function() {
        return this.array.length;
    };

    Collection.prototype.get = function(index) {
        return this.array[index];
    };


    function Client() {
        var colls = new Collection();
        var iterator = colls.iterator();
        while ( iterator.hasNext() ){
            console.log(iterator.get());
            iterator.next();
        }
    }
    Client();
```

参考:

[javascript 之 迭代子模式](http://www.cnblogs.com/editor/p/5672800.html)



# 观察者模式

## 定义

定义对象间的一种一对多的关系，当一个对象状态改变时 (一般称为被观察者)，依赖于该对象的对象被通知，并更新;



## 实景描述

比如说母亲通知孩子吃饭的例子，一个家里有一两个孩子，这两个小孩子有点调皮，喜欢乱跑，妈妈把饭煮好了，但是看不到小孩的身影，叫也没见小孩回应回来的，所以妈妈就在小孩身上装了个 通知设备，一到把饭煮好，妈妈就在一个通知设备上按个按钮，就可以小孩身上的设备上发出声音：‘饭煮好了，快点回来吃饭’，然后小孩就可以马上回来吃刚上桌温热的饭菜了；

## 观察者模式主要组成

 被观察对象(目标对象, 具体对象, 主题), 观察者 (订阅者, 监听者), 事件(更新方法);

## 代码实例

```js
// jQuery版
(function ($) {
    var o = $({});
    $.subscribe = function () {
        o.on.apply(o, arguments);
    };

    $.unsubscribe = function () {
        o.off.apply(o, arguments);
    };

    $.publish = function () {
        o.trigger.apply(o, arguments);
    };

} (jQuery));
```



```js
//回调函数
function handle(e, a, b, c) {
    // `e`是事件对象，不需要关注
    console.log(a + b + c);
};

//订阅
$.subscribe("/some/topic", handle);
//发布
$.publish("/some/topic", ["a", "b", "c"]); // 输出abc
        

$.unsubscribe("/some/topic", handle); // 退订

//订阅
$.subscribe("/some/topic", function (e, a, b, c) {
    console.log(a + b + c);
});

$.publish("/some/topic", ["a", "b", "c"]); // 输出abc

//退订（退订使用的是/some/topic名称，而不是回调函数哦，和版本一的例子不一样
$.unsubscribe("/some/topic"); 
```





参考:

http://www.cnblogs.com/TomXu/archive/2012/03/02/2355128.html

# 模板方法模式

## 定义

模板方法（TemplateMethod）定义了一个操作中的算法的骨架，而将一些步骤延迟到子类中。模板方法使得子类可以不改变一个算法的结构即可重定义该算法的某些特定步骤。

模板方法是一种代码复用的基本技术，在类库中尤为重要，因为他们提取了类库中的公共行为。模板方法导致一种反向的控制结构，这种结构就是传说中的“好莱坞法则”，即“别找找我们，我们找你”，这指的是父类调用一个类的操作，而不是相反。具体体现是面向对象编程编程语言里的抽象类（以及其中的抽象方法），以及继承该抽象类（和抽象方法）的子类。

## 场景描述

举个例子，泡茶和泡咖啡有同样的步骤，比如烧开水（boilWater）、冲泡（brew）、倒在杯子里（pourOnCup），加小料（addCondiments）等等。但每种饮料冲泡的方法以及所加的小料不一样，所以我们可以利用模板方法实现这个主要步骤。

## 代码实例

```js
var CaffeineBeverage = function () {

    };
    CaffeineBeverage.prototype.prepareRecipe = function () {
        this.boilWater();
        this.brew();
        this.pourOnCup();
        if (this.customerWantsCondiments()) {
            // 如果可以想加小料，就加上
            this.addCondiments();
        }
    };
    CaffeineBeverage.prototype.boilWater = function () {
        console.log("将水烧开!");
    };
    CaffeineBeverage.prototype.pourOnCup = function () {
        console.log("将饮料到再杯子里!");
    };
    CaffeineBeverage.prototype.brew = function () {
        throw new Error("该方法必须重写!");
    };
    CaffeineBeverage.prototype.addCondiments = function () {
        throw new Error("该方法必须重写!");
    };
    // 默认加上小料
    CaffeineBeverage.prototype.customerWantsCondiments = function () {
        return true;
    };

    // 冲咖啡
    var Coffee = function () {
        CaffeineBeverage.apply(this);
    };
    Coffee.prototype = new CaffeineBeverage();
    Coffee.prototype.brew = function () {
        console.log("从咖啡机想咖啡倒进去!");
    };
    Coffee.prototype.addCondiments = function () {
        console.log("添加糖和牛奶");
    };
    Coffee.prototype.customerWantsCondiments = function () {
        return confirm("你想添加糖和牛奶吗？");
    };
    


    //冲茶叶
    var Tea = function () {
        CaffeineBeverage.apply(this);
    };
    Tea.prototype = new CaffeineBeverage();
    Tea.prototype.brew = function () {
        console.log("泡茶叶!");
    };
    Tea.prototype.addCondiments = function () {
        console.log("添加柠檬!");
    };
    Tea.prototype.customerWantsCondiments = function () {
        return confirm("你想添加柠檬嘛？");
    };
```

模板方法应用于下列情况：

1. 一次性实现一个算法的不变的部分，并将可变的行为留给子类来实现
2. 各子类中公共的行为应被提取出来并集中到一个公共父类中的避免代码重复，不同之处分离为新的操作，最后，用一个钓鱼这些新操作的模板方法来替换这些不同的代码
3. 控制子类扩展，模板方法只在特定点调用“hook”操作，这样就允许在这些点进行扩展



# 适配器模式

## 定义

适配器模式（Adapter）是将一个类（对象）的接口（方法或属性）转化成客户希望的另外一个接口（方法或属性），适配器模式使得原本由于接口不兼容而不能一起工作的那些类（对象）可以一些工作。速成包装器（wrapper）。



## 代码实例

```js

var aa = {
        test:function () {
            console.log('test')
        },
        go: function () {
            console.log('go')
        }
    }
//    有一天别人要重写了你的方法
    function pp() {
        this.test = function () {
            console.log('新的 test')
        }
        this.gogo = function () {
            console.log('新的 gogo')
        }
    }

    // 这时你要修改所有的aa.xx 的调用 , 恐怕你都改乱了~~
    // 引入适配器模式
    function shipeiqi() {
        var _s = new  pp();
        var aa = {
            test: function () {
                _s.test();
            },
            go: function () {
                _s.gogo();
            }
        }
        return aa;
    }

    var aa = shipeiqi();

// 调用方式不需要修改
    aa.test();
    aa.go();
```



http://www.cnblogs.com/TomXu/archive/2012/04/11/2435452.html



# 命令模式

## 定义

用于将一个请求封装成一个对象，从而使你可用不同的请求对客户进行参数化；对请求排队或者记录请求日志，以及执行可撤销的操作。也就是说改模式旨在将函数的调用、请求和操作封装成一个单一的对象，然后对这个对象进行一系列的处理。此外，可以通过调用实现具体函数的对象来解耦命令对象与接收对象。

## 代码实例

```js
// 一个连队
    var lian = function () {

    }
    // 炮兵
    lian.paobing = function (pao_num) {
        console.log(pao_num+'正在作战')
    }
    // 步兵
    lian.bubing = function (bubing_num) {
        console.log(bubing_num+'正在作战')
    }

    // 连长
    lian.lianzhang = function (mingling) {
        lian[mingling.type](mingling.num)
    }

    // 总司令下命令
    lian.lianzhang({
        type:'paobing',
        num: 50
    });
    lian.lianzhang({
        type:'bubing',
        num: 500
    })
```

http://www.cnblogs.com/TomXu/archive/2012/03/08/2358593.html



# 策略模式

## 定义

策略模式定义了算法家族，分别封装起来，让他们之间可以互相替换，此模式让算法的变化不会影响到使用算法的客户。

策略模式 使用要注意它 "变化" 的一面，策略模式就是来解决这个 变化 问题的。

## 代码实例

比如商场买卖的价格或促销问题，如果不使用模式，就可能只是 把“所有”的情况用 if else 类似“硬编码” 的开式写在一起，或是传个传个参数，稍加点内部逻辑代码，最好就是一同写在一个类里面；

```js
 function Price(personType, price) {
        //大客户 5 折
        if (personType == 'vip') {
            return price * 0.5;
        }
        else if (personType == 'old'){ //老客户 3 折
            return price * 0.3;
        } else {
            return price; //其他都全价
        }
    }
    // 如果要扩展一种价格手段，就得在 Price 里添加新的 else if，或是修改某个算法逻辑，
    // 就得某个 if 或 else if 里修改， 这是对单个类的修改，
    // 而且这种情况势必得经常修改这个类，
    // 这违反了设计模式的一个原则：对修改关闭，对扩展开放的原则；


//    策略模式
    // vip
    function vipPrice() {
        this.discount = 0.5;
    }

    vipPrice.prototype.getPrice = function(price) {
        return price * this.discount;
    }

    // 老客户
    function oldPrice() {
        this.discount = 0.3;
    }

    oldPrice.prototype.getPrice = function(price) {
        return price * this.discount;
    }

    // 普通用户
    function Price() {
        this.discount = 1;
    }

    Price.prototype.getPrice = function(price) {
        return price ;
    }

    // 对外使用上下文
    function Context() {
        this.name = '';
        this.strategy = null;
        this.price = 0;
    }

    Context.prototype.set = function(name, strategy, price) {
        this.name = name;
        this.strategy = strategy;
        this.price = price;
    }

    Context.prototype.getResult = function() {
        console.log(this.name + ' 的结账价为: ' + this.strategy.getPrice(this.price));
    }

    // 上下文
    var context = new Context();

    //vip客户
    var vip = new vipPrice();
    context.set ('vip客户', vip, 200);
    context.getResult();

    //老客户
    var old = new oldPrice();
    context.set ('老客户', old, 200);
    context.getResult();

```



http://www.cnblogs.com/TomXu/archive/2012/03/05/2358552.html

http://www.cnblogs.com/editor/p/4272655.html



# 代理模式

顾名思义就是用一个类来代替另一个类来执行方法功能，这个模式跟装饰模式有点相似，不一样的是，代理模式是代替客户初始化被代理对象类，而装饰模式采用接口或初装饰者参数引用的方式来执行的。

在动态面向对象语言里，代理模式即起到控制修饰被代理类的作用，也对被代理类起到了充分的隐藏保护作用；被代理类只到我们需要时，才被间接初始化调用；

```js
// 房东
function Fangdong() {
    this.room = '房间名';
}
Fangdong.prototype.chuzu = function() {
    console.log('房东出租房间: ' + this.room);
}

// 中介
function Proxy() {
    this.fangdong = new Fangdong();
}

Proxy.prototype.chuzu = function() {
    this.fangdong.chuzu();
    console.log('出租后收中介费');
}

//房客请中介帮找房子;
var proxy = new Proxy();
proxy.chuzu();

```

http://www.cnblogs.com/editor/p/4185706.html













# 工厂方法模式 Factory



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

保证一个类只有一个实例.

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

![](https://ws1.sinaimg.cn/large/006tNc79ly1fmd39umi24j319u0re0x6.jpg)







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

