

[技术胖博客](http://jspang.com/2017/08/15/react_basic/)

[技术胖视频](http://v.qq.com/vplus/bab1a460a0f05fd4/folders)

[react中文](http://www.css88.com/react/)



react特点：

- **虚拟DOM: R**eact也是以数据驱动的，每次数据变化React都会扫码整个虚拟DOM树，自动计算与上次虚拟DOM的差异变化，然后针对需要变化的部分进行实际的浏览器DOM更新。
- **组件化： R**eact可以从功能角度横向划分，将UI分解成不同组件，各组件都独立封装，整个UI是由一个个小组件构成的一个大组件，每个组件只关系自身的逻辑，彼此独立。
- **单项数据流：**React设计者认为数据双向绑定虽然便捷，但在复杂场景下副作用也是很明显，所以React更倾向于单向的数据流动-从父节点传递到子节点。（使用ReactLink也可以实现双向绑定，但不建议使用）



# 可控组件和不可控组件

## 可控组件

```html
<input type="text"  value={this.state.userName} />
```

## 不可控组件

既不能修改也不能删除.

```html
<input  type="text"  value="123" />
```

可以通过`defaultValue`设置value.

```html
<input type="text" defaultValue="123"/>
```



# 条件渲染

https://www.jianshu.com/p/fe5205b33707





# 表单处理





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

getDefaultProps() 设置默认props, 属性是不变化的

getInitialState() 设置state状态, 状态是变化的

componentWillMount() 组件出现之前

render() 组件渲染

componentDidMount() 组件渲染完成

componentWillUnmount()// 将要销毁组件



下面这些方法不会在首次 `render` 组件的周期调用

componentWillUpdate(object nextProps, object nextState)

componentDidUpdate(object prevProps, object prevState)

# PropTypes

props检查

https://segmentfault.com/a/1190000007814801

```js
import React from 'react'
import {Prompt} from 'react-router-dom'

class propTypes extends React.Component{
    constructor(props, context) {
        super(props, context);
    }


    render () {
        return (
            <h2>{this.props.title}</h2>
        )
    }
}
// 设置默认属性
propTypes.defaultProps = {
    title:'2323'
};
// props检查 16的版本不是这么写了
propTypes.propTypes = {
    title: React.PropTypes.string.isRequired
}

export default propTypes;
```







# React.Component 和 React.createClass一点点区别- 也挺重要

http://www.tuicool.com/articles/nYj2aq



# 脚手架— create-react-app      

https://segmentfault.com/a/1190000006055973



```shell
npm install -g create-react-app
create-react-app reactapp
cd reactapp/
npm start
```





# 项目参考

https://haishanh.github.io/doba-react/#/



# 其他

[社区](http://react-china.org/)

