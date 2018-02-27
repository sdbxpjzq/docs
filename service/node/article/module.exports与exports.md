# module.exports与exports

## 模块的输出 — module.exports

```js
function Module(id, parent) {
  this.id = id;
  this.exports = {};
  ...
}
module.exports = Module;
```

## 对外暴露变量 — exports

```js
function foo() {
  console.log('foo');
}

function bar() {
  console.log('bar');
}
// 想要将这两个函数暴露出去，可以直接使用exports
exports.foo = foo;
exports.bar = bar;
```

也可以对module.exports赋值

```js
module.exports = {
  foo: foo,
  bar: bar
}
```

但是不能直接对exports赋值.

因为这样做仅仅改变了exports的引用，而不改变module.exports。

```js
// 错误
exports = {
  foo: foo,
  bar: bar
}
```

