# Buffer

http://www.runoob.com/nodejs/nodejs-buffer.html

JavaScript 语言自身只有字符串数据类型，没有二进制数据类型。

但在处理像TCP流或文件流时，必须使用到二进制数据。因此在 Node.js中，定义了一个 Buffer 类，该类用来创建一个专门存放二进制数据的缓存区。

## 创建 Buffer 类

- 创建长度为 10 字节的 Buffer 实例：

```js
var buf = new Buffer(10);
```

- 通过给定的数组创建 Buffer 实例：

```js
 var buf = new Buffer([1,3.14]);
buf[0]; // 1
buf[1]; // 3 并不是 3.14,
```



![](https://ws1.sinaimg.cn/large/006tKfTcly1flhdc4f6zsj30po0gkdgg.jpg)



![](https://ws3.sinaimg.cn/large/006tKfTcly1flhdbnybvlj314o0kwdjt.jpg)

