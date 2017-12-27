[TOC]



[文档](http://www.createjs.cc/src/docs/tweenjs/modules/TweenJS.html)

# TweenJS：用于做动画效果

设置一个Tween，你需要调用Tween(target, [props], [pluginData]构建器，参数如下：

- target - 调整属性的对象

- props - 相关属性的配置，例如({loop:true, paused:true})， 所有属性缺省为false。支持的属性如下：

- - loop: 设置循环
  - useTicks: 使用ticks来设置持续而不使用毫秒
  - ignoreGlobalPause: 设置忽略全局暂停
  - override: 如果为true，Tween.removeTweens(target) 将会被调用来移除其他同一个对象上的tween
  - paused: 设置是否启动暂停的tween
  - position: 设置出示的tween位置
  - onChange: specifies a listener for the "change" event.

- pluginData - 一个包含安装插件数据的对象

Tween类针对一个对象设置tween相关属性。实例方法可以被链式操作，方便编辑序列。这是一个简单但是强大的类

- to(pros.duration,ease)方法，针对目标属性队列一个tween从初始值到当前值，设置duration为0则立刻跳到指定值。数字类型的值，会从目前值调整到设置的值。而非数字属性则会在持续时间结束时被设置
- wait(duration,passive) 队列一个等待（一个空的tween）
- call(callback,params,scope) 队列一个指定方法的调用

TweenJS 支持大量的ease（缓动），由Ease类定义

```js
var canvas = document.querySelector('#canvas');
    //创建舞台
var stage = new createjs.Stage(canvas);

//用于做动画效果
var tween = createjs.Tween;
createjs.Ticker.addEventListener("tick", stage);
createjs.Ticker.setFPS(60);

var text1 = new createjs.Text("❆","30px Arial", "#000");
    text1.x = 100;
    text1.y = 100;
var text2 = new createjs.Text("❆","30px Arial", "#000");
    text2.x = 100;
    text2.y = 50;

tween.get(text2).to({x:300,y:200}, 1000).call(function () {
    console.log('text2移动完成')
 });
tween.get(text).to({x:0,y:0}, 1000).call(function () {
    console.log('text移动完成')
});
```

代码实例:

```html
<canvas id="myCanvas" width="350" height="420"></canvas>
```

```js

var canvas = document.getElementById('myCanvas'),
    stage = new createjs.Stage(canvas);
    
var stageWidth = canvas.width;
var stageHeight = canvas.height;

var characterWidth = 75;
var characterHeight = 96;

var spritesheet; 
var charactor;

window.onload = function(){
  
  spritesheet = new createjs.SpriteSheet({
    'images': ['http://cdn.gbtags.com/gblibraryassets/libid108/charactor.png'],
    'frames': {"height": 96, "count": 10, "width": 75}
  });
  
  charactor  = new createjs.Sprite(spritesheet);
  charactor.x = (stageWidth - characterWidth)/2;
  charactor.y = (stageHeight - characterHeight)/2;
  
  stage.addChild(charactor);
  
  charactor.play();
  
  /*
   *  以下代码生成了tween动画人物相关效果
   */
  
  // 生成上下移动人物效果（一次性）
  createjs.Tween.get(charactor, {loop:false})
      .to({y:150}, 500, createjs.Ease.quadInOut)
      .to({y:50}, 500, createjs.Ease.quadInOut);
      
  // 生成人物左右移动效果（无限循环）
  createjs.Tween.get(charactor, {loop:true})
      .wait(3000)
      .call(charactor.gotoAndStop, [5], charactor) 
      .wait(300)
      .to({x:450}, 1200, createjs.Ease.backInOut) 
      .call(charactor.gotoAndStop, [0], charactor)
      .wait(2000)
      .call(charactor.gotoAndStop, [5], charactor)
      .wait(300)
      .to({x:(stageWidth - characterWidth)/2}, 500, createjs.Ease.backInOut)
      .call(charactor.gotoAndStop, [0], charactor);

  
  createjs.Ticker.setFPS(35);
  createjs.Ticker.addEventListener("tick", tick);
  
  function tick(){
    stage.update();
  }
};


```



