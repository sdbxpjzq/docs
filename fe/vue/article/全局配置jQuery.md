[TOC]



# 全局引入jQuery

`npm install jquery --save`

在`webpack.base.conf.js`里加入

```js
var webpack = require("webpack")
```

在`module.exports`的最后加入

```js
plugins: [
 new webpack.ProvidePlugin({
     jQuery: "jquery",
     $: "jquery"
 })
]
```

在`main.js `引入就ok了

```js
import $ from 'jquery'
```



[参考--如何在 vue 项目里正确地引用 jquery 和 jquery-ui的插件](https://segmentfault.com/a/1190000007020623)