[TOC]

# 前端优化之图片优化

## 降低图片大小

压缩图片

http://zhitu.isux.us/

https://tinypng.com/

## 通过css定义来加载不同的背景bg图片

```css
@media only screen and (max-width : 480px) {
  .img {background-image: url(bg-480.jpg);}
}
@media only screen and (max-width : 360px) {
  .img {background-image: url(bg-360.jpg);}
}
```

## Img的`srcset`和`sizes`的方法

```html
<img class="img"  src="imgbg-320.jpg"
   srcset="imgbg-320.jpg 320w, imgbg-360.jpg 360w, imgbg-480px.jpg 480w"
   sizes="(max-width: 480px) 480px, 320px">
```

`src`:当设备不支持`srcset`，`sizes`属性时，使用这个图片
`srcset`指定图片的地址和对应的图片质量。`sizes`用来设置图片的尺寸零界点

## `picture`标签实现

通过媒体查询的方式，根据页面宽度（当然也可以添加其他参考项）加载不同图片.[picture说明](http://blog.csdn.net/hanks10100/article/details/39012095)

```html
<picture>  
  <source srcset="3.jpg" media="(min-width: 320px)">  
  <source srcset="2.jpg" media="(min-width: 480px)">  
  <img srcset="1.jpg">  
</picture>
```

## 减少HTTP的网络资源请求

CSSSprites

## `css`和`css3`制作简单的图标和动画（代替gif图片)

css3可以实现的效果越来越多，比如箭头图标，三角形，梯形等图标，或者一些阴影效果，渐变的效果，所以可以用`css`制作一些简单的图标

## SVG技术替换图片

`SVG` 是使用 `XML` 来描述二维图形和绘图程序的语言,支持透明，缩放，动画

## html5 canvas绘画图形

SVG 指可伸缩矢量图形 (Scalable Vector Graphics)
SVG 用来定义用于网络的基于矢量的图形
SVG 使用 XML 格式定义图形
SVG 图像在放大或改变尺寸的情况下其图形质量不会有所损失
SVG 是万维网联盟的标准
SVG 与诸如 DOM 和 XSL 之类的 W3C 标准是一个整体

## 字体图库代替图标

http://www.bootcss.com/p/font-awesome/

## 图片延迟加载（懒惰加载）

lazyload.js.

