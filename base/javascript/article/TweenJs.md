[TOC]



[文档](http://www.createjs.cc/src/docs/tweenjs/modules/TweenJS.html)

# TweenJS：用于做动画效果

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

