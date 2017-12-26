[TOC]

# window.open被浏览器拦截

```js
$('.onebuy').one('click', function () {
     $.post('', function (res) {
         if (res.data.code == 1000) {
              window.open(res.data.url)
         } else {
             return;
         }
      }, 'json');
           
        });
    }
```

可惜不幸的是被浏览器拦截了.😂

**被拦截的原因：**

浏览器安全机制中，页面弹窗，必须是在用户触发的，才算合法弹窗；由ajax或定时执行的弹窗均为非用户触发。会被浏览器或相关安全软件理解为广告被拦截掉.

## 解决

但是当遇到错误的时候会打开空白页面

```js
xx.addEventListener('click', function () {
 var url = '';
            ajax().done(function() {
                // 重定向到目标页面
              url = 'target url';
            });
  // 先发请求, 等待执行
  setTimeout(function(){
    if(url){
      var newWin = window.open('loading page');
       newWin.location.href = url;
       }
  	},500);
 });
```