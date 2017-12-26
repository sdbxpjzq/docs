[TOC]

# document.cookie



|         | 可选。规定 cookie 的有效期。                      |
| :-----: | --------------------------------------- |
| expires | 可选.    规定 cookie 的有效期. 支持 `UTC`和`GMT`时间 |
|  path   | 可选。规定 cookie 的服务器路径。                    |
| domain  | 可选。规定 cookie 的域名。                       |
| secure  | 可选。规定是否通过安全的 HTTPS 连接来传输 cookie。        |





## 创建cookie

```js
function setCookie(cname,cvalue,exdays,path)
{
  var d = new Date();
  // 将毫秒设置Date 对象
  d.setTime(d.getTime()+(exdays*24*60*60*1000));
  var expires = "expires="+d.toUTCString(); //toGMTString 废弃 ,UTC 和 GMT 一样
  path = "path="+ path || '/';
  document.cookie = cname + "=" + cvalue + "; " + expires + ";"+ path;
}
```

​	

## 读取cookie

```js
function getCookie(cname)
{
  var name = cname + "=";
  var ca = document.cookie.split(';'); // 将cookie分割成数组
  for(var i=0; i<ca.length; i++) 
  {
    var c = ca[i].trim();
    if (c.indexOf(name)==0)
      return c.substring(name.length,c.length);
  }
  return "";
}
```



## 删除cookie

设置 `expires` 参数为以前的时间即可.将旧的cookie覆盖掉.

```js
function(c_name){
	var exdate = new Date();
	exdate.setDate(exdate.getDate()-1);//昨天日期
	document.cookie =c_name+"=;expires="+exdate.toGMTString();
}
```