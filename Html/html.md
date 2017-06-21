#  <select> 多选-multiple

```html
<select multiple="multiple">
  <option value='1'>11</option>
  <option value='2'>22</option>
  <option value='3'>33</option>
</select>
```



#  a标签使用href=”javascript:void(0); target="_blank"  在火狐浏览器跟chrome 不兼容

```js
<a href="javascript:void (0);"  target="_blank">看我会不会跳转新页</a>
```

在火狐浏览器中会跳转 白页.

解决办法:

`onclick='return false`'  或者` target=""`



