[TOC]

# vuex

## 手册

 https://vuex.vuejs.org/zh-cn/

https://etianqq.gitbooks.io/vue2/content/statusmanager/vuex.html

https://juejin.im/entry/59a97a8f518825242238f9d3?utm_source=gold_browser_extension

> 使用`vuex`后,会在每个组件存在`this.$store`这个变量.

vuex的特点是把数据单独隔离，形成一棵树状图。

单独隔离就意味着它有自己的生态系统。输入和输出，其中`action`作为数据的输入，`state`作为数据的输出.

![](https://ws2.sinaimg.cn/large/006tKfTcly1fj6cfeh9jgj30yi0nwdgf.jpg)

图中有一个奇怪的地方，多了一个mutations，而且与state相连的是mutations而不是actions。

vuex里有这么一个规则：

> 只能在`mutaions`里修改`state`，`actions`不能直接修改`state`

`mutations`修改`state`的数据，而且只能是`同步`的，不能存在`异步`的操作。如果需要异步怎么办呢？把异步操作放在`actions`里，拿到数据再通过`mutations`同步处理。

## `state`

`this.$store.state.count`

## `getters`

## `mutations`

变化,转换(英文解释). 改变state中变量的状态值. 

使用`this.$store.commit()`调用.



## `Actions`

- Action 提交的是 mutation，而不是直接变更状态
- Action 可以包含任意异步操作(这里的异步不理解)

`store.dispatch()`触发.

```js
const store = new Vuex.Store({
  state: {
    count: 0
  },
  mutations: {
    increment (state) {
      state.count++
    }
  },
  actions: {
    increment (context) { // context 对象不是 store 实例本身
      context.commit('increment')
    }
  }
})
```

Action 函数接受一个与 store 实例具有相同方法和属性的 context 对象，因此你可以调用 `context.commit` 提交一个 mutation，或者通过 `context.state` 和 `context.getters` 来获取 state 和 getters。









## 常规片段

栗子:

```vue
//组件内调用
this.$store.commit('hello'，{amount: 10}); 或者
this.$store.commit({
  type: 'hello',
  amount: 10
})
```





stroe.js

```js
import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex);

const store = new Vuex.Store({
    state: {
        count: 0
    },
    mutations: {
      //data 是额外的传参
            hello (state,data) {
            console.log(data);
            state.count = data.amount;
        }
    }
})
export default store;
```



xxx.vue

```vue
<script>
    export default {
        name: 'hello',
        data() {
            return {
                msg: ''
            }
        },
        created() {

        },
        methods: {
            sendParent: function () {
                this.$store.commit('hello',{ amount: '2017-08-01'});
            }
        }
    }
</script>
```



