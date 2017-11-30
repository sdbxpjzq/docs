[TOC]



[参考手册](http://www.runoob.com/svg/svg-tutorial.html)

# 入门

```html
<svg xmlns="http://www.w3.org/2000/svg" version="1.1">
    <!--圆形-->
    <circle cx="100" cy="50" r="40" stroke="black" stroke-width="2" fill="red"></circle>
</svg>
```

# \<rect> 矩形

```html
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg" version="1.1" >
  <rect x="50" y="20" rx="10" ry="10" width="100" height="100" style="fill:rgb(0,0,255);stroke-width:20;
    stroke:rgb(0,0,0);fill-opacity:0.1;stroke-opacity:0.9;opacity:0.5" ></rect>
</svg>
```

-  width 和 height 属性可定义矩形的高度和宽度

- style 属性用来定义 CSS 属性
- fill 属性定义矩形的填充颜色（rgb 值、颜色名或者十六进制值）
- stroke-width 属性定义矩形边框的宽度
-  stroke 属性定义矩形边框的颜色
- x 属性定义矩形的左侧位置（例如，x="0" 定义矩形到浏览器窗口左侧的距离是 0px）
- y 属性定义矩形的顶端位置（例如，y="0" 定义矩形到浏览器窗口顶端的距离是 0px）
- fill-opacity 属性定义填充颜色透明度（合法的范围是：0 - 1）
- stroke-opacity 属性定义边框颜色的透明度（合法的范围是：0 - 1）
- opacity 属性用于定义了整个元素的透明值 (范围: 0 到 1)。
- rx 和 ry 属性可使矩形产生圆角。

# \<circle>圆形

```html
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" version="1.1">
    <!--圆形-->
    <circle cx="100" cy="50" r="40" stroke="black" stroke-width="10" fill="red"></circle>
</svg>
```

- cx和cy属性定义圆点的x和y坐标。如果省略cx和cy，圆的中心会被设置为(0, 0)
- r 属性定义圆的半径
- stroke 边框

# \<ellipse>椭圆

```html
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" version="1.1">
    <!--圆形-->
    <ellipse cx="100" cy="50" rx="100" ry="50" stroke="black" stroke-width="10" fill="red"></ellipse>
</svg>
```

- CX属性定义的椭圆中心的x坐标
- CY属性定义的椭圆中心的y坐标
- RX属性定义的水平半径
- RY属性定义的垂直半径

![](https://ws3.sinaimg.cn/large/006tKfTcly1flvnk124qpj310c0hmwfe.jpg)

# \<line>直线

```html
<svg xmlns="http://www.w3.org/2000/svg" version="1.1">
    <line x1="0" y1="0" x2="200" y2="200"
          style="stroke:rgb(255,0,0);stroke-width:2"></line>
</svg>
```

- x1 属性在 x 轴定义线条的开始
- y1 属性在 y 轴定义线条的开始
- x2 属性在 x 轴定义线条的结束
- y2 属性在 y 轴定义线条的结束

![](https://ws1.sinaimg.cn/large/006tKfTcly1flvnlo4wckj312e0gg0tm.jpg)

# \<polyline>折线

```html
<svg xmlns="http://www.w3.org/2000/svg" version="1.1">
  <polyline points="0,40 40,40 40,80 80,80 80,120 120,120 120,160" style="fill:white;stroke:red;stroke-width:4" />
</svg>
```

![](https://ws4.sinaimg.cn/large/006tKfTcly1flvnolohauj30bq0b4jr5.jpg)

![](https://ws2.sinaimg.cn/large/006tKfTcly1flvnpgqu2qj31720l80u6.jpg)





