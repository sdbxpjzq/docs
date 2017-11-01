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



# 时钟案例

```js
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div id="root"></div>
</body>
<script src="//cdn.bootcss.com/react/15.5.4/react.min.js"></script>
<script src="//cdn.bootcss.com/react/15.5.4/react-dom.min.js"></script>
<script src="../lib/babel.min.js"></script>
<script type="text/babel">
    function timeFun() {
        const strhtml = (
                <div>
                    {/*<p>jsx代码部分</p>  注释的写法*/}
                    <div>time: {new Date().toLocaleString()}</div>
                </div>
        );
        ReactDOM.render(
            strhtml ,
            document.getElementById('root')
        )
    }
    setInterval(timeFun,1000);
//    创建虚拟dom, 只改变虚拟dom
</script>
</html>
```



# mixin 混合



#  refs  访问DOM

```js
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>refs</title>
</head>
<body>
refs 访问 dom
<div id="root"></div>
</body>
<script src="//cdn.bootcss.com/react/15.5.4/react.min.js"></script>
<script src="//cdn.bootcss.com/react/15.5.4/react-dom.min.js"></script>
<script src="https://b4-q.mafengwo.net/s10/M00/41/A7/wKgBZ1k99S-AQgoQAAv5hCkoCjw0625.js"></script>
<!--<script src="../lib/babel.min.js"></script>-->
<script type="text/babel">
    class HelloName extends React.Component {
        constructor(props){
            super(props)
            this.state = {
                msg: ''
            }
        }
        add() {
            let a = this.refs.name // 这里获取
            console.log(a);
            console.log(a.value);
            this.setState({ // 这是状态积
                msg: '输入的是---' +a.value
            })
        }
        render() {
            return (
                   <div>
                       <p>
                           <input type="text" ref="name"/> // 给个标志吧
                       </p>
                       <p>
                           <button onClick={this.add.bind(this)}>提交</button>
                       </p>
                       <p>{this.state.msg}</p>
                   </div>
            )
        }
    }
    ReactDOM.render(
            <HelloName name="zong Qi"/>,
        document.getElementById('root')
    )
</script>
</html>
```





# 生命周期

https://hulufei.gitbooks.io/react-tutorial/content/component-lifecycle.html

![](https://ws4.sinaimg.cn/large/006tNbRwly1fgi60pqgx9j30v80j8q5s.jpg)

![](https://ws3.sinaimg.cn/large/006tNbRwly1fgi67rov2rj30rs0bq760.jpg)



# React.Component 和 React.createClass一点点区别- 也挺重要

http://www.tuicool.com/articles/nYj2aq

