# mac升级php

```shell
curl -s http://php-osx.liip.ch/install.sh | bash -s 7.2
```

## 永久写入环境变量

`vim ~/.bash_profile`

写入

`export PATH=/usr/local/php5/bin:$PATH`

我用的是`zsh`.

`sudo vim ~/.zshrc `

在最后加入

`source ~/.bash_profile`



