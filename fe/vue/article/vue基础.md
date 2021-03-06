[TOC]



# vue2.0手册

- https://vuefe.cn/v2/guide/


vue 后台

- http://panjiachen.github.io/vue-element-admin/#/introduction/index
- ​



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



## 下拉绑定

```vue
<select v-model="selected">
       <option v-for="(val, key) in areaCode"  :value="key">{{val}} +{{key}}</option>
</select>

var vm = new Vue({
       el: '#app',
       data: {
           selected: 86, // 默认选中的
       },
}
```

https://segmentfault.com/q/1010000007314174/a-1020000007315511



## **ref**

在普通的 DOM 元素上使用，引用指向的就是 DOM 元素.

- 绑定`DOM` 

```js
<!-- vm.$refs.p will be the DOM node -->
<p ref="p">hello</p>
```



https://vuefe.cn/v2/api/#ref

http://jingyan.baidu.com/article/acf728fd5ee4acf8e510a3cc.html



## v-bind:style

### 对象语法

每一个都是`javascript`对象. 

可以用`驼峰式 (camelCase) `名称,例如`fontSize` 

可以用`短横线分隔` 例如`'font-size'`. 必须使用`单引号`括起来

```vue
<div v-bind:style="{ color: activeColor, fontSize: fontSize + 'px' }"></div>
<div v-bind:style="{ color: activeColor, 'font-size': fontSize + 'px' }"></div>
<script>
  data: {
  activeColor: 'red',
  fontSize: 30
}
</script>
```

### 数组语法

```vue
<div v-bind:style="[baseStyles, overridingStyles]"></div>
```



### 自动添加前缀

当 `v-bind:style` 使用需要添加[浏览器引擎前缀](https://developer.mozilla.org/zh-CN/docs/Glossary/Vendor_Prefix)的 CSS 属性时，如 `transform`，Vue.js 会自动侦测并添加相应的前缀.



### 多值

从 2.3.0 起你可以为 `style` 绑定中的属性提供一个包含多个值的数组，常用于提供多个带前缀的值

```vue
<div :style="{ display: ['-webkit-box', '-ms-flexbox', 'flex'] }"></div>
```

这样写只会渲染数组中最后一个被浏览器支持的值.



## keep-alive

<keep-alive>是Vue的内置组件，能在组件切换过程中将状态保留在内存中，防止重复渲染DOM。



## methods

> **不应该使用箭头函数来定义 method 函数**

## watch

> 不应该是使用 箭头函数来定义`watch`函数

```js
computed: {
            a: function () {
                return this.$store.state.count;
            }
        },
watch: {
    a: function(val,oldVal) {
        alert('我 watch 到了 a');
        alert('currval:'+val);
        alert('oldVal:'+oldVal);
	}
},
```



## .sync

字组件去改变`pros`里的变量.

父组件 ==> 字组件 传值, 我们会用到 `props`传值. 但是父组件传通过`props`传过来的值, 字组件并不能修改. `.sync`语法糖来做.

父组件:

```vue
<suba :toChild.sync="msg"></suba>
export default {
        name: 'app',
        data() {
            return {
                msg: '我是APP.vue来的信息', // 传给字组件
            }
        },
}
```

子组件:

```vue
<p>来自父元素的信息: {{toChild}}</p>
<p @click="hello">点击我</p>

export default {
        name: 'hello',
        data() {
            return {
            }
        },
        props: ['toChild'],
        methods: {
            hello() {
                this.$emit('update:toChild','我是subhead.vue');  // update: 是固定的
            }
        }
    }
```



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







- ​


# props



## props验证

```js
props: {
           iTimeStamp: {
               required: true, // 必须传递的
               type: Number, // 类型
               default : 100 // 默认值
           },
       },
```

`type` 可以是以下原生构造函数之一：

- String
- Number
- Boolean
- Function
- Object
- Array
- Symbol

除了以上这些，`type` 还可以是一个自定义构造函数，在通过 `instanceof` 检测时，此构造函数会被用于进行类型推断。

# delimiters 选项

delimiters的作用是改变我们插值的符号。Vue默认的插值是双大括号{{}}。但有时我们会有需求更改这个插值的形式。

```vue
delimiters:['${','}']
```




# vue虚拟节点




# vue 服务端渲染

https://vuefe.cn/v2/guide/ssr.html

https://segmentfault.com/a/1190000007933349



#  常见问题

http://www.xiaoxiaohan.com/js/30.html



