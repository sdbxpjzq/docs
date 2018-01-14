# Vue.extend构造器的延伸

## 什么是Vue.extend

Vue.extend 返回的是一个“扩展实例构造器”,也就是预设了部分选项的Vue实例构造器。经常服务于Vue.component用来生成组件，可以简单理解为当在模板中遇到该组件名称作为标签的自定义元素时，会自动调用“扩展实例构造器”来生产组件实例，并挂载到自定义元素上。

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="../assets/js/vue.js"></script>
    <title>vue.extend-扩展实例构造器</title>
</head>
<body>
    <h1>vue.extend-扩展实例构造器</h1>
    <hr>
    <author></author>
 
    <script type="text/javascript">
       var authorExtend = Vue.extend({
           template:"<p><a :href='authorUrl'>{{authorName}}</a></p>",
           data:function(){
               return{
                   authorName:'JSPang',
                   authorUrl:'http://www.jspang.com'
               }
           }
       });
       new authorExtend().$mount('author');
    </script>
</body>
</html>
```











