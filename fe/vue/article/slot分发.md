# slot分发内容

slot是标签的内容扩展，也就是说你用slot就可以在自定义组件时传递给组件内容，组件接收内容并输出。

## 父===>子

`Index.vue`

```vue
<template>
    <div class="hello">
        <JsPang>
            <span slot="bolgUrl">{{jspangData.bolgUrl}}</span>
            <span slot="netName">hello</span>
            <span slot="skill">{{jspangData.skill}}</span>
        </JsPang>
    </div>
</template>

<script>
    import JsPang from './slot.vue'
    export default {
        name: 'hello',
        data() {
            return {
                jspangData:{
                    bolgUrl:'https://docs.zongqilive.cn',
                    netName:'琦哥',
                    skill:'Web开发'
                }
            }
        },
        components: {
            JsPang
        },
    }
</script>

```

`slot.vue`

```vue
<template>
    <div class="hello">
        <div>
            <p>博客地址：<slot name="bolgUrl"></slot></p>
            <p>网名：<slot name="netName"></slot></p>
            <p>技术类型：<slot name="skill"></slot></p>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'hello',
        data() {
            return {
            }
        },
    }
</script>
```



## 子===> 父

`slot-scope` 的值对应一个临时变量名，此变量接收从子组件中传递的 props 对象.

> 在 2.5.0+ 中，`slot-scope` 不再局限于 `<template>`，可以在任何元素或组件上使用。

`child.vue`

```vue
<template>
    <div class="hello">
        <div class="child">
            <!--name 指定名字-->
            <slot name="child" text="hello from child"></slot>
        </div>
    </div>
</template>
```

`Index.vue`

```vue
<template>
    <div class="hello">
        <child>
            <!-- slot-scope 接收从子组件中传递的 props 对象-->
            <!--slot 指定名字-->
            <div slot-scope="props" slot="child">
                <span>hello from parent</span><br>
                <span>{{ props.text }}</span>
            </div>
        </child>
    </div>
</template>
```





