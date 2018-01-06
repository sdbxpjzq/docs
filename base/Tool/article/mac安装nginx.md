[TOC]

# mac安装nginx

brew安装

```
brew 搜索软件

brew search nginx

brew 安装软件

brew install nginx

brew 卸载软件

brew uninstall nginx

brew 升级

sudo brew update

查看安装信息(经常用到, 比如查看安装目录等)

sudo brew info nginx

查看已经安装的软件

brew list

```

Docroot is: 	`/usr/local/var/www`

The default port has been set in `/usr/local/etc/nginx/nginx.conf` to 8080 so that

nginx can run without sudo.

nginx will load all files in /usr/local/etc/nginx/servers/.

To have launchd start nginx now and restart at login:

  `brew services start nginx`

Or, if you don't want/need a background service you can just run:

  `nginx`