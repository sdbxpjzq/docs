# NuxtJs实战

[手册](https://zh.nuxtjs.org/)

## 项目创建

官方提供了基于 **vue-cli** 脚手架工具，常用的有如下三个，更多脚手架工具可以查看 [nuxt-community](https://github.com/nuxt-community) 。本项目使用的是 **express-template**。

```shell
vue init nuxt-community/starter-template <project-name>

vue init nuxt-community/koa-template <project-name>
 
vue init nuxt-community/express-template <project-name>
```



## 目录结构

![](https://ws1.sinaimg.cn/large/006tNc79gy1fniq529hq8j3045083dfr.jpg)

下面简要介绍一下各个目录的作用：

- `.nuxt/`：用于存放 Nuxt.js 的核心库文件。例如，你可以在这个目录下找到 `server.js` 文件，描述了 Nuxt.js 进行服务端渲染的逻辑（参见下一段 “Nuxt.js 的渲染流程”），`router.js` 文件包含一张自动生成的路由表。
- `assets/`：用于存放静态资源，该目录下的资源使用 Webpack 构建。
- `components/`：存放项目中的各种组件。注意，只有在这个目录下的文件才能被称为**组件**。
- `layouts/`：创建自定义的页面布局，可以在这个目录下创建全局页面的统一布局，或是错误页布局。如果需要在布局中渲染 `pages` 目录中的路由页面，需要在布局文件中加上 `<nuxt />` 标签。
- `middleware/`：放置自定义的中间件，会在加载组件之前调用。
- `pages/`：在这个目录下，Nuxt.js 会根据目录的结构生成 `vue-router` 路由，详见下文。
- `plugins/`：可以在这个目录中放置自定义插件，在根 `Vue` 对象实例化之前运行。例如，可以将项目中的埋点逻辑封装成一个插件，放置在这个目录中，并在 `nuxt.config.js` 中加载。
- `static/`：不使用 Webpack 构建的静态资源，会映射到根路径下，如 `robots.txt` 
- `store/`：存放 Vuex 状态树。
- `nuxt.config.js`：Nuxt.js 的配置文件，详见下文。

## vuex

Nuxt.js 支持两种使用 store 的方式：

- 普通方式：store/index.js 返回一个 Vuex.Store 实例
- 模块方式：store 目录下的每个 .js 文件会被转换成为状态树指定命名的子模块 （当然，index 是根模块，相当于设置了namespaced: true)

Nuxt.js提供了模块方式的简单写法：使用状态树模块化的方式，store/index.js 不需要返回 Vuex.Store 实例，直接将 **state、mutations 和 actions** 暴露出来即可。示例如下：

```js
export const state = () => ({
  accesstoken: ''
})

export const mutations = {
  setAccesstoken (state, accesstoken) {
    state.accesstoken = accesstoken
  }
}
```



## 异步数据 asyncData

Nuxt.js 增加了一个 **asyncData** 方法，用于 在设置组件数据 之前 能够异步获取 或 处理数据。
由于 `asyncData` 是在组件 初始化 之前被调用的，所以不能通过 `this` 引用组件的实例对象，可以使用上下文对象来实现某些功能

```js

asyncData (params) {
  let accesstoken = params.route.query.accesstoken
  // request 基于 axios 封装的函数
  return request({
    url: '/drivers/banks',
    method: 'get',
    headers: {
      accesstoken
    }
  })
    .then(res => {
      let {
        bankInfo
      } = res.data
      return {
        banksData: bankInfo,
        accesstoken
      }
    })
    .catch(err => {
      return error({ message: 'accesstoken not found', statusCode: 404 })
    })
}
```



## fecth方法

与 `asyncData` 方法类似，不同的是它不会设置组件的数据，作用是设置 `store` 数据。



## Nuxt.js 的渲染流程



![](https://ws1.sinaimg.cn/large/006tNc79gy1fniqcifwjsj30cs0go74l.jpg)

## 参考学习

https://juejin.im/post/59ee97a66fb9a044fc43e910

https://segmentfault.com/a/1190000012802572



# 部署

执行

```shell
npm run generate
```

生成dist目录.

## 参考

https://segmentfault.com/a/1190000012774650











