

# vue 基础指令

v-for

1. 基本用法

```vue
<div v-for="item in items">
  {{ item.text }}
</div>

```

2. 创建索引

```vue
<div v-for="(item, index) in items"></div>
<div v-for="(val, key) in object"></div>
<div v-for="(val, key, index) in object"></div>
```

3. 排序.迫使其重新排序的元素,您需要提供一个 `key` 的特殊属性

```vue
<div v-for="item in items" :key="item.id">
  {{ item.text }}
</div>
```



# vue2.0生命周期

1. beforeCreate
2. created
3. beforeMount
4. mounted
5. beforeUpdate
6. updated
7. activated
8. deactivated
9. beforeDestroy
10. destroyed

```vue 
new Vue({
  el: '#app',
  
  beforeCreate: function () {
    console.log('1-beforeCreate  初始化之后');
  },
  created: function () {
    console.log('2-created  创建完成');
  },
  beforeMount: function () {
    console.log('3-beforeMount  挂在之前');
  },
  // 以前都不允许  dom 操作
  mounted: function () {
    // 这里可以进行 dom操作
    console.log('4-mounted  被创建');
  },
  beforeUpdate: function () {
    console.log('5-beforeUpdate  数据更新前');
  },
  updated: function () {
    console.log('6-updated  被更新后');
  },
  // <keep-alive></keep-alive> ,当组件在 <keep-alive> 内被切换, activated 和 deactivated 被执行
  activated: function () {
    console.log('7-activated');
  },
  deactivated: function () {
    console.log('8-deactivated ');
  },
  beforeDestroy: function () {
    console.log('9-beforeDestroy  销毁之前');
  },
  destroyed: function () {
    console.log('10-destroyed  销毁之后');
  }
})
```





# axios

**安装**

`npm install axios --save`

**跨域问题解决**

首先说明当前访问的url地址: `http://localhost:8080/#/`

1. 添加`{withCredentials:true}`

```js
let url = 'https://m.10027.dev/sales/activity/ajax.php?act=aGetCollectionOnlineData';
            axios.get(url,{withCredentials:true}).then(function (res) {
                console.log(res)
            }).catch(function (res) {
                console.log(res);
            })
```

2. 创建一个axios实例，自定义其配置

```js
const instance = axios.create({

baseURL: 'http://dev.xxxxxxxxxxx.com/',
headers:{
    'Content-Type':'application/x-www-form-urlencoded'
},
transformRequest: [function (data) {
    
    data = Qs.stringify(data);
    return data;
}],
withCredentials:true   //加了这段就可以跨域了 
});
```

3. 就是在config这个文件里的index.js这个文件夹了 里面有个proxyTable 这个可以给你代理域名到你想要的域名。 简书搜索 proxyTable 跨域 就可以得到你想要的答案了


> 以上方法若没解决(就像我😂),使用代理的方式吧
>
> 我是用 whistle 代理解决的




# vue-cli

- [github](https://github.com/vuejs/vue-cli)

**全局安装**

`npm install -g vue-cli`

- `webpack` - A full-featured Webpack + vue-loader setup with hot reload, linting, testing & css extraction.
- `webpack-simple` - A simple Webpack + vue-loader setup for quick prototyping.
- `browserify` - A full-featured Browserify + vueify setup with hot-reload, linting & unit testing.
- `browserify-simple` - A simple Browserify + vueify setup for quick prototyping.
- `simple` - The simplest possible Vue setup in a single HTML file

**创建项目**

`vue init webpack helloworld`

- cd helloworld 进入helloworld 文件夹
- npm install 安装package.json中依赖的node_modules
- npm run dev 运行该项目

**支持scss**

直接安装 `node-sass`和`sass-loader`
`npm install node-sass sass-loader --save-dev`

# vue2.0手册

- https://vuefe.cn/v2/api/