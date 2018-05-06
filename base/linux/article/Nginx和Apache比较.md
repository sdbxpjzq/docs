# Nginx和Apache比较

nginx和apache最核心的区别在于apache是同步多进程模型，一个连接对应一个进程；nginx是异步的，多个连接（万级别）可以对应一个进程



nginx相对于apache的优点： 
1.轻量级，同样是web 服务，比apache 占用更少的内存及资源 
2.抗并发，nginx 处理请求是异步非阻塞的，而apache 则是阻塞型的，在高并发下nginx 能保持低资源低消耗高性能 
3.高度模块化的设计，编写模块相对简单 
4.社区活跃，各种高性能模块出品迅速

5.Nginx 静态处理性能比 Apache 高 3倍以上

6.Nginx本身就是一个反向代理服务器

7.Nginx支持7层负载均衡；

