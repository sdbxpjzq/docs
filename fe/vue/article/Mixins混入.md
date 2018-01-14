# Mixins 混入

Mixins一般有两种用途：

1、在你已经写好了构造器后，需要增加方法或者临时的活动时使用的方法，这时用混入会减少源代码的污染。

2、很多地方都会用到的公用方法，用混入的方法可以减少代码量，实现代码重用。



## 代码实例

`Index.vue`

```vue
<template>
    <div class="hello">
        <p>{{num}}</p>
        <button @click="add">增加</button>
    </div>
</template>

<script>
    // todo 新添加的需求就可以使用mixins
    import addConsole from './addConsole.js'

    // todo 全局的Api
    import globalConsole from './globalMixin.js'
    // todo 执行顺序  全局mixin的updated --> 局部mixin的updated  --> 原生的updated
    export default {
        name: 'hello',
        data() {
            return {
                num: 0
            }
        },
        mixins: [
            addConsole,
        ],
        created() {

        },
        updated(){
            // todo mixins先执行, 原生的后执行
            console.log('我的原生的updated')
        },
        methods: {
            add: function () {
                this.num++;
            },

        },
    }
</script>
```

`addConsole.js`

```js

let addConsole = {
    // 这里是vue的生命周期
    updated(){
        console.log('mixins 数据发生变化了'+this.num)
    }
};
export default addConsole;
```

`globalConsole.js`

```js
import Vue from 'vue'
Vue.mixin({
    updated(){
        console.log('我是全局的混入 global mixins');
    }
});
```



























