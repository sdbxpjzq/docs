[TOC]

# 传统的认证系统

- 用户在登录域输入用户名和密码，然后点击登录；
- 请求发送之后，通过在后端查询数据库验证用户的合法性。如果请求有效，使用在数据库得到的信息创建一个 session，然后在响应头信息中返回这个 session 的信息，目的是把这个 session ID 存储到浏览器中；
- 在访问应用中受限制的后端服务器时提供这个 session 信息；
- 如果 session 信息有效，允许用户访问受限制的后端服务器，并且把渲染好的 HTML 内容返回。

# 基于 token 的认证

将会用到下面的控制流程：

- 用户在登录表单中输入 用户名 和 密码 ，然后点击 登录 ；
- 请求发送之后，通过在后端查询数据库验证用户的合法性。如果请求有效，使用在数据库得到的信息创建一个 token，然后在响应头信息中返回这个的信息，目的是把这个 token 存储到浏览器的本地存储中；
- 在每次发送访问应用中受限制的后端服务器的请求时提供 token 信息；
- 如果从请求头信息中拿到的 token 有效，允许用户访问受限制的后端服务器，并且返回 JSON 或者 XML。

![](https://ws3.sinaimg.cn/large/006tKfTcly1fln7a2p8laj30dw05iwek.jpg)



## **JWT**

JWT 代表 JSON Web Token ，它是一种用于认证头部的 token 格式。

一个不记名 token 包含了三部分：header，payload，signature。

- header 是 token 的一部分，用来存放 token 的类型和编码方式，通常是使用 base-64 编码。
- payload 包含了信息。你可以存放任一种信息，比如用户信息，产品信息等。它们都是使用 base-64 编码方式进行存储。
- signature 包括了 header，payload 和密钥的混合体。密钥必须安全地保存储在服务端。

![](https://ws1.sinaimg.cn/large/006tKfTcly1fln7bx28anj30dw0andg8.jpg)



如何实现不记名 token 生成器函数，因为它对于很多常用的语言已经有多个版本的实现.

- NodeJS: [auth0/node-jsonwebtoken · GitHub](http://github.com/auth0/node-jsonwebtoken)
- PHP: [firebase/php-jwt · GitHub](http://github.com/firebase/php-jwt)
- Java: [auth0/java-jwt · GitHub](http://github.com/auth0/java-jwt)
- Ruby: [progrium/ruby-jwt · GitHub](http://github.com/progrium/ruby-jwt)
- .NET: [AzureAD/azure-activedirectory-identitymodel-extensions-for-dotnet · GitHub](http://github.com/AzureAD/azure-activedirectory-identitymodel-extensions-for-dotnet)
- Python: [progrium/pyjwt · GitHub](http://github.com/progrium/pyjwt/)





















