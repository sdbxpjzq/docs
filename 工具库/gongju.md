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

