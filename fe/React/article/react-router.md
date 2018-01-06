[TOC]

# react-router

```shell
npm install --save react-router react-router-dom
```

`router.js`

```js
import {BrowserRouter as Router, Switch, Route, Redirect} from 'react-router-dom';

const Routes = () => (
    <Router>
        <Switch>
            <Route path="/" exact component={Hello}/>
            <Route path="/test" exact component={Test}/>
            <Route path="/a" exact component={A}/>
        </Switch>
    </Router>
);
export default Routes;

```

## `exact`精确匹配

```js
<Route path='/roster'/>
// 当路径名为'/'时, path不匹配
// 当路径名为'/roster'或'/roster/2'时, path匹配
// 当你只想匹配'/roster'时，你需要使用"exact"参数
// 则路由仅匹配'/roster'而不会匹配'/roster/2'
<Route exact path='/roster'/>
```

## NavLink

相当于`a`标签

```js
import React from 'react'
import { NavLink } from 'react-router-dom'

class Hello extends React.Component {
  constructor(props, context) {
    super(props, context);
  }

  render () {
    return (
        <div>
            <div>
                <NavLink exact to="/a/111">a页面</NavLink>
                <NavLink exact to="/test">test页面</NavLink>
            </div>

        </div>
    )
  }
}
export default Hello;
```



## 传值

通过`props`传递

```js
<NavLink exact className="red" to="/a/1212">传参数</NavLink>

```

```js
<Route path="/a/:id"  component={APage}/>
```

APage

```js
console.log(this.props.match.params.id)
```





## 路由属性和路由模式

basename  增加层级

basename的作用是个我们增加一级导航目录，比如以前的导航目录是：http://localhost:1717/Jspangb  现在想访问同一个页面，但是路径变成http://localhost:1717/demo/Jspangb。这时候就可以使用basename属性来设置。basename属性是放在<router>标签里边的。

forceRefresh 强制刷新

这个属性的作用是开启或者关闭React Router，也就是说如果你把forceRefresh的值设置成真，它将关闭React路由系统，而真实的去服务器端请求信息。

现在我们把forceRefresh设置成true，你会发现路由已经不能使用了。

## 5种路由方式

我们一直在使用的路由方式是BrowserRouter，也就是浏览器的路由方式，其实React还有几种路由方式：

1. **BrowserRouter**：浏览器的路由方式，也是我们一直在学习的路由方式，在开发中最常使用。
2. **HashRouter**：在路径前加入#号成为一个哈希值。Hash模式的好处是，再也不会因为我们刷新而找不到我们的对应路径了。
3. **MemoryRouter**：不存储history，所有路由过程保存在内存里，不能进行前进后退，因为地址栏没有发生任何变化。
4. **NativeRouter**：经常配合ReactNative使用，多用于移动端，以后ReactNative课程中会详细讲解。
5. **StaticRouter**：设置静态路由，需要和后台服务器配合设置，比如设置服务端渲染时使用。





## prompt

在很多网站应用中，当你想离开页面时都会弹出一个提示框（alert），让你选择是否残忍离开。React路由也为我们准备了这样的组件，就是prompt。

**<Prompt>标签有两个属性：**

1. message：用于显示提示的文本信息。
2. when：传递布尔值，相当于标签的开关，默认是true，设置成false时，<Prompt>失效。

```js
import React from 'react';
import {Prompt} from 'react-router-dom';
export default class jspangb extends React.Component{


    constructor(props){
        super(props);
        this.state={
            power:false
        }
        this.changePower=this.changePower.bind(this);
    }
    changePower(){
        alert('已经开启');
        this.setState({
            power:true
        })
    }

    render(){
        return(
            <div>
                <p> B页面</p>
                <Prompt message="残忍离开？" when={this.state.power}/>
                <button onClick={this.changePower}>启用</button>
            </div>
        )
    }
}
```



