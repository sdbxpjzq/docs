# chrome插件说明

## chrome插件

- 为知笔记
- [Allow-Control-Allow-Origin: *](https://chrome.google.com/webstore/detail/allow-control-allow-origi/nlfbmbojpeacfghkpbjhddihlkkiljbi/related?hl=en)解决跨域问题,好用的很😎
- [Google翻译](https://translate.google.com/?source=gtx)
- 掘金
- oneTab
- Postman Interceptor(配合Postman客户端)
- Adblock Plus
- LiveReload(配合gulp等自动刷新页面,还需安装 http-server)
- Nimbus Screenshot & Screen Video Recorder(可以实现滚动截屏)
- Octotree,[Insight.io for Github](https://juejin.im/entry/597025d9518825419f7b65ba)
- Vue.js devtools
- React Developer Tools
- 二维码（生成及识别）
- StayFocused --(设定时间后，这短时间内就无法访问你添加的网站,感谢`@梁同学`的推荐)
- whistle(推荐 node 安装)

也可以去 [插件网](http://www.cnplugins.com/)看看😜😜😜

# 如何导出 chrom 插件

## MAC

http://blog.csdn.net/kid_2412/article/details/51008156

- 拷贝ID

![](https://ws3.sinaimg.cn/large/006tNc79gy1fks4yw174rj30x40d0dge.jpg)

- 切换目录:

`cd ~/Library/Application\ Support/Google/Chrome/Default/Extensions/{拷贝的ID值}`

- 选择版本

注意可能会有很多版本，cd进入到自己想打包的文件夹.

`cd 1.0.2_0`

- 拷贝路径

然后执行`pwd`. 拷贝目录信息.

- 打包

在chrome的扩展程序中点击打包扩展程序，把刚刚复制的全路径拷贝到扩展程序根目录中。

![](https://ws1.sinaimg.cn/large/006tNc79gy1fks539jx3lj318u138aci.jpg)









