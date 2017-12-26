[TOC]



[ECMAScript 6 入门](http://es6.ruanyifeng.com/)



# ES6==>ES5

在线转换

1. Babel，[在线转换地址](https://babeljs.io/repl/#?babili=false&evaluate=true&lineWrap=false&presets=es2015,react,stage-2&targets=&browsers=&builtIns=false&debug=false&code=) 
2. Traceur，Google公司出品，[在线转换地址](http://google.github.io/traceur-compiler/demo/repl.html#)



Babel-cli

`npm install -g babel-cli`





# 展开运算符 `...`

[参考](https://segmentfault.com/a/1190000007022442)

## 函数传参

ES5写法:

```js
function myFunction(x, y, z) { }
var args = [0, 1, 2];
myFunction.apply(null, args);
```

ES6写法:

```js
function myFunction(x, y, z) { }
var args = [0, 1, 2];
myFunction(...args);
```



## 数据构造

- 两个对象连接返回新的对象

```js
let a = {aa:'aa'}
let b = {bb:'bb'}
let c = {...a,...b}
console.log(c)
// {"aa":"aa","bb":"bb"}
```

- 数组+字符串

```js
let j = ['jj']
let k = 'kk'
let l = [...j,k]
console.log(l)
// ["jj","kk"]
```







# Symbol数据类型

凡是属性名属于 Symbol 类型，就都是独一无二的，可以保证不会与其他属性名产生冲突。

```js
let s = Symbol();
typeof s; // "symbol"
```

> `Symbol`函数前不能使用`new`命令，否则会报错。这是因为生成的 Symbol 是一个原始类型的值，不是对象.



[参考](http://es6.ruanyifeng.com/#docs/symbol)



# 函数扩展

## 函数参数的默认值

ES5:

```js
function calc(x, y) {
  x = x || 0;
  y = y || 0;
  // to do with x, y
   return x+y
}
```

ES6:

```js
function calc(x = 0, y = 0) {
  // to do with x, y
  // return x/y
}
```

以下几点需要注意：

1.  定义了默认参数后，函数的length属性会减少，即有几个默认参数不包含在length的计算当中.

```js
function calc(x=0, y=0) {
  // ...
  console.log(x, y)
}
function ajax(url, async=true, dataType="JSON") {
  // ...
  console.log(url, async, dataType)
}
console.log(calc.length); // 0
console.log(ajax.length); // 1
```

2. 不能用`let`和`const`再次声明默认值，`var`可以

```js
function ajax(url="../user.action", async=true, success) {
  var url = ''; // 允许
  let async = 3; // 报错
  const success = function(){}; // 报错
}

```

3. 默认参数可以不是一个值类型，它可以是一个函数调用

```js
例如，利用这个特性可以强制指定某参数必须传，不传就报错
function throwIf() {
  throw new Error('少传了参数');
}
 
function ajax(url=throwIf(), async=true, success) {
  return url;
}
ajax(); // Error: 少传了参数

```













# Generator 函数

从语法上，首先可以把它理解成，Generator 函数是一个状态机，封装了多个内部状态。

形式上，Generator 函数是一个普通函数，但是有两个特征。

- `function`关键字与函数名之间有一个星号(`*`)
- 函数体内部使用`yield`表达式，定义不同的内部状态（`yield`在英语里的意思就是“产出”）

```js
function* helloWorldGenerator() {
  yield 'hello';
  yield 'world';
  return 'ending';
}

var hw = helloWorldGenerator();
```

Generator 函数的调用方法与普通函数一样，也是在函数名后面加上一对圆括号。不同的是，调用 Generator 函数后，该函数并不执行，返回的也不是函数运行结果，而是一个指向内部状态的指针对象.

必须调用遍历器对象的`next`方法，使得指针移向下一个状态。也就是说，每次调用`next`方法，内部指针就从函数头部或上一次停下来的地方开始执行，直到遇到下一个`yield`表达式（或`return`语句）为止。

换言之，Generator 函数是分段执行的，`yield`表达式是暂停执行的标记，而`next`方法可以恢复执行.

```js
hw.next()
// { value: 'hello', done: false }

hw.next()
// { value: 'world', done: false }

hw.next()
// { value: 'ending', done: true }

hw.next()
// { value: undefined, done: true }
```

每次调用遍历器对象的`next`方法，就会返回一个有着`value`和`done`两个属性的对象。`value`属性表示当前的内部状态的值，是`yield`表达式后面那个表达式的值；`done`属性是一个布尔值，表示是否遍历结束。



## yield 表达式

`yield`表达式就是暂停标志.

遍历器对象的`next`方法的运行逻辑如下。

（1）遇到`yield`表达式，就暂停执行后面的操作，并将紧跟在`yield`后面的那个表达式的值，作为返回的对象的`value`属性值。

（2）下一次调用`next`方法时，再继续往下执行，直到遇到下一个`yield`表达式。

（3）如果没有再遇到新的`yield`表达式，就一直运行到函数结束，直到`return`语句为止，并将`return`语句后面的表达式的值，作为返回的对象的`value`属性值。

（4）如果该函数没有`return`语句，则返回的对象的`value`属性值为`undefined`。







# async/await 

async 函数是什么？一句话，它就是 Generator 函数的语法糖。

```
let foo = await getFoo();
let bar = await getBar();
```

`getFoo`和`getBar`是两个独立的异步操作（即互不依赖），被写成继发关系。这样比较耗时，因为只有`getFoo`完成以后，才会执行`getBar`，完全可以让它们同时触发。

```
// 写法一
let [foo, bar] = await Promise.all([getFoo(), getBar()]);

// 写法二
let fooPromise = getFoo();
let barPromise = getBar();
let foo = await fooPromise;
let bar = await barPromise;
```

上面两种写法，`getFoo`和`getBar`都是同时触发，这样就会缩短程序的执行时间。



[参考](http://es6.ruanyifeng.com/#docs/async)



# class

- 类的数据类型就是函数，类本身就指向构造函数。
- 前面不需要加上`function`这个关键字，直接把函数定义放进去了就可以了
- 方法之间不需要逗号分隔，加了会报错
- `constructor`方法是类的默认方法，通过`new`命令生成对象实例时，自动调用该方法。一个类必须有`constructor`方法，如果没有显式定义，一个空的`constructor`方法会被默认添加。
- 类必须使用`new`调用，否则会报错。

```js
class Bar {
  constructor() {
      // 构造方法
  }
  
  doStuff() {
    console.log('stuff');
  }
  hello() {
    console.log('hello');
  }
}

var b = new Bar();
b.doStuff() // "stuff"

typeof Bar // "function"
Bar === Bar.prototype.constructor // true
```

## constructor 方法

```js
class Point {
}

// 等同于
class Point {
  constructor() {}
}
```

## 私有方法

- 在命名上加以区别 , 添加`_`下划线

```js
class Widget {

  // 公有方法
  foo (baz) {
    this._bar(baz);
  }

  // 私有方法
  _bar(baz) {
    return this.snaf = baz;
  }

  // ...
}
```

- 将私有方法移出模块

```js
class Widget {
  foo (baz) {
    bar.call(this, baz);
  }

  // ...
}

function bar(baz) {
  return this.snaf = baz;
}
```

- 利用`Symbol`值的唯一性，将私有方法的名字命名为一个`Symbol`值

```js
const bar = Symbol('bar');
const snaf = Symbol('snaf');

export default class myClass{

  // 公有方法
  foo(baz) {
    this[bar](baz);
  }

  // 私有方法
  [bar](baz) {
    return this[snaf] = baz;
  }

  // ...
};
```



## 私有属性和私有方法

在属性名和方法名之前，使用`#`表示.

```js
class Point {
  #x;

  constructor(x = 0) {
    #x = +x; // 写成 this.#x 亦可
  }

  get x() { return #x }
  set x(value) { #x = +value }
}
```



## 静态方法

如果在一个方法前，加上`static`关键字，就表示该方法不会被实例继承，而是直接通过类来调用，这就称为“静态方法”。

```js
class Foo {
  static classMethod() {
    return 'hello';
  }
}

Foo.classMethod() // 'hello'
```



## 静态属性

ES6中可以定义静态方法，但是不能直接定义静态属性（ES7已经提了关于静态属性语法的草案）.

- ### 在类定义完毕之后赋值

```js
class DB {
 static initPool () {
   return DB.msg;
 }
}
DB.msg = 'hello world';
```

- ### 使用ES7最新的静态属性语法（目前还是草案，但可用babel编译）

```js
class DB {
  static msg = 'hello world';
 static initPool () {
   return DB.msg;
 }
}
```

- ### 使用静态getter

```js
class DB {
    static get pool () {
        return DB.initPool()
    }
    static initPool () {
        return 'hello world';
    }
}
```



[参考](http://es6.ruanyifeng.com/#docs/class)



# Promise

http://www.jianshu.com/p/063f7e490e9a

https://juejin.im/entry/59afb90c5188252444428536?utm_source=gold_browser_extension

## 为什么去使用Promise?

通常我们写一个ajax去实现.

```js
// 简单的ajax原生实现
var url = 'https://hq.tigerbrokers.com/fundamental/finance_calendar/getType/2017-02-26/2017-06-10';
var result;

var XHR = new XMLHttpRequest();
XHR.open('GET', url, true);
XHR.send();

XHR.onreadystatechange = function() {
    if (XHR.readyState == 4 && XHR.status == 200) {
        result = XHR.response;
        console.log(result);
    }
}
```

在ajax的原生实现中，利用了onreadystatechange事件，当该事件触发并且符合一定条件时，才能拿到我们想要的数据，之后我们才能开始处理数据.

这样做看上去并没有什么麻烦，但是如果这个时候，我们还需要做另外一个ajax请求，这个新的ajax请求的其中一个参数，得从上一个ajax请求中获取，这个时候我们就不得不如下这样做：

```js
var url = 'https://hq.tigerbrokers.com/fundamental/finance_calendar/getType/2017-02-26/2017-06-10';
var result;

var XHR = new XMLHttpRequest();
XHR.open('GET', url, true);
XHR.send();

XHR.onreadystatechange = function() {
    if (XHR.readyState == 4 && XHR.status == 200) {
        result = XHR.response;
        console.log(result);

        //  参数依赖上次的返回值
        var url2 = 'http:xxx.yyy.com/zzz?ddd=' + result.someParams;
        var XHR2 = new XMLHttpRequest();
        XHR2.open('GET', url, true);
        XHR2.send();
        XHR2.onreadystatechange = function() {
            ...
        }
    }
}
```

当出现第三个ajax(甚至更多)仍然依赖上一个请求的时候，我们的代码就变成了一场灾难。这场灾难，往往也被称为**回调地狱**。

因此我们需要一个叫做Promise的东西.



```js
function want() {
    console.log('这是你想要执行的代码');
}

function fn(want) {
    console.log('这里表示执行了一大堆各种代码');

    // 返回Promise对象
    return new Promise(function(resolve, reject) {
        if (typeof want == 'function') {
            resolve(want); // 修改为resolved状态
        } else {
            reject('TypeError: '+ want +'不是一个函数') // 修改为rejected状态
        }
    })
}

fn(want).then(function(want) {
    want();
})

fn('1234').catch(function(err) {
    console.log(err);
})
```

## Promise三种状态

- **`pending`**: 等待中，或者进行中，表示还没有得到结果
- **`resolved`**(`Fulfilled`): 已经完成，表示得到了我们想要的结果，可以继续往下执行
- **`rejected`**: 也表示得到结果，但是由于结果并非我们所愿，因此拒绝执行

这三种状态不受外界影响，而且状态只能从`pending`改变为`resolved`或者`rejected`，**并且不可逆**。在`Promise`对象的构造函数中，将一个函数作为第一个参数。而这个函数，就是用来处理Promise的状态变化。



## Promise的then方法

`Promise`对象中的`then`方法，可以接收构造函数中处理的状态变化，并分别对应执行.

```js
function fn(num) {
    return new Promise(function(resolve, reject) {
        if (typeof num == 'number') {
            resolve();
        } else {
            reject();
        }
    }).then(function() {
        console.log('参数是一个number值');
    }, function() {
        console.log('参数不是一个number值');
    })
}

fn('hahha');
fn(1234);
```

`then`方法的执行结果也会返回一个`Promise`对象。因此我们可以进行`then`的`链式执行`，这也是解决回调地狱的主要方式。

```js
function fn(num) {
    return new Promise(function(resolve, reject) {
        if (typeof num == 'number') {
            resolve();
        } else {
            reject();
        }
    })
    .then(function() {
        console.log('参数是一个number值');
    })
    .then(null, function() {
        console.log('参数不是一个number值');
    })
}

fn('hahha');
fn(1234);
```



写一个例子大家领悟:

```js
var fn = function(num) {
    return new Promise(function(resolve, reject) {
        if (typeof num == 'number') {
            resolve(num);
        } else {
            reject('TypeError');
        }
    })
}

fn(2).then(function(num) {
    console.log('first: ' + num);
    return num + 1;
})
.then(function(num) {
    console.log('second: ' + num);
    return num + 1;
})
.then(function(num) {
    console.log('third: ' + num);
    return num + 1;
});

// 输出结果
first: 2
second: 3
third: 4
```



上面提到的ajax请求可以这么实现:

```js
var url = 'https://hq.tigerbrokers.com/fundamental/finance_calendar/getType/2017-02-26/2017-06-10';

// 封装一个get请求的方法
function getJSON(url) {
    return new Promise(function(resolve, reject) {
        var XHR = new XMLHttpRequest();
        XHR.open('GET', url, true);
        XHR.send();

        XHR.onreadystatechange = function() {
            if (XHR.readyState == 4) {
                if (XHR.status == 200) {
                    try {
                        var response = JSON.parse(XHR.responseText);
                        resolve(response);
                    } catch (e) {
                        reject(e);
                    }
                } else {
                    reject(new Error(XHR.statusText));
                }
            }
        }
    })
}

getJSON(url).then(resp => console.log(resp));
```

## Promise.all

当有一个`ajax`请求，它的参数需要另外2个甚至更多请求都有返回结果之后才能确定，那么这个时候，就需要用到`Promise.all`来帮助我们应对这个场景.



`Promise.all`接收一个`Promise对象`组成的数组作为参数，当这个数组所有的`Promise`对象状态都变成`resolved`或者`rejected`的时候，它才会去调用`then`方法。

```js
var url = 'https://hq.tigerbrokers.com/fundamental/finance_calendar/getType/2017-02-26/2017-06-10';
var url1 = 'https://hq.tigerbrokers.com/fundamental/finance_calendar/getType/2017-03-26/2017-06-10';

function renderAll() {
    return Promise.all([getJSON(url), getJSON(url1)]); // 数组参数
}

renderAll().then(function(value) {
    // 建议大家在浏览器中看看这里的value值
    console.log(value);
})
```



## Promise.race

与`Promise.all`相似的是，`Promise.race`都是以一个`Promise`对象组成的数组作为参数，不同的是，只要当数组中的**其中一个**`Promsie`状态变成`resolved`或者`rejected`时，就可以调用`.then`方法了

```js
function renderRace() {
    return Promise.race([getJSON(url), getJSON(url1)]);
}

renderRace().then(function(value) {
    console.log(value);
})
```









# export

https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Statements/export

2种常见形式

```js
// 定义一个混合对象
const myMixin = {
    created: function () {
      console.log('created mixin')
    },
    methods: {
        miXinsHello: function () {
            console.log('hello from miXinsHello!')
        }
    }
}
const yaoyao = {
    methods: {
        yaoyao: function () {
            console.log('hello from yaoyao!')
        }
    }
}

// export default myMixin
export { myMixin,yaoyao}
```

