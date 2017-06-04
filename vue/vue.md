# vue-cli

- [github](https://github.com/vuejs/vue-cli)

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