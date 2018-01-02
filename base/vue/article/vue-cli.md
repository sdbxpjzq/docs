[TOC]

# vue-cli

- [github](https://github.com/vuejs/vue-cli)
- [**全局配置分析参考**](https://github.com/DDFE/DDFE-blog/issues/10?hmsr=toutiao.io&utm_medium=toutiao.io&utm_source=toutiao.io)— 值得一看





**全局安装**

`npm install -g vue-cli`

- `webpack` - A full-featured Webpack + vue-loader setup with hot reload, linting, testing & css extraction.
- `webpack-simple` - A simple Webpack + vue-loader setup for quick prototyping.
- `browserify` - A full-featured Browserify + vueify setup with hot-reload, linting & unit testing.
- `browserify-simple` - A simple Browserify + vueify setup for quick prototyping.
- `simple` - The simplest possible Vue setup in a single HTML file

**创建项目**

`vue init webpack helloworld`

- cd helloworld 进入helloworld 文件夹
- npm install 安装package.json中依赖的node_modules
- npm run dev 运行该项目

**支持scss**

直接安装 `node-sass`和`sass-loader`
`npm install node-sass sass-loader --save-dev`



# vue-cli 自定义模板

1. 当官方模板不能满足需求时，我们可以 fork 官方模板按照自己的需求修改后，通过 vue-cli 命令生成基于自己模板的项目结构：

   `vue init username/repo my-project`

2. 除了从 github 下载模板外，我们还可以从本地加载模板：

   `vue init ~/fs/path/to-custom-template my-project`