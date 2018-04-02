# async和await



建议先去看看这里 —> [理解 JavaScript 的 async/await](https://segmentfault.com/a/1190000007535316)

## async

async 函数 返回一个 promise,

## await

await 等待 promise 处理的结果.

基于koa

```js
class RentHouse
{
    constructor()
    {
    }
    static async a(i)
    {
        let test = await RentHouse.show(i);
        // 每秒输出
        console.log(test)
    }

    static  index()
    {
        for (let i=0;i<10000;i+=1000){
            // 异步执行
            RentHouse.a(i);
        }
    }

    static show(time)
    {
        return new Promise(resolve => {
            setTimeout(() => {
                resolve('task done!'+time)
            }, time)
        })

    }
}

```







