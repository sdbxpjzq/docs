[TOC]

# for…in循环

## 增加`hasOwnProperty`判断

在 `for in` 循环时，建议增加 `hasOwnProperty` 进行判断，可以有效避免扩展本地原型而引起的错误.

`for in` 在循环对象的属性时也会遍历原型链，`for in` 不会读取不可枚举属性，如数组的length属性。

```js
Object.prototype.bar = 1; 
var foo = {moo: 2}; 
for(var i in foo) { 
console.log(i); // 输出 bar 和 moo 
} 
```

改进版本:

```js
Object.prototype.bar = 1; 
var foo = {moo: 2}; 
for (var i in foo) { 
if (foo.hasOwnProperty(i)) { 
  	console.log(i);  // moo
	} 
} 
```



## 巧用 in 操作

```js
function InFun() {
        let value = 'c';
        if (value == "a" || value == "b" || value == "c") {
            console.log('我是 ||');
        }
//替换为
        if (value in {"a":"", "b":"", "c":""}) {
            console.log('我是 in');
        }
    }
InFun();

```



# for…of

1. 推荐在循环对象属性的时候，使用`for...in`,在遍历数组的时候的时候使用`for...of`。
2. `for...in`循环出的是key，`for...of`循环出的是value
3. 注意，`for...of`是ES6新引入的特性。修复了ES5引入的`for...in`的不足
4. `for...of`不能循环普通的对象，需要通过和`Object.keys()`搭配使用



## 栗子

我们要遍历一个数组`let aArray = ['a',123,{a:'1',b:'2'}]`

使用`for...in`循环：

```js
for(let index in aArray){
    console.log(aArray[index]);
}
```

使用`for...of`循环：

```js
for(var value of aArray){
    console.log(value);
}

```

咋一看好像好像只是写法不一样而已，那为什么说`for...of`修复了`for...in`的缺陷和不足。

## 不同

假设我们往数组添加一个属性name:
`aArray.name = 'demo'`,再分别查看上面写的两个循环：

```js
for(let index in aArray){
    console.log(`${aArray[index]}`); //Notice!!aArray.name也被循环出来了
}
for(var value of aArray){
    console.log(value); // aArray.name没有遍历出来
}
```

所以说，作用于数组的`for-in`循环除了遍历数组元素以外,还会遍历自定义属性。

`for...of`循环不会循环对象的key，只会循环出数组的value，因此`for...of`不能循环遍历**普通对象**,对普通对象的属性遍历推荐使用`for...in`

如果实在想用`for...of`来遍历普通对象的属性的话，可以通过和`Object.keys()`搭配使用，先获取对象的所有key的数组
然后遍历：

```js
var student={
    name:'wujunchuan',
    age:22,
    locate:{
    country:'china',
    city:'xiamen',
    school:'XMUT'
    }
}
for(var key of Object.keys(student)){
    //使用Object.keys()方法获取对象key的数组
    console.log(key+": "+student[key]);
}
```







http://www.jb51.net/article/37949.htm

