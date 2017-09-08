# Promise

http://www.jianshu.com/p/063f7e490e9a

https://juejin.im/entry/59afb90c5188252444428536?utm_source=gold_browser_extension

# export

https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Statements/export

2种常见形式

```js
// 定义一个混合对象
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

