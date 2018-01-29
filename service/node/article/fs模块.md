# fs 模块  — 文件系统

http://nodejs.cn/api/fs.html

模块中的方法均有`异步`和`同步`2个版本.

例如: 读取文件内容的函数有异步的 `fs.readFile() `和同步的 `fs.readFileSync()`。

异步的方法函数最后一个参数为回调函数，回调函数的第一个参数包含了错误信息(error)。

## 代码示例:

```js
const http = require('http');
const fs = require('fs');


// createServer([requestListener]) requestListener 是一个函数，会被自动添加到 'request' 事件。
let server = http.createServer(function (requst, response) {
    response.writeHeader(200,{'Content-type':'text/html;charset=UTF-8'});

    // fs.readFile(path[, options], callback)
    // options <Object> | <string>
    // encoding <string> | <null> 默认为 null。 字符编码
    // flag <string> 默认为 'r'。
    fs.readFile('./file/1.html',{ encoding: 'utf-8',flag: 'r'},function (error,data) {
        if (error){
            throw error;
        }
        response.end(data);
    })
});

server.listen(3000,'127.0.0.1');

```

## 异步强制转同步

```js
const http = require('http');
const fs = require('fs');
// createServer([requestListener]) requestListener 是一个函数，会被自动添加到 'request' 事件。
let server = http.createServer(function (requst, response) {
    if (requst.url === '/favicon.ico'){
        return;
    }
    response.writeHeader(200,{'Content-type':'text/html;charset=UTF-8'});

    // 获取目录下的文件夹  异步 变 同步
    fs.readdir('./file',function (err,files) {
        let dirArr = [];
        // 包括文件和文件夹 [ '1.html', '2.html' ]
        let length = files.length;

        //todo 强制把异步变同步
        (function iterator(i) {
            if (i >= length) {
                console.log(dirArr);
                return;
            }
            fs.stat('./file/'+files[i],function (err,stats) {
                if (err) throw err;
                if (stats.isDirectory()){
                    dirArr.push(files[i]);
                }
                // todo 执行完1次后, 再执行第二次
                iterator(i+1);
            });
        })(0)


        // todo 这种不可取的
        // files.forEach(function (value,index) {
        //     fs.stat('./file/'+value,function (err,stats) {
        //         if (err) throw err;
        //         if (stats.isDirectory()){
        //             dirArr.push(value);
        //         }
        //     });
        // });


        response.end();
    })

});

server.listen(3000,'127.0.0.1');

```





![](https://ws1.sinaimg.cn/large/006tKfTcly1fliimiz92kj31900sudnz.jpg)

