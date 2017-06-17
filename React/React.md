# hello world

```js
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello</title>
</head>
<body>
<div id="root"></div>
</body>
<script src="//cdn.bootcss.com/react/15.5.4/react.min.js"></script>
<script src="//cdn.bootcss.com/react/15.5.4/react-dom.min.js"></script>
<script src="https://b4-q.mafengwo.net/s10/M00/41/A7/wKgBZ1k99S-AQgoQAAv5hCkoCjw0625.js"></script>
<!--<script src="../lib/babel.min.js"></script>-->
<script type="text/babel">
    class HelloName extends React.Component {
        render() {
            return (
                <div>Hello {this.props.name}</div>
            )
        }
    }
    ReactDOM.render(
        <HelloName name="zong Qi"/>, // 传值
        document.getElementById('root') // 挂载
    )
</script>
</html>
```



# React.createElement 创建节点



```js
<script type="text/babel">
    var child1 = React.createElement('h1',null, 'hello world');
    var child2 = React.createElement('h1',null, 'hello zong');
    var root = React.createElement('div',{id: 'welcome'}, child1,child2);
    ReactDOM.render(
//        jsx
//        <div id="welcome">
//            <h1>hello</h1>
//            <h1>world</h1>
//        </div>
        root
        ,document.getElementById('root'));
</script>
```



# 生命周期

https://hulufei.gitbooks.io/react-tutorial/content/component-lifecycle.html

![](https://ws4.sinaimg.cn/large/006tNbRwly1fgi60pqgx9j30v80j8q5s.jpg)

![](https://ws3.sinaimg.cn/large/006tNbRwly1fgi67rov2rj30rs0bq760.jpg)



# React.Component 和 React.createClass一点点区别- 也挺重要

http://www.tuicool.com/articles/nYj2aq

