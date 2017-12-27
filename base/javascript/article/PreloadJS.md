[TOC]

http://www.createjs.cc/preloadjs/

# PreloadJs

PreloadJS是一个用来管理和协调相关资源加载的类库，它可以方便的帮助你预先加载相关资源，例如

- 图片
- 文件
- 音频
- 数据
- 其他

它使用了XHR2来提供实时的加载进度信息，如果不支持则使用标签式的简化进度来实现进度展示。

支持多队列，多连接，暂停队列等等功能

```js
//放置静态资源的数组
var manifest = [
    {src: './images/car_prop2_tyre@2x.png', id: 'tyre'}
];
var queue = new createjs.LoadQueue();
queue.on('complete', handleComplete, this);
queue.loadManifest(manifest);
//资源加载成功后,进行处理
function handleComplete() {
   var tyre = queue.getResult('tyre');  //获取加载资源
}
```

## 详细说明

```js
var queue = new createjs.LoadQueue(true); // xhr式加载
```

以上代码中，传递一个`false`参数则强制使用`标签式的`加载。LoadQueue包含了几个可以订阅的事件：

- complete: 当队列完成全部加载后触发
- error: 当队列遇到错误时触发
- progress: 整个队列变化时展示的进度
- fileload: 一个单独文件加载完毕
- fileprogress: 一个单独文件变化的进度，请注意只有文件使用`XHR`加载才会触发，其它只会显示0或者100%

可以通过调用`loadfile("文件路径")`加载一个文件或者调用`loadMnifest()`来加载多个文件.

LoadQueue支持相关文件类型如下：

- BINARY:  XHR调用的二进制文件
- CSS: CSS文件
- IMAGE: 一般图片文件格式
- JAVASCRIPT: JavaScript文件
- JSON: JSON数据
- JSONP: 跨域JSON文件
- MANIFEST: JSON格式的文件列表
- SOUND: 音频文件
- SVG: SVG文件
- TEXT: 文本文件 - 仅支持XHR
- XML: XML数据





