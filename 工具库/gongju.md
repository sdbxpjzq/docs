# 图片懒加载

- echo.js--https://github.com/toddmotto/echo

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

- 鼠标悬停图片放大镜特效、参数和最简教程 — http://momentjs.cn/



# 鼠标悬停图片放大

- jQ插件(jquery.imagezoom.js) — http://www.ijquery.cn/?p=489



# 过渡动画库

- jQ插件(jquery.transit.js) — http://code.ciaoca.com/jquery/transit/



# jQuery Easing 动画效果扩展

- jQuery 的动画的 easing 参数，默认只提供 "linear" 和 "swing"（默认值），足够日常的任务需求使用，但是当我们需要更好玩的过渡效果时，就可以使用这个扩展插件！— http://code.ciaoca.com/jquery/easing/