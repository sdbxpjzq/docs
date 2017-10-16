# Promise

http://www.jianshu.com/p/063f7e490e9a

https://juejin.im/entry/59afb90c5188252444428536?utm_source=gold_browser_extension

## 为什么去使用Promise?

通常我们写一个ajax去实现.

```js
// 简单的ajax原生实现
var url = 'https://hq.tigerbrokers.com/fundamental/finance_calendar/getType/2017-02-26/2017-06-10';
var result;

var XHR = new XMLHttpRequest();
XHR.open('GET', url, true);
XHR.send();

XHR.onreadystatechange = function() {
    if (XHR.readyState == 4 && XHR.status == 200) {
        result = XHR.response;
        console.log(result);
    }
}
```

在ajax的原生实现中，利用了onreadystatechange事件，当该事件触发并且符合一定条件时，才能拿到我们想要的数据，之后我们才能开始处理数据.

这样做看上去并没有什么麻烦，但是如果这个时候，我们还需要做另外一个ajax请求，这个新的ajax请求的其中一个参数，得从上一个ajax请求中获取，这个时候我们就不得不如下这样做：

```js
var url = 'https://hq.tigerbrokers.com/fundamental/finance_calendar/getType/2017-02-26/2017-06-10';
var result;

var XHR = new XMLHttpRequest();
XHR.open('GET', url, true);
XHR.send();

XHR.onreadystatechange = function() {
    if (XHR.readyState == 4 && XHR.status == 200) {
        result = XHR.response;
        console.log(result);

        // 伪代码
        var url2 = 'http:xxx.yyy.com/zzz?ddd=' + result.someParams;
        var XHR2 = new XMLHttpRequest();
        XHR2.open('GET', url, true);
        XHR2.send();
        XHR2.onreadystatechange = function() {
            ...
        }
    }
}
```

当出现第三个ajax(甚至更多)仍然依赖上一个请求的时候，我们的代码就变成了一场灾难。这场灾难，往往也被称为**回调地狱**。

因此我们需要一个叫做Promise的东西.



```js
function want() {
    console.log('这是你想要执行的代码');
}

function fn(want) {
    console.log('这里表示执行了一大堆各种代码');

    // 返回Promise对象
    return new Promise(function(resolve, reject) {
        if (typeof want == 'function') {
            resolve(want); // 修改为resolved状态
        } else {
            reject('TypeError: '+ want +'不是一个函数') // 修改为rejected状态
        }
    })
}

fn(want).then(function(want) {
    want();
})

fn('1234').catch(function(err) {
    console.log(err);
})
```

## Promise三种状态

- **`pending`**: 等待中，或者进行中，表示还没有得到结果
- **`resolved`**(`Fulfilled`): 已经完成，表示得到了我们想要的结果，可以继续往下执行
- **`rejected`**: 也表示得到结果，但是由于结果并非我们所愿，因此拒绝执行

这三种状态不受外界影响，而且状态只能从`pending`改变为`resolved`或者`rejected`，**并且不可逆**。在`Promise`对象的构造函数中，将一个函数作为第一个参数。而这个函数，就是用来处理Promise的状态变化。



## Promise的then方法

`Promise`对象中的`then`方法，可以接收构造函数中处理的状态变化，并分别对应执行.

```js
function fn(num) {
    return new Promise(function(resolve, reject) {
        if (typeof num == 'number') {
            resolve();
        } else {
            reject();
        }
    }).then(function() {
        console.log('参数是一个number值');
    }, function() {
        console.log('参数不是一个number值');
    })
}

fn('hahha');
fn(1234);
```

`then`方法的执行结果也会返回一个`Promise`对象。因此我们可以进行`then`的`链式执行`，这也是解决回调地狱的主要方式。

```js
function fn(num) {
    return new Promise(function(resolve, reject) {
        if (typeof num == 'number') {
            resolve();
        } else {
            reject();
        }
    })
    .then(function() {
        console.log('参数是一个number值');
    })
    .then(null, function() {
        console.log('参数不是一个number值');
    })
}

fn('hahha');
fn(1234);
```



写一个例子大家领悟:

```js
var fn = function(num) {
    return new Promise(function(resolve, reject) {
        if (typeof num == 'number') {
            resolve(num);
        } else {
            reject('TypeError');
        }
    })
}

fn(2).then(function(num) {
    console.log('first: ' + num);
    return num + 1;
})
.then(function(num) {
    console.log('second: ' + num);
    return num + 1;
})
.then(function(num) {
    console.log('third: ' + num);
    return num + 1;
});

// 输出结果
first: 2
second: 3
third: 4
```



上面提到的ajax请求可以这么实现:

```js
var url = 'https://hq.tigerbrokers.com/fundamental/finance_calendar/getType/2017-02-26/2017-06-10';

// 封装一个get请求的方法
function getJSON(url) {
    return new Promise(function(resolve, reject) {
        var XHR = new XMLHttpRequest();
        XHR.open('GET', url, true);
        XHR.send();

        XHR.onreadystatechange = function() {
            if (XHR.readyState == 4) {
                if (XHR.status == 200) {
                    try {
                        var response = JSON.parse(XHR.responseText);
                        resolve(response);
                    } catch (e) {
                        reject(e);
                    }
                } else {
                    reject(new Error(XHR.statusText));
                }
            }
        }
    })
}

getJSON(url).then(resp => console.log(resp));
```

## Promise.all

当有一个`ajax`请求，它的参数需要另外2个甚至更多请求都有返回结果之后才能确定，那么这个时候，就需要用到`Promise.all`来帮助我们应对这个场景.



`Promise.all`接收一个`Promise对象`组成的数组作为参数，当这个数组所有的`Promise`对象状态都变成`resolved`或者`rejected`的时候，它才会去调用`then`方法。

```js
var url = 'https://hq.tigerbrokers.com/fundamental/finance_calendar/getType/2017-02-26/2017-06-10';
var url1 = 'https://hq.tigerbrokers.com/fundamental/finance_calendar/getType/2017-03-26/2017-06-10';

function renderAll() {
    return Promise.all([getJSON(url), getJSON(url1)]); // 数组参数
}

renderAll().then(function(value) {
    // 建议大家在浏览器中看看这里的value值
    console.log(value);
})
```



## Promise.race

与`Promise.all`相似的是，`Promise.race`都是以一个`Promise`对象组成的数组作为参数，不同的是，只要当数组中的**其中一个**`Promsie`状态变成`resolved`或者`rejected`时，就可以调用`.then`方法了

```js
function renderRace() {
    return Promise.race([getJSON(url), getJSON(url1)]);
}

renderRace().then(function(value) {
    console.log(value);
})
```









# export

https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Statements/export

2种常见形式

```js
// 定义一个混合对象
const myMixin = {
    created: function () {
      console.log('created mixin')
    },
    methods: {
        miXinsHello: function () {
            console.log('hello from miXinsHello!')
        }
    }
}
const yaoyao = {
    methods: {
        yaoyao: function () {
            console.log('hello from yaoyao!')
        }
    }
}

// export default myMixin
export { myMixin,yaoyao}
```

