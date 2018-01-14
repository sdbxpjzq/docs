[TOC]

# vue组件的三种调用方式

主要讲三种方式调用组件：

- `v-model`或者`.sync`显式控制组件显示隐藏(标签式调用)
- 通过js代码调用
- 通过Vue指令调用

## 标签式调用

`Dialog.vue`

```vue
<template>
  <div class="dialog">
    <p> hello {{name}}</p>
  </div>
</template>

<script>
  export default {
    name: 'dialog',
    props: {
      name: String,
    },
    methods: {
    }
  }
</script>
```

外部调用:

```vue
<template>
  <div class="xxx">
    // 标签式调用
    <dialog :name="zong" :visible.sync="visible"></dialog> 
  </div>
</template>

<script>
  import Dialog from 'Dialog'
  export default {
    components: {
      Dialog
    },
    data() {
      return {
      }
    },
    methods: {
     
    }
  }
</script>
```



## js调用extend创建的组件

`notice.vue`

```vue
<template>
    <div>
        <p>hello {{content}}</p>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                content: ''
            }
        },
    }
</script>
```

`notice.js`

```js
import Vue from 'vue'

let noticeTmp = Vue.extend(require('./Author.vue'));
const notice = (content) => {
    const noticeObj = new noticeTmp({
        data: {
            content: content
        }
    }); // 实例化一个带有content内容的Notice

    noticeObj.vm = noticeObj.$mount(); // 挂载但是并未插入dom，是一个完整的Vue实例
    noticeObj.dom = noticeObj.vm.$el;
    console.log(noticeObj.dom)
    document.body.appendChild(noticeObj.dom); // 将dom插入body
    return noticeObj.vm;
};
export default {
    install: Vue => {
        Vue.prototype.$notice = notice // 将Notice组件暴露出去，并挂载在Vue的prototype上
    }
}
```

`Index.vue`

```vue
<template>
    <div class="hello">
        <button @click="hello">js触发extend组件</button>
    </div>
</template>

<script>
    import Vue from 'vue'
  //引入js
    import notice from './author'
  // use
    Vue.use(notice);
    export default {
        data() {
            return {
            }
        },
        methods: {
            hello() {
                // js触发组件
                this.$notice('hi zongqi');
            }
        }
    }
</script>
```









# 参考

https://molunerfinn.com/vue-components/#Notice



