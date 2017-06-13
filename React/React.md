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



# 创建节点



# 生命周期

https://hulufei.gitbooks.io/react-tutorial/content/component-lifecycle.html

![](https://ws4.sinaimg.cn/large/006tNbRwly1fgi60pqgx9j30v80j8q5s.jpg)

![](https://ws3.sinaimg.cn/large/006tNbRwly1fgi67rov2rj30rs0bq760.jpg)

