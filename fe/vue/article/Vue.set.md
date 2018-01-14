# Vue.set

`Vue.set` 的作用就是在构造器外部操作构造器内部的数据、属性或者方法。比如在vue构造器内部定义了一个count为1的数据，我们在构造器外部定义了一个方法，要每次点击按钮给值加1.就需要用到Vue.set。

## 为什么要有Vue.set的存在?

由于Javascript的限制，Vue不能自动检测以下变动的数组。

*当你利用索引直接设置一个项时，vue不会为我们自动更新。

*当你修改数组的长度时，vue不会为我们自动更新。

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="../assets/js/vue.js"></script>
    <title>Vue.set 全局操作</title>
</head>
<body>
    <h1>Vue.set 全局操作</h1>
    <hr>
    <div id="app">
        <ul>
            <li v-for=" aa in arr">{{aa}}</li>
        </ul>
       
    </div>
    <button onclick="add()">外部添加</button>
 
    <script type="text/javascript">
     
        function add(){
            console.log("我已经执行了");
           app.arr[1]='ddd';
           //Vue.set(app.arr,1,'ddd');
        }
        var outData={
            arr:['aaa','bbb','ccc']
        };
        var app=new Vue({
            el:'#app',
            data:outData
        })
    </script>
</body>
</html>
```

