[TOC]

# 基于vue-cli的webpack优化

## 开启`babel-loader`的cache和exclude

开启了cache的`babel-loader`，在下次编译的时候，遇到不变的部分可以直接拿取cache里的内容，能够较为明显地提高构建速度。在`loader`选项里只需要对`babel-loader`开启`cacheDirectory=true`即可。

```js
module: {
  rules: [
    // ... 其他loader
    {
        test: /\.js$/,
          exclude: [path.resolve('../../node_modules')], // 不需要编译node_modules下的js
        loader: ['babel-loader?cacheDirectory=true'],
        include: [resolve('src'), resolve('test')] // src是开发目录
      },
  ]
}
```

## 配置`modules`以及配置项目相关的`alias`

这个部分的配置实际上都是对webpack接管的文件路径的一些配置。通过这些配置，webpack可以不必自己遍历去搜索模块等，而可以通过我们定义的路径，快速定位。尤其是`node_modules`的位置，这个位置可以通过`modules`选项配置，节省webpack去查找的时间。

而`alias`是别名。通过编写`alias`，既能让webpack查找文件定位更快，在开发的时候，也能少些很多相对路径的`../..`，在引入模块的时候很方便。

同样是打开`webpack.base.conf.js`，在`module.exports`的`resolve`属性里配置`modules`和`alias`。其中`vue-cli`会自动配置一些默认的`alias`。

```js
resolve: {
  //... 其他配置
  modules: [path.resolve(__dirname, '../../node_modules')], // node_modules文件夹所在的位置取决于跟webpack.base.conf.js相对的路径
  alias: {
    //... 其他配置
    api: path.resolve(__dirname, '../../server/api') // api文件所在的位置取决于跟webpack.base.conf.js相对的路径，在项目中会自动转换跟项目文件的相对路径
    //... 其他配置
  }
}
```

如果配置了如上的`alias`，那么我们在项目里，要引用比如`api.js`这个模块，可以直接这样做了：

```js
import * as api from 'api' // 'api'是个alias，webpack会直接去找`server/api`

```

而不用手动去根据项目文件和api所在路径的相对位置去书写import的路径了。

## 使用路由懒加载

```js
import Vue from 'vue'
import Router from 'vue-router'
// import HelloWorld from '@/components/HelloWorld'
// 采用路由懒加载的模式
const HelloWorld  = () => import('@/components/HelloWorld')

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
        component: HelloWorld
    }
  ]
})
```

npm run build --report 

https://juejin.im/post/5a337a1f6fb9a0452b4949e0

