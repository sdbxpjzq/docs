[TOC]

# js自执行函数

## 三种自执行函数

```js
;(function(){ // ; 主要是应对代码合并压缩时，由于缺少分号；带来的错误
    //代码1
})();

;(function(){ // ; 主要是应对代码合并压缩时，由于缺少分号；带来的错误
  //代码2
}());

!function(){
    //代码3
}();
```

>  (function(){})(),(function(){})是一个表达式，会强制其理解成函数直接量方式，也就是表达式方式创建函数，(function(){})它会返回函数对象的引用，最后使用小括号()调用此函数。



> (function(){}())，如果不用外面包裹的小括号，{}就会理解为复合语句，那么function(){}就被理解为函数声明，但是没有标识符，所以会报错，使用小括号以后，就会变成表达式，也会被理解为直接量方式。



> !function(){}()，原理同上,!也是一个运算符，所以在原理同上。还可以有其他运算符。
>
> 所以只要通过运算符将语句改成了该表达式，不管这是个什么样的表达式< (,),-,+, >,~，都会先返回函数体的引用，然后再执行其他操作



## 关于前面的`;`说明

```js
(function(){alert("1")})()
(function(){alert("2")})()
```

结果:

第一句正常执行,

第二句,`Uncaught TypeError: (intermediate value)(...) is not a function`

```js
(function(){alert("1")})();
(function(){alert("2")})()
```

结果:

全部顺利执行



> 这里主要是由于JS拥有ASI（自动分号插入）机制而隐藏的问题。











