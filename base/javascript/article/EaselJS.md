[TOC]



https://aotu.io/notes/2017/07/19/createjs/index.html

# EaselJS

用于 Sprites 、动画、向量和位图的绘制

 EaselJS 的常用 API

- 画图片用 (Bitmap)
- 画图形，比如矩形，圆形等用 (Shape) 【类似于改变坐标x，y，增加阴影 Shadow ，透明度 Alpha ，缩小放大 ScaleX/ScaleY 都可以做到】
- 画文字，用 (Text)
- 还有容器 Container 的概念，容器可以包含多个显示对象

##  EaselJS 绘图的大致流程

**创建显示对象→设置一些参数→调用方法绘制→添加到舞台→ update() **

```js
var canvas = document.querySelector('#canvas');
//创建舞台
var stage = new createjs.Stage(canvas);
//创建一个Shape对象，此处也可以创建文字Text,创建图片Bitmap
var rect = new createjs.Shape();
//用画笔设置颜色，调用方法画矩形，矩形参数：x,y,w,h
rect.graphics.beginFill("#f00").drawRect(0, 0, 100, 100);
//添加到舞台
stage.addChild(rect);
//刷新舞台
stage.update();
```

graphics 可以设置一些样式，线条宽度，颜色等等，也可以调用一些方法绘制图形，比如矩形 drawRect ，圆形 drawCircle 等等，具体可以自己查看 API。

>  **注意：以上的步骤每一步都要有，否则页面不会有绘制的物体。**



# Tick 事件

对于有频繁发生改变的物体，如果在每一处变化都刷新舞台的话，代码会比较冗余，因此我们可以写一个 Tick 事件，在每一次 Tick 的时候 update 舞台。

```js
createjs.Ticker.addEventListener(“tick”, tick);
function tick(e) {
    if (e.paused !== 1) {
        //处理
        stage.update();  //刷新舞台
    }else {}
}
createjs.Ticker.paused = 1;  //在函数任何地方调用这个，则会暂停tick里面的处理
createjs.Ticker.paused = 0;  //恢复游戏
```

在暂停的时候，页面仍会触发 Tick 事件，如果需要完全移除 Tick 事件，则使用

```js
createjs.Ticker.removeEventListener("tick", tick);
```

## Ticker 帧频率

上面说的 Tick 事件，每一次触发的频率是可以修改的。理想的帧频率是 60FPS。

```js
createjs.Ticker.setFPS(60);
```



# CreateJS 的渲染模式

CreateJs 提供了两种渲染模式，一种是用 setTimeout ，一种是用 requestAnimationFrame ，默认是 setTimeout ，默认的帧数是 20 ，一般的话还没有什么区别，但是如果动画多的话，设置成 requestAnimationFrame 模式的话，就会感觉到动画如丝般的流畅。

```js
createjs.Ticker.timingMode = createjs.Ticker.RAF;
```



# CreateJS 事件

EaselJS 事件默认是不支持 Touch 设备的，需要以下代码才支持：

```js
createjs.Touch.enable(stage);
```

对于 Bitmap， Shape 等对象，都可以直接使用 `addEventListener` 进行事件监听。

```js
bitmap = new createjs.Bitmap('');
bitmap.addEventListener（‘click’，handle）;
```

# 优化对所绘制物体的控制能力

## 控制多个显示对象的层级关系

Stage ， Container 对象有个 Children 属性代表子元素，是一个数组，里面的元素层级像下标一样从 0 开始，简单来说就是后面的覆盖前面的（类似于z-index）,后 addChild 的对象则在数组的后面。
我们也可以动态改变 Children 的层叠效果。

```js
obj.parent.setChildIndex(obj, n);  //n为设置的层级
```

## 利用容器 Container

它可以包含 Text 、 Bitmap 、 Shape 、 Sprite 等其他的 EaselJS 元素，包含在一个 Container 中方便统一管理。
比如一辆汽车由汽车本身，气泡提示，加速效果，减速效果组成，我们可以将这几个部分放在同一个 Container 中，统一移动。使用方法也比较简单：

```js
var contain = new createjs.Container();
contain.addChild(bgImg);
contain.addChild(bitmap);
stage.addChild(contain);
```

我们在后期会频繁对这个 Container 里面的元素进行操作，比如展示加速效果，取消展示减速效果。那我们可以给这些元素设置name属性，之后可以直接使用 getChildByName 获取到该对象。

```js
bitmap.name = ‘quick’; //设置name值
quick = this.stage.getChildByName(“quick”);  //使用name值方便获取到该对象
quick.visible = true; //显示该效果
```

# 绘制图像并对图像进行操作

## 绘制图片

```js
var bg = new createjs.Bitmap("./background.png");
stage.addChild(bg);
stage.update();
```

按照上面的 EaselJS 的正常的绘制流程来说，上面这段代码应该可以正常显示。但是，只是有些情况下可以正常显示的，这个图像资源需要确定加载成功后才可以 new ，否则不会有图像在画布上，如果有做资源预加载，可以直接使用上面的代码，如果没有，则需要在 Image 加载完成 Onload 之后才进行绘制。

```js
var img = new Image();
img.src = './img/linkgame_pass@2x.png';
img.onload = function () {
 var bg = new createjs.Bitmap("./background.png");
 stage.addChild(bg);
 stage.update();
}
```

仅仅绘制图片是不够的， CreateJS 提供了几种处理图片的方法：

## 给图片增加遮罩层

使用 mask 属性，可以只显示图片和 shape 相交的区域

```js
stage = new createjs.Stage("gameView");
bg = new createjs.Bitmap("./img/linkgame_pass@2x.png");
bg.x = 10;
bg.y = 10;
//遮罩图形
shape = new createjs.Shape();
shape.graphics.beginFill("#000").drawCircle(0, 0, 100);
shape.x = 200;
shape.y = 100;
bg.mask = shape;     //给图片bg添加遮罩
stage.addChild(shape);
stage.addChild(bg);
stage.update();
```

常用应用场景：用来剪裁图片，比如显示圆形的图片等

## 给图片增加滤镜效果

```js
var blur = new createjs.BlurFilter(5,5,1);
bg.filters = [blur];
```

我们发现，图片还是没有变模糊，原因是图片添加了 Filter 后 Stage 立即刷新， Filter 只能保持一帧的效果，第二帧 Filter 则失效了。而使用图片的 cache() 方法后，可以使得无论舞台怎么刷新，都可以保持住 Filter 的效果，添加 cache 还有很多作用，可以提高 FPS ，缓存等

```js
bg.cache(0,0,bg.image.width,bg.image.height);
```

## 使用 Rectangle 剪裁图片

使用 EaselJS 内置的 Rectangle 对象来创建一个选取框，显示图片的某各部分。

```js
stage = new createjs.Stage("gameView");
bg = new createjs.Bitmap("./img/linkgame_pass@2x.png");
bg.x = 10;
bg.y = 10;
var rect = new createjs.Rectangle(0, 0, 121, 171);
bg.sourceRect = rect;
stage.addChild(bg);
stage.update(e);
```

适用场景：拼图小游戏，剪裁图片……

> 具体的使用方法我们都知道啦，接下来用一个小 Demo 练练手 – **实现一个无缝连接的背景图，模拟汽车加速的状态**

```js
this.backdrop = new createjs.Bitmap(bg);
this.backdrop.x = 0;
this.backdrop.y = 0;
this.stage.addChild(that.backdrop);
this.w = bg.width;
this.h = bg.height;

//创建一个背景副本，无缝连接
var copyy = -bg.height;
this.copy = new createjs.Bitmap(bg);
this.copy.x = 0;
this.copy.y = copyy;  //在画布上 y 轴的坐标为负的背景图长
//使用 CreateJS 的 Tick 函数，逐帧刷新舞台
createjs.Ticker.addEventListener("tick", tick);
function tick(e) {
   if (e.paused !== 1) {
        //舞台逐帧逻辑处理函数
        that.backdrop.y = that.speed + that.backdrop.y;
        that.copy.y = that.speed + that.copy.y;

        if (that.copy.y > -40) {
              that.backdrop.y = that.copy.y + copyy;
        }
        if (that.copy.y > -copyy - 100) {
              that.copy.y = copyy + that.backdrop.y;
        }
    }
    that.stage.update(e);
}
```

- [demo体验链接](http://xn--jdc-lp6e.jd.com/fd/h5/peidan/demo/car.html)： <http://jdc.jd.com/fd/h5/peidan/demo/car.html>

















