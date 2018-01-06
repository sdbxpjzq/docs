[TOC]

# addEventListener和attachEvent

IE:  `attachEvent`

````js
attachEvent(type, callback)
type: 事件名 如: onclick  onchange等,
callback: 事件处理程序
````



chrome: `addEventListener`

```js
addEventListener(type, callback, capture)
type: 事件名 ,没有 ' on ' 前缀, 如 click
callback: 事件处理程序
capture: 事件模型(可选参数)  true ---捕捉模型  false -- 冒泡模型(默认值)
```

## 兼容处理

```js
function bindEvent(obj,events,fn){
	if(obj.addEventListener){
	    obj.addEventListener(events,fn,false);
	}
	else{
	    obj.attachEvent('on'+events,function(){
		   fn.call(obj); // 修改 this 的指向, attachEvent下的 this  默认指向  window 对象
	     });
	}
}
bindEvent(oBtn,'click',function(){
alert(this); // oBtn
});
```



# addEventListener传参

使用`bind`. IE6,7,8不支持

bind可接受的参数都分为两部分，

第一个参数都是作为执行时函数上下文中的this的对象。

```js
function change(obj){
        console.log(obj);
}


    var aDiv=document.getElementsByTagName("div");
    for(var i=0;i<aDiv.length;i++){    MyTool.bindEvent(aDiv[i],"click",change.bind(aDiv[i],aDiv[i]));
    }
```

















