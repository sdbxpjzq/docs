[TOC]

# js类型检测

js中有7种类型:

`Boolean`、`Null`、`Undefined`、`Number`、`String`、`Symbol (ECMAScript 6 新定义)`和`Object`

## typeof

```js
typeof(function)  // function
typeof(undefined)  // undefined
typeof(null) // object
typeof([1,23]) // object
typeof({a:'hello'}) // object
typeof (/\d/) // object
typeof(1) // number
typeof('hello') // string
typeof(false) // boolean

```



## toString.call(obj)

可以通过使用`toString.call(obj)`来检测对象类型。

```js
/ Numbers 都返回[object Number]
toString.call(37);
toString.call(3.14);
toString.call(Math.LN2);
toString.call(Infinity);
toString.call(Number(1));

// Strings 都返回[object String]
toString.call("");
toString.call("bla");
toString.call(String("abc"));

// Booleans 都返回[object Boolean]
toString.call(true);
toString.call(false);
toString.call(Boolean(true));

// Symbols 都返回[object Symbol]
toString.call(Symbol());
toString.call(Symbol('foo'));
toString.call(Symbol.iterator);

// Undefined 都返回[object Undefined]
toString.call(undefined);
//toString.call(blabla);//不同 一个未定义的变量会报错

// Objects
toString.call({a:1});//[object Object]
toString.call([1, 2, 4]);//[object Array] 不同
toString.call(new Date());//[object Date] 不同
toString.call(new Boolean(true));//[object Boolean] 不同
toString.call(new Number(1));//[object Number] 不同
toString.call(new String("abc"));//[object String] 不同
toString.call(null);//[object Null] 不同
toString.call(/s/);//[object RegExp] 不同
toString.call(new TypeError());//[object Error] 不同

// 函数 都返回[object Function]
toString.call(function(){});
toString.call(Math.sin);
```

封装一个方法:

```js
function myType_01(obj) {
        if (obj == null) {
            console.log(obj + "") ;
        }
       let i = 0,
           aType = ["Boolean", "Number", "String", "Function", "Array", "Date", "RegExp", "Object", "Error", "Symbol"];
       for (;i<aType.length;i++){
           if (toString.call(obj) === "[object " + aType[i] + "]"){
               console.log(aType[i]);
               break;
           }
       }
    }


myType_01([1,23]);
myType_01(111);
myType_01('2232');
myType_01(null);
myType_01(undefined);

```

## instanceof

[instanceof](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Operators/instanceof) 运算符可以用来判断某个`构造函数`的 [prototype](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/prototype) 属性是否存在另外一个要检测对象的原型链上，返回boolean值. 

简单的说: `a instanceof A` — `a` 是否是`A`的实例.

JavaScript instanceof 运算符代码:

```js
function instance_of(L, R) {//L 表示左表达式，R 表示右表达式
  var O = R.prototype;// 取 R 的显示原型
  L = L.__proto__;// 取 L 的隐式原型
  while (true) { 
    if (L === null) 
      return false; 
    if (O === L)// 这里重点：当 O 严格等于 L 时，返回 true 
      return true; 
    L = L.__proto__; 
  } 
 }
```

基本用法:

```js
function Foo(){} 
var foo = new Foo(); 
console.log(foo instanceof Foo)//true

console.log([1,2,4] instanceof Array)//true
```

在继承中关系中的用法:

```js
// 判断 foo 是否是 Foo 类的实例 , 并且是否是其父类型的实例
function Aoo(){} 
function Foo(){} 
Foo.prototype = new Aoo();//JavaScript 原型继承


var foo = new Foo(); 
console.log(foo instanceof Object)//true 
console.log(foo instanceof Foo)//true 
console.log(foo instanceof Aoo)//true
```

在多层继承关系中，instanceof 运算符同样适用。



## constructor

[constructor](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/constructor)返回一个指向创建了该对象原型的函数引用。

对象的`constructor`属性是根据函数的`prototype.constructor`来的。

```js
function C(){} 
function D(){} 
D.prototype = new C(); // 继承
var o = new D();
o instanceof D; // true
o instanceof C; // true
o.constructor == D; // false
o.constructor == C; // true
o.constructor == D.prototype.constructor;//true
o.constructor == Object.prototype.constructor;// false
```







