# Stream 流

`Stream` 有四种流类型：

- **Readable** - 可读操作。
- **Writable** - 可写操作。
- **Duplex** - 可读可写操作.
- **Transform** - 操作被写入数据，然后读出结果

![](https://ws3.sinaimg.cn/large/006tKfTcgy1fliplexywej30ys0ewabe.jpg)



所有的 `Stream` 对象都是` EventEmitter` 的实例。常用的事件有：

- **data** - 当有数据可读时触发。
- **end** - 没有更多的数据可读时触发。
- **error** - 在接收和写入过程中发生错误时触发。
- **finish** - 所有数据已被写入到底层系统时触发。



![](https://ws1.sinaimg.cn/large/006tKfTcgy1flijcpy0shj313a0s2tex.jpg)

