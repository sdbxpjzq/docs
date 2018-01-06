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
    <div class="dialog__wrapper" v-if="visble" @clcik="closeModal">
      <div class="dialog">
        <div class="dialog__header">
          <div class="dialog__title">{{ title }}</div>
        </div>
        <div class="dialog__body">
          <slot></slot>
        </div>
        <div class="dialog__footer">
          <slot name="footer"></slot>
        </div>
      </div>
    </div>
    <div class="modal" v-show="visible"></div>
  </div>
</template>

<script>
  export default {
    name: 'dialog',
    props: {
      title: String,
      visible: {
        type: Boolean,
        default: false
      }
    },
    methods: {
      close() {
        this.$emit('update:visible', false) // 传递关闭事件
      },
      closeModal(e) {
        if (this.visible) {
          document.querySelector('.dialog').contains(e.target) ? '' : this.close(); // 判断点击的落点在不在dialog对话框内，如果在对话框外就调用this.close()方法关闭对话框
        }
      }
    }
  }
</script>
```

外部调用:

```vue
<template>
  <div class="xxx">
    <dialog :visible.sync="visible"></dialog> 
    <button @click="openDialog"></button>
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
        visible: false
      }
    },
    methods: {
      openDialog() {
        this.visible = true // 通过data显式控制dialog
      }
    }
  }
</script>
```





# 参考

https://molunerfinn.com/vue-components/#Notice



