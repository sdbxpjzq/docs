# 图片懒加载

- **echo.js**--https://github.com/toddmotto/echo

```html
<body>
  <img src="img/blank.gif" alt="Photo" data-echo="img/photo.jpg">
  <script src="dist/echo.js"></script>
  <script>
  echo.init({
    offset: 100,
    throttle: 250,
    unload: false,
    callback: function (element, op) {
      console.log(element, 'has been', op + 'ed')
    }
  });

  // echo.render(); is also available for non-scroll callbacks
  </script>
</body>
```

# 时间工具

- **momentjs** — http://momentjs.cn/



# 鼠标悬停图片放大

- jQ插件(**jquery.imagezoom.js**) — http://www.ijquery.cn/?p=489



# 过渡动画库

- jQ插件(**jquery.transit.js**) — http://code.ciaoca.com/jquery/transit/



# jQuery Easing 动画效果扩展

- jQuery 的动画的 easing 参数，默认只提供 "linear" 和 "swing"（默认值），足够日常的任务需求使用，但是当我们需要更好玩的过渡效果时，就可以使用这个扩展插件！— http://code.ciaoca.com/jquery/easing/

# tween.js

- **tween.js**是一款可生成平滑动画效果的js动画库。tween.js允许你以平滑的方式修改元素的属性值。它可以通过设置生成各种类似CSS3的动画效果。
- http://www.htmleaf.com/jQuery/Layout-Interface/201501271284.html
- https://github.com/tweenjs/tween.js

#  JavaScript加密库 Crypto-JS

- CryptoJS (crypto.js) 为 JavaScript 提供了各种各样的加密算法
- https://www.oschina.net/p/crypto-js
- https://github.com/brix/crypto-js

# JavaScript日期选择 Kalendae 

- Kalendae 是一个 JavaScript 实现的日期选择工具，无需依赖其他 JS 库。
- https://www.oschina.net/p/kalendae
- https://github.com/ChiperSoft/Kalendae