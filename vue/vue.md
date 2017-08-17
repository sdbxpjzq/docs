[TOC]



# **vue 基础指令**

## v-for

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

## **ref**

在普通的 DOM 元素上使用，引用指向的就是 DOM 元素.

- 绑定`DOM` 

```js
<!-- vm.$refs.p will be the DOM node -->
<p ref="p">hello</p>
```



https://vuefe.cn/v2/api/#ref

http://jingyan.baidu.com/article/acf728fd5ee4acf8e510a3cc.html



## methods

> **不应该使用箭头函数来定义 method 函数**



## 指令-directive

**`directive` 更趋向于有`dom`操作时使用**

### **全局**指令

```vue
// 注册
Vue.directive('my-directive', {
  bind: function () {}, // 在该元素绑定指令时调用且仅调用一次，用于初始化
  inserted: function () {}, // 当绑定元素时插入DOM中执行
  update: function () {}, // bind完成之后立刻触发，以后每当参数更新的时候都会触发
  componentUpdated: function () {}, // 被绑定元素所在模板完成一次更新周期时调用
  unbind: function () {} // 解除和DOM元素的绑定时触发
})
```

- 例子

将`inputMask`封装成指令

```vue
import Vue from 'vue'
import Inputmask from 'inputmask'
Vue.directive('mask', {
    bind: function(el, binding){
        Inputmask(binding.value).mask(el);
    }
});
```

```html
<input type="text" v-model="msg" v-mask="'9{1,}.9{2}'" placeholder="输入金额">
```

### 参数说明:

1. el: 指令所绑定的元素，可以用来直接操作 DOM 。
2. binding: 一个对象，包含以下属性：
   1. name: 指令名，不包括 v- 前缀。
   2. value: 指令的绑定值
   3. oldValue: 指令绑定的前一个值，仅在 update 和 componentUpdated 钩子中可用。无论值是否改变都可用。
   4. expression: 绑定值的字符串形式。 例如 v-my-directive="1 + 1" ， expression 的值是 "1 + 1"。
   5. arg: 传给指令的参数。例如 v-my-directive:foo， arg 的值是 "foo"。
   6. modifiers: 一个包含修饰符的对象。 例如： v-my-directive.foo.bar, 修饰符对象 modifiers 的值是 { foo: true, bar: true }。
3. vnode: Vue 编译生成的虚拟节点。
4. oldVnode: 上一个虚拟节点，仅在 update 和 componentUpdated 钩子中可用。



https://www.npmjs.com/package/vue-inputmask

http://www.cnblogs.com/xiaojingyuan/p/6555988.html

## 不能用于异步事件

Vue.directive() 的命令一般都是自动运行的或者说初始化等等触发的，并不能用于异步事件.

可以用`mixins`混合命令



## mixins

### 基础用法

```js
const myMixin = {
    methods: {
        miXinsHello: function () {
            console.log('hello from miXinsHello!')
        }
    }
}
const yaoyao = {
    methods: {
        yaoyao: function () {
            console.log('hello from yaoyao!')
        }
    }
}
// export default myMixin
export { myMixin,yaoyao}
```

```vue
<template>
    <div class="hello">
        <button>点我试试</button>
    </div>
</template>

<script>
    import {myMixin,yaoyao} from '../../mixins/test' // 引入
    export default {
        name: 'hello',
        data() {
            return {
                msg: ''
            }
        },
        created() {
            this.miXinsHello(); // 调用
        },
        methods: {
            hello: function () {
                // code 不能使用箭头函数
            }
        },
        mixins: [myMixin,yaoyao] // mixins
    }
</script>
```



## 选项合并

1. 如果是vue生命周期里的钩子函数，那将会进行合并，以此执行mixins以及组件的函数.
2. 如果是methods等方法，（不是钩子函数）那组件中的方法将会覆盖mixins中的方法。

```vue
import {myMixin,yaoyao} from '../../mixins/test'
    export default {
        name: 'hello',
        data() {
            return {
                msg: ''
            }
        },
        created() {
            this.miXinsHello();
        },
        methods: {
            hello: function () {
                // code 不能使用箭头函数
            },
            miXinsHello: function () {
                console.log('no hello')
            }
        },
        mixins: [myMixin,yaoyao]
    }
```



```js
const myMixin = {
    created: function () {
      console.log('created mixin')
    },
    methods: {
        miXinsHello: function () {
            console.log('hello from miXinsHello!')
        }
    }
}
export default myMixin
```

输出: 

created mixin
no hello













# vue虚拟节点







# **vue2.0生命周期**

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



# **vue-router**

**手册**

https://router.vuejs.org/zh-cn/

```js
import Router from 'vue-router'
export default new Router({
    mode: 'history',
  routes: [
    {
      path: '/',
      name: 'vueCollection',
      component: Collection
    }
  ]
})
```

**路由元信息- 配置`meta`**

```js
const router = new VueRouter({
  routes: [
    {
      path: '/foo',
      component: Foo,
      children: [
        {
          path: 'bar',
          component: Bar,
          // a meta field
          meta: { requiresAuth: true }
        }
      ]
    }
  ]
})
```



# **控制title和分享信息 -- vue-meta**

别人写的:

![](https://ws1.sinaimg.cn/large/006tKfTcly1fhy7rqo67dj30h806qt8u.jpg)



https://github.com/declandewet/vue-meta

router.js

```js
import Vue from 'vue'
import Router from 'vue-router'
import Meta from 'vue-meta'

Vue.use(Router)
Vue.use(Meta)
```

collection.vue

```js
export default {
        name: 'vueCollection',
        metaInfo: {
                    title: '我是聚合页',
                    meta: [
                        { property: "og:title",content:"我是聚合页的分享title"},
                        { property: "og:description",content:"我是聚合页的分享title"},
                        { property: "og:url",content:"我是聚合页的分享title"},
                        { property: "og:image",content:"image"},
                    ]
                }
}
```



另外参考:

1. ![](https://ws2.sinaimg.cn/large/006tNc79ly1fhj661ashij30g605maa4.jpg)



2. https://segmentfault.com/a/1190000007387556





# vuex

https://vuex.vuejs.org/zh-cn/

# axios

http://www.jianshu.com/p/df464b26ae58

https://www.kancloud.cn/yunye/axios/234845

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

3. 就是在config这个文件里的index.js这个文件夹了 里面有个proxyTable 这个可以给你代理域名到你想要的域名。 简书搜索 proxyTable 跨域 就可以得到你想要的答案了. **需要配合chrome跨域插件好使(Allow-Control-Allow-Origin: *)**


```js
proxyTable: {
        '/sales/activity/ajax.php': {
            target: "https://m.mafengwo.cn/sales/activity/ajax.php",
            changeOrigin: true,
            pathRewrite: {
              '^/sales/activity/ajax.php': ""
            }
        },
}
```



> 以上方法若没解决(就像我😂),使用代理的方式吧
>
> 我是用 whistle 代理解决的

## 默认设置

### 全局默认设置

```js
axios.defaults.baseURL = 'https://api.example.com';
axios.defaults.headers.common['Authorization'] = AUTH_TOKEN;
axios.defaults.headers.post['Content-Type']='application/x-www-form-urlencoded';
```





# vue-cli

- [github](https://github.com/vuejs/vue-cli)
- [**全局配置分析参考**](https://github.com/DDFE/DDFE-blog/issues/10?hmsr=toutiao.io&utm_medium=toutiao.io&utm_source=toutiao.io)— 值得一看





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



# vue-cli 自定义模板

1. 当官方模板不能满足需求时，我们可以 fork 官方模板按照自己的需求修改后，通过 vue-cli 命令生成基于自己模板的项目结构：

   `vue init username/repo my-project`

2. 除了从 github 下载模板外，我们还可以从本地加载模板：

   `vue init ~/fs/path/to-custom-template my-project`




# vue 服务端渲染

https://vuefe.cn/v2/guide/ssr.html

https://segmentfault.com/a/1190000007933349

# vue2.0手册

- https://vuefe.cn/v2/api/

#  常见问题

http://www.xiaoxiaohan.com/js/30.html



