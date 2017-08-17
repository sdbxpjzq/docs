

[TOC]


# `sass` 和`scss`
`sass`和.`scss`。这两种的区别在于`.sass`文件对代码的排版有着非常严格的要求，而且没有大括号，没有分号
**推荐:**  `scss`
# 安装`RUby`
**[参考](http://www.w3cplus.com/sassguide/install.html)**
- mac自带, 可以升级
* sass基于ruby, 命令gem, 需要切换 gem 的源为淘宝源,
* `gem update --system` --升级` gem`
* `gem source` -- 查看当前源
* `gem sources -r https://rubygems.org/ `— 删除默认的源
* `gem sources -a  https://gems.ruby-china.org/ ` -- 使用淘宝源(淘宝给了 Ruby China 镜像 的维护工作中)
* `gem sources -u `—更新源的缓存后即完成了Ruby的gem源修改。
# 安装sass
`gem install sass`
`sass -v`
`gem update sass` --升级
`sass -h`  --帮助
# sass转css
* **单文件转换命令**
  `sass style.scss style.css`
* **单文件监听命令**
  `sass --watch style.scss:style.css`
* **文件夹监听命令**
  ``sass --watch sassFileDirectory:cssFileDirectory``
# css转scss

- **css文件转成sass/scss文件（在线转换工具css2sass)**
- `sass-convert style.css style.sass   `
- `sass-convert style.css style.scss`



# 命令行其他配置选项

我们一般常用的有`—style`，`—sourcemap`，`—debug-info`等。
`sass --watch style.scss:style.css --style compactsass `
`—watch style.scss:style.css --sourcemapsass `
`—watch style.scss:style.css --style expanded `
`—sourcemapsass --watch style.scss:style.css --debug-info`
* `—style`表示解析后的css是什么格式，有四种取值分别为：`nested`，`expanded`，`compact`，`compressed`。
* `—sourcemap`表示开启`sourcemap`调试。开启`sourcemap`调试后，会生成一个后缀名为`.css.map`文件。
* `—debug-info`表示开启`debug`信息，升级到3.3.0之后因为`sourcemap`更高级，这个`debug-info`就不太用了。
* **expanded风格（默认)**
```css
#main {
    color: #999;
}
#main .content {
    color: #bfbfbf;
}
```
* **nested编译风格**
```css
#main {
    color: #999; }
    #main .content {
        color: #bfbfbf; }   
```
* **compact风格**
```css
#main { color: #999; }
#main .content { color: #bfbfbf; }
```
* **compressed风格**

```css
#main{color:#999}#main .content{color:#bfbfbf}
```

> 就开发阶段而言，`expanded`感觉非常不错，发布的时候可以选`compressed`。  

# sass 调试
sass调试需要开启编译时输出调试信息和浏览器调试功能，两者缺一不可。
开启编译调试信息
目前sass的调试分为两种，一种为开启debug-info，一种为开启sourcemap（这个将成为主流）。
如开启的是debug-info，则解析的css文件中会有以@media -sass-debug-info开头的代码，如没有则表明没有开启。
如开启的是sourcemap，则在解析的css文件同目录下生成一个.css.map的后缀名文件。
命令行开启
两个的命令分别为--debug-info，--sourcemap，开启如下：
sass --watch style.scss:style.css --debug-info
sass --watch style.scss:style.css --sourcemap

koala开启
如下图：点击相应的文件，然后就会出现右边的编译选项，即可选择是否开启source map，debug info
koala setting
开启浏览器调试
谷歌浏览器调试
F12打开调试面板，点击调试面板右上角的齿轮图标打开设置，在general选项中勾选Enable CSS source map 和 Auto-reload generated CSS。

开启--sourcemap编译，f12打开调试面板，就可以看到原先右边的css文件变成了我们现在的scss文件

点击scss文件，会跳到source里面的scss源文件，现在可以在里面进行修改，修改完成后可以右键选择save或save as命令，然后替换我们本地的scss源文件，刷新chrome就可以看到变化（注意，解析样式需要一定时间）。以后只要ctrl+s保存修改就可以在浏览器中看到修改效果了。


这个地方需要几个操作: -- 重要
1. 将要修改的scss文件添加到 Workspace


2. 添加 map文件


# sass基础语法
scss基础知识
## 导入— `@import`
`sass`的导入(`@import`)规则和CSS的有所不同，编译时会将`@import`的scss文件合并进来只生成一个CSS文件。但是如果你在sass文件中导入css文件如`@import 'reset.css'`，那效果跟普通CSS导入样式文件一样，导入的css文件不会合并到编译后的文件中，而是以`@import`方式存在。

## 注释
* **方式一**
  `// 这是一行注释`
* **方式二**
  `/* 这是一行注释*/`
* **方式三(输出`copressed`格式不会被省略)**
  `/*! 这是注释，编译后不会消失*/`
# 变量
* **普通变量**
  sass的变量必须是`$`开头，后面紧跟变量名，而变量值和变量名之间就需要使用冒号`:`分隔开（就像CSS属性设置一样），如果值后面加上`!default`则表示默认值。
```css
$fontSize: 12px;
body{
    font-size:$fontSize;
}
```
编译后
```css
body{
    font-size:12px;
}
```

* **默认变量**
  sass的默认变量一般是用来设置默认值，然后根据需求来覆盖的，覆盖的方式也很简单，只需要在默认变量之前重新声明下变量即可.
```css
//sass style
//-------------------------------
$baseLineHeight:        2;
$baseLineHeight:        1.5 !default;
body{
    line-height: $baseLineHeight; 
}

//css style
//-------------------------------
body{
    line-height:2;
}
```

* **特殊变量**
  一般我们定义的变量都为属性值，可直接使用，但是如果变量作为属性或在某些特殊情况下等则必须要以#{$variables}形式使用。
```css
//sass style
//-------------------------------
$borderDirection:       top !default; 
$baseFontSize:          12px !default;
$baseLineHeight:        1.5 !default;

//应用于class和属性
.border-#{$borderDirection}{
  border-#{$borderDirection}:1px solid #ccc;
}
//应用于复杂的属性值
body{
    font:#{$baseFontSize}/#{$baseLineHeight};
}

//css style
//-------------------------------
.border-top{
  border-top:1px solid #ccc;
}
body {
  font: 12px/1.5;
}
```
* **局部变量**
```css
$width: 10rem;
#main {
  $width: 5em; // 局部变量
  width: $width;
}
#sidebar {
  width: $width;
}
```
编译后:
```css
#main{width:5em}
#sidebar{width:10rem}
```
* **全局变量**
  在变量值后面加上`!global`即为全局变量。
```css
$width: 10rem;
#main {
  $width: 5em !global; // 全局变量
  width: $width;
}

#sidebar {
  width: $width;
}
```
编译后:
```css
#main{width:5em}#sidebar{width:5em}
```


## 混入指令— `@mixins`
定义`mixins`
```css
@mixin rounded-corners {
    -moz-border-radius:5px;
   -webkit-border-radius:5px;
    border-radius:5px;
}
```

使用`mixins`
```css
.danger-box {
  color: red;
  @include rounded-corners;    //引用mixins
}
```
看到这里,你是否觉得上面的是不是很方便呢? 下面还有更加 炫酷的,,哈哈~
***
同样是上面的栗子:
```css
@mixin rounded-corners($rounded-size:default-size) {
    -moz-border-radius:$rounded-size;
   -webkit-border-radius:$rounded-size;
    border-radius:$rounded-size;
}
```

```css
.danger-box{
    @include rounder-corners(5px) 
}
.warning-box{
    @include rounder-corners(8px) 
}
```
 ** *我们可以根据我们的不同需要传入不同的值。当然，你可以设置默认的`default-size`来确保即使不传值依然有一个默认的值。* **
# 继承 — `@extend`
还是看例子比较实在，如下，`.warning-box`、`.success-box`、`.info-box`类都继承了`.box`的属性并且可以覆盖其属性:

```css
// Box
.box {
    padding: 2em;
    color: $color10;
    background-color: $color11;
}
// Warning Box
 .warning-box {
    @extend .box;
    border: 2px dotted $color1;
}
// Success Box
.success-box {
    @extend .box;
    border: 2px dotted $color4;
}
// Information Box
 .info-box {
    @extend .box;
    border: 2px dotted $color7;
}
```
经编译后CSS文件如下所示：
```css
//看下面一行
.box, .warning-box, .success-box, .info-box {
    padding: 2em;
    color: black;
    background-color: white;
}
.warning-box {
    border: 2px dotted red;
}
.success-box {
    border: 2px dotted chartreuse;
}
.info-box {
    border: 2px dotted blue;
}
```
# sass循环
### SASS多值变量： `list`
`list` 类型有点像`js`中的`数组`。`list`数据可通过`空格`，`逗号`或`小括号`分隔多个值，可用 `nth($var,$index)` 取值。关于list数据操作还有很多其他函数如 `length($list)` ， `join($list1,$list2,[$separator])` ， `append($list,$value,[$separator])`等，具体可参考 [Module: Sass::Script::Functions — Sass Documentation](http://sass-lang.com/documentation/Sass/Script/Functions.html) 。
#### `@for`循环
**炒栗子**
```css
$red : #FF0000;
$orange : #FFA500;
$yellow : #FFFF00;
$green : #008000;
$bluegreen : #00FFFF;
$blue : #0000FF;
$purple : #800080;

$bgcolorlist: $red $orange $yellow $green $bluegreen $blue$purple;

@for $i from 1 to length($bgcolorlist)+1 { // 这个地方需要注意,,从 1 开始 到 length+1 结束 (sass就是这么规定的)
  ul li:nth-child(#{$i}) { // 这里 $i 是变量
    background-color: nth($bgcolorlist,$i);

  }
}
```
#### 多个字段list数据循环
```css
/*!多个字段list数据循环*/
$animal-data: (puma, black, default),(sea-slug, blue, pointer),(egret, white, move);
@each $animal, $color, $cursor in $animal-data {
  .#{$animal}-icon {
    background-image: url('/images/#{$animal}.png');
    border: 2px solid $color;
    cursor: $cursor;
  }
}
```
编译后:
```css
/*!多个字段list数据循环*/
.puma-icon {
  background-image: url("/images/puma.png");
  border: 2px solid black;
  cursor: default; }

.sea-slug-icon {
  background-image: url("/images/sea-slug.png");
  border: 2px solid blue;
  cursor: pointer; }

.egret-icon {
  background-image: url("/images/egret.png");
  border: 2px solid white;
  cursor: move; }
```

### `SASS`多值变量： `map`(`json格式`)
#### `@each` 循环
```css
$bgcolorlistMap2 : (
        'jiudian': $red,
        'jingnei': $orange,
);
/*! background-color */
@each $k, $val in $bgcolorlistMap2 {
  #map ul li.#{$k} {
    background-color: $val;
  }
}

/*! background-position */
$bgcolorlistMap3 : (
        'jiudian': 1 2,
        'jingnei': 3 4,
);

@each $key,$val in $bgcolorlistMap3 {
  #map3 ul li.#{$key} {
    background-position: $val;
  }
}
```
编译后:
```css
/*! background-color */
#map ul li.jiudian {
  background-color: #FF0000; }

#map ul li.jingnei {
  background-color: #FFA500; }

/*! background-position */
#map3 ul li.jiudian {
  background-position: 1 2; }

#map3 ul li.jingnei {
  background-position: 3 4; }
```




## 参考
* [Sass (3.4.21) 中文文档](http://www.css88.com/doc/sass/)

## 参考
[scss参考](http://www.w3cplus.com/sassguide/install.html)
































