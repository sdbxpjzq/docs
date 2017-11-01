[TOC]

编程题:

![](https://ws2.sinaimg.cn/large/006tNc79ly1fjcc0zd2trj30zk0qojtj.jpg)

```js
String.prototype.delete = function (num) {
            var strArr = [];
            for (var i=0;i < this.length;i++) {
                var arr = this.split('');
                arr.splice(i,num,'');
                strArr.push(arr.join(''));
            }
            var n = []; //临时数组
            for(var i = 0;i < strArr.length; i++){
                if(n.indexOf(strArr[i]) == -1) {
                    n.push(strArr[i]);
                }
            }
            console.log(n);
            return n.length;
        }

        'sogou'.delete(0) // === 1
```



# 从数组中找出重复做多的值

```js
var _arr = [3,5,2,5,2,5];
                var _res = []; //
                _arr.sort();
                for (var i = 0; i < _arr.length;i++) {
                    var count = 0;
                    for (var j = i; j < _arr.length; j++) {
                        if (_arr[i] == _arr[j]) {
                            count++;
                        }
                    }
                    _res.push([_arr[i], count]);
                }
//_res 二维数维中保存了 值和值的重复数
                var _newArr = [],sum=0,a;
                for (var i = 0; i < _res.length; i++) {
//                     console.log(_res[i][0] + "重复次数:" + _res[i][1]);
                     if(sum <= _res[i][1] ) {
                         sum = _res[i][1];
                         a = i;
                     }
                    _newArr.push(_res[i][0] + 'x' + _res[i][1]);
                }
                alert(_res[a][0])
```

