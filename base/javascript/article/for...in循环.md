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





http://www.jb51.net/article/37949.htm

