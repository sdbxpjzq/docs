[TOC]

# Object.defineProperty

**Object.defineProperty** ，顾名思义，**为对象定义属性**。在js中我们可以通过下面这几种方法定义属性.

```js
// (1) define someOne property name
someOne.name = 'cover';
//or use (2) 
someOne['name'] = 'cover';
// or use (3) defineProperty
Object.defineProperty(someOne, 'name', {
    value : 'cover'
})
```

从上面看，貌似使用Object.defineProperty很麻烦，那为啥存在这样的方法呢？

带着疑问，我们来看下 Object.defineProperty的定义。

## 基础知识

`Object.defineProperty(object, propertyname, descriptor)`

- **object** 必需。 要在其上添加或修改属性的对象。 这可能是一个本机 JavaScript对象（即用户定义的对象或内置对象）或 DOM 对象。
- **propertyname** 必需。 一个包含属性名称的字符串。
- **descriptor** 必需。 属性描述符。 它可以针对数据属性或访问器属性。

其中**descriptor**的参数值得我们关注下,该属性可设置的值有：

- 【value】 属性的值，默认为 undefined。
- 【writable】 该属性是否可写，如果设置成 false，则任何对该属性改写的操作都无效（但不会报错），对于像前面例子中直接在对象上定义的属性，这个属性该特性默认值为为 true。

```js
var someOne = { };
Object.defineProperty(someOne, "name", {
    value:"coverguo" , //由于设定了writable属性为false 导致这个量不可以修改
    writable: false 
});  
console.log(someOne.name); // 输出 coverguo
someOne.name = "linkzhu";
console.log(someOne.name); // 输出coverguo
```

- [configurable]  如果为false，则任何尝试删除目标属性或修改属性以下特性（writable, configurable, enumerable）的行为将被无效化，对于像前面例子中直接在对象上定义的属性，这个属性该特性默认值为为 true。 

```js
var someOne = { };
Object.defineProperty(someOne, "name", {
    value:"coverguo" ,
    configurable: false 
});  
delete someOne.name; 
console.log(someOne.name);// 输出 coverguo
someOne.name = "linkzhu";
console.log(someOne.name); // 输出coverguo
```

- 【enumerable】 是否能在for-in循环中遍历出来或在Object.keys中列举出来。对于像前面例子中直接在对象上定义的属性，这个属性该特性默认值为为 true。

**注意** 在调用Object.defineProperty()方法时，如果不指定， configurable， enumerable， writable特性的默认值都是false,这跟之前所 说的`对于像前面例子中直接在对象上定义的属性，这个特性默认值为为 true。`并不冲突，如下代码所示：

```js
//调用Object.defineProperty()方法时，如果不指定
var someOne = { };
someOne.name = 'coverguo';
console.log(Object.getOwnPropertyDescriptor(someOne, 'name'));
//输出 Object {value: "coverguo", writable: true, enumerable: true, configurable: true}

//直接在对象上定义的属性，这个特性默认值为为 true
var otherOne = {};
Object.defineProperty(otherOne, "name", {
    value:"coverguo" 
});  
console.log(Object.getOwnPropertyDescriptor(otherOne, 'name'));
//输出 Object {value: "coverguo", writable: false, enumerable: false, configurable: false}
```

- 【get】一旦目标对象访问该属性，就会调用这个方法，并返回结果。默认为 undefined。
- 【set】 一旦目标对象设置该属性，就会调用这个方法。默认为 undefined。

从上面，可以得知，我们可以通过使用Object.defineProperty，来定义和控制一些**特殊的属性**，如属性是否可读，属性是否可枚举，甚至修改属性的修改器（setter）和获取器(getter).

## 优化对象获取和修改属性方式

```js
//加入有一个目标节点， 我们想设置其位移时是这样的
var targetDom = document.getElementById('target');
var transformText = 'translateX(' + 10 + 'px)';
targetDom.style.webkitTransform = transformText;
targetDom.style.transform = transformText;
```

通过上面，可以看到如果页面是需要许多动画时，我们这样编写transform属性是十分蛋疼的。(┬＿┬)

但如果通过Object.defineProperty， 我们则可以

```js
//这里只是简单设置下translateX的属性，其他如scale等属性可自己去尝试

Object.defineProperty(dom, 'translateX', {
set: function(value) {
         var transformText = 'translateX(' + value + 'px)';
        dom.style.webkitTransform = transformText;
        dom.style.transform = transformText;
}
//这样再后面调用的时候, 十分简单
dom.translateX = 10;
dom.translateX = -10;
//甚至可以拓展设置如scale, originX, translateZ,等各个属性，达到下面的效果
dom.scale = 1.5;  //放大1.5倍
dom.originX = 5;  //设置中心点X
}
```



## 简单实现视图和数据变化绑定

```html
<div>
    <p>你好，<span id='nickName'></span></p>
    <div id="introduce"></div>
  <input type="text" id='inputDom'/>
</div>　
```

```js
//视图控制器
var userInfo = {};
Object.defineProperty(userInfo, "nickName", {
    get: function(){
        return document.getElementById('nickName').innerHTML;
    },
    set: function(nick){
        document.getElementById('nickName').innerHTML = nick;
    }
});
Object.defineProperty(userInfo, "introduce", {
    get: function(){
        return document.getElementById('introduce').innerHTML;
    },
    set: function(introduce){
        document.getElementById('introduce').innerHTML = introduce;
    }
})

```

然后就能愉快地绑定数据交互了.

```js
userInfo.nickName = "xxx";
userInfo.introduce = "我是xxx，..."
$('#inputDom').on('keyup',funtion(){
      userInfo.nickName = this.value();
});
```
# 参考
https://juejin.im/entry/59116fa6a0bb9f0058aaaa4c
https://juejin.im/entry/5923973da22b9d005893805a
https://github.com/DMQ/mvvm