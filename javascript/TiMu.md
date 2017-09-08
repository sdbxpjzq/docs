[TOC]

编程题:

![](https://ws2.sinaimg.cn/large/006tNc79ly1fjcc0zd2trj30zk0qojtj.jpg)

```js
String.prototype.delete = function (num) {
            var arr = this.split('');
            var strArr = [];
            for (var i=0;i < arr.length;i++) {
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

        'ssogou'.delete(3)
```

