[TOC]



# HTTP请求方法

HTTP1.0定义了三种请求方法： GET, POST 和 HEAD方法。

HTTP1.1新增了五种请求方法：OPTIONS, PUT, DELETE, TRACE 和 CONNECT 方法。

| 序号   | 方法      | 描述                                       |
| ---- | ------- | ---------------------------------------- |
| 1    | GET     | 请求指定的页面信息，并返回实体主体。                       |
| 2    | HEAD    | 类似于get请求，只不过返回的响应中没有具体的内容，用于获取报头         |
| 3    | POST    | 向指定资源提交数据进行处理请求（例如提交表单或者上传文件）。数据被包含在请求体中。POST请求可能会导致新的资源的建立和/或已有资源的修改。 |
| 4    | PUT     | 从客户端向服务器传送的数据取代指定的文档的内容。                 |
| 5    | DELETE  | 请求服务器删除指定的页面。                            |
| 6    | CONNECT | HTTP/1.1协议中预留给能够将连接改为管道方式的代理服务器。         |
| 7    | OPTIONS | 允许客户端查看服务器的性能。                           |
| 8    | TRACE   | 回显服务器收到的请求，主要用于测试或诊断。                    |



http://www.runoob.com/http/http-methods.html

# 跨域相关

浏览器将CORS请求分成两类：

简单请求（simple request）和 非简单请求（not-so-simple request）

根据 CORS 的标准，当浏览器发送跨域请求时，如果请求不是GET或者特定POST（Content-Type只能是 application/x-www-form-urlencoded, multipart/form-data 或 text/plain的一种）时，强烈要求浏览器必须先以 OPTIONS 请求方式发送一个预请求(preflight request)，从而获知服务器端对跨源请求所支持 HTTP 方法。



# 持久链接

持久链接 指 在建立1次TCP链接后进行多次请求和响应的操作.

好处: 

减少了TCP连接的重复建立和断开所造成的额外开销,减轻了服务器端的负载.

减少了开销时间,,http请求和响应能够更早的结束,这样web页面加载更快了.









