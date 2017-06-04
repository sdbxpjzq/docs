# 读写NTFS格式硬盘

- 免费推荐--http://enjoygineering.com/mounty/




#  Homebrew(推荐安装)

- [Homebrew][https://brew.sh/]

# 图片自动上传图床

- iPic
- iPic move
- AIfred(需要破解版本) 设置快捷键

# 修改`host`文件翻墙

提供2个常用地址(一直在更新中).
[老D博客](https://laod.cn/hosts)

[github上的](https://github.com/racaljk/hosts)

### `host`文件位置

hosts所在文件夹：

- Windows 系统
  - hosts位于 `C:\Windows\System32\drivers\etc\hosts`
- Android（安卓）系统
  - hosts位于 `/etc/hosts`
- Mac（苹果电脑）系统
  - hosts位于 `/etc/hosts`
  - 可以使用iHost工具
- iPhone（iOS）系统
  - hosts位于 `/etc/hosts`
- Linux系统
  - hosts位于 `/etc/hosts`
- 绝大多数Unix系统都是在 `/etc/hosts`

# Node 安装

- Windows或Mac系统，访问[https://nodejs.org/](https://nodejs.org/)，安装**LTS**版本的Node，默认安装即可

# 种子下载工具 hardseed

- https://www.oschina.net/p/hardseed
- https://github.com/yangyangwithgnu/hardseed

# cmake安装

- `brew install cmake`

# libcurl安装

- 1、先到[http://curl.haxx.se/](http://curl.haxx.se/%E4%B8%8A%E4%B8%8B%E8%BD%BD%E6%9C%80%E6%96%B0%E7%9A%84curl%E6%BA%90%E7%A0%81) 上下载最新的curl源码

  2、终端：进入解压后的curl目录

  3、终端：./configure --prefix=/usr/local/curl (设置安装路径)(省略也可以)

  4、终端：make (编译)

  5、终端：make install (安装)

# chrome插件 ( [插件网](http://www.cnplugins.com/))

- 为知笔记
- [Google翻译](https://translate.google.com/?source=gtx)
- 掘金
- oneTab
- Postman Interceptor(配合Postman客户端)
- Adblock Plus
- LiveReload(配合gulp等自动刷新页面,还需安装 http-server)
- Nimbus Screenshot & Screen Video Recorder(可以实现滚动截屏)
- Octotree
- Vue.js devtools
- React Developer Tools
- 二维码（生成及识别）
- StayFocused --(设定时间后，这短时间内就无法访问你添加的网站,感谢`@梁同学`的推荐)
- whistle(推荐 node 安装)

# 代理

- whistle --跨平台[手册](https://avwo.github.io/whistle/)[教程](https://www.qcloud.com/community/article/151)--(目前只是使用了简单的代理,许多功能还没有用到) 
- 安装— `npm install -g whistle`
- 启动— `w2 start`



#  终端 -Oh My Zsh

命令行工具[Oh My Zsh][https://github.com/robbyrussell/oh-my-zsh]---[教程][https://sanwen8.cn/p/1b9NhOn.html]

**安装**

`wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh`

**切换**
`chsh -s /usr/local/bin/zsh`

  查看
`cat /etc/shells`
`
/bin/bash --mac默认
/bin/csh
/bin/ksh
/bin/sh
/bin/tcsh
/bin/zsh

**主题设置:**

1. 存储目录: `cd ~/.oh-my-zsh/themes`
2. 编辑主题配置文件: `vim ~/.zshrc`,可以找到`ZSH_THEME="robbyrussel"`,默认的主题.
3. 更改主题 `ZSH_THEME="random"`, 可以设置成随机的, 当看到好看的执行`echo $ZSH_THEME`查看就行.`apple.zsh-theme(正在用的)`,`dstufft.zsh-theme`,`jonathan.zsh-theme`,`rkj-repos.zsh-theme`感觉还不错.

**启用插件**

1. 存放目录: `~/.oh-my-zsh/plugins`
2. 编辑启用:`vim ~/.zshrc` ,`plugins=(git,sudo,zsh-syntax-highlighting)`,往里添加(,分隔)就行
3. 常见插件说明--http://www.cnblogs.com/mitnick/p/6270384.html — https://www.v2ex.com/t/156997




 # tmux

1. **安装**`brew install tmux`
2. 新建窗口— `tmux new -n <窗口名>`
3. 装了 oh-my-zsh 的话，自定义窗口名不起作用,修改zsh的配置文件,打开`DISABLE_AUTO_TITLE="true"`

# 其他工具

- 微信开发者工具
- phpstorm
- webstorm
  - [破解网站-参考一](http://idea.lanyus.com/)
  - [破解网站-参考二](http://www.imsxm.com/jetbrains-license-server.html)
- 为知笔记,有道笔记,印象笔记
- 滴答清单
- Spark -- 邮箱
- 微信,QQ
- FileZilla
- Dash
- Mou,MacDown,小书匠,Bear,Typora
- SourceTree
- Photoshop
- Mark Man
- Charles
- Paste
- iHost
- AIfred3—(有破解版)
- 射手影音
- Sequel Pro,Navicat Premium 
- Sublime Text
- Sketch
- Adobe Acrobat
- Parallels Desktop
- Postman
- [兼容性查询网站](http://caniuse.com/)

# 推荐下载地址

[史蒂芬周的博客](http://www.sdifenzhou.com/)