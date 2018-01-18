# Cookie 的 HttpOnly 和 Secure 属性作用

下面两个属性都属于Cookie安全方面考虑的。这要视浏览器或服务端有没有支持。

## Secure

Cookie的`Secure`属性，意味着保持Cookie通信只限于加密传输，指示浏览器仅仅在通过`安全/加密`连接才能使用该Cookie。如果一个Web服务器从一个非安全连接里设置了一个带有`secure`属性的Cookie，当Cookie被发送到客户端时，它仍然能通过`中间人攻击`来拦截。

## HttpOnly

Cookie的`HttpOnly`属性，指示浏览器不要在除HTTP（和 HTTPS)请求之外暴露Cookie。一个有`HttpOnly`属性的Cookie，不能通过非HTTP方式来访问，例如通过调用JavaScript(例如，引用 `document.cookie`），因此，不可能通过跨域脚本（一种非常普通的攻击技术）来偷走这种Cookie。尤其是Facebook 和 Google 正在广泛地使用`HttpOnly`属性。