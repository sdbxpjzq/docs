[TOC]



# 搭建自己的vpn

## 买国外vps

先买一个国外的`vps`. 推荐[搬瓦工](http://banwagong.cn/).(主要是比较便宜)

## 服务端安装Shadowsocks

推荐使用一键安装.(我安装的是Python版本)

https://teddysun.com/486.html

配置多客户端: https://teddysun.com/342.html

## 下载Shadowsocks客户端

[mac版本](https://github.com/shadowsocks/ShadowsocksX-NG)

[windows版本](https://github.com/shadowsocks/shadowsocks-windows)



[ShadowsocksR Windows版下载](http://pan.baidu.com/s/1geQD7Xp)（密码: rbzg ）

[ShadowsocksR Android版下载](http://pan.baidu.com/s/1jH6oGIi)（密码: 5c2j）

[ShadowsocksR Mac版下载](http://pan.baidu.com/s/1miqRJ7M)（密码: gnti）

## 使用chrome插件配合

`whistle的Chrome插件`. 使用系统代理就行. 可以随时调整代理方式.

[chrome商城](https://chrome.google.com/webstore/detail/whistle/bokhoonoeoodkdhbdhlgaodjdcnbcpdl?hl=zh-CN)





- [参考](https://www.diycode.cc/topics/738)
- https://github.com/gfwlist/gfwlist




# vps

## digitalocean

**http://www.digitalocean.com/?refcode=cde1066a7a8f**

[测速](http://speedtest-nyc3.digitalocean.com/)

## VPS

https://www.vps.net/products/ssd-vps/



## vultr

https://www.vultr.com/

[测速](https://www.vultrvps.com/test-server)

## linode

https://www.linode.com/

[参考](http://www.laozuo.org/linode)

## hostdare

https://manage.hostdare.com/cart.php?a=confproduct&i=2

## 搬瓦工

http://banwagong.cn/



# 测速

http://ping.chinaz.com/

https://www.ipip.net/traceroute.php





# vps加速

## 锐速破解版

```shell
yum -y install wget

wget -N --no-check-certificate https://raw.githubusercontent.com/wn789/serverspeeder/master/serverspeeder.sh

bash serverspeeder.sh
```

### 内核不合适问题

centos6

```shell
uname -r #查看当前内核版本

rpm -ivh http://xz.wn789.com/CentOSkernel/kernel-firmware-2.6.32-504.3.3.el6.noarch.rpm

rpm -ivh http://xz.wn789.com/CentOSkernel/kernel-2.6.32-504.3.3.el6.x86_64.rpm --force
```

安装完成后

```shell
reboot
uname -r #当前使用内核版本
```

https://www.wn789.com/4689.html



## BBR [推荐使用]

https://teddysun.com/489.html





# ssh加速

`FinalShell`

Windows版下载地址:
<http://www.hostbuf.com/downloads/finalshell_install.exe>

Mac一键安装脚本

```shell
curl -o finalshell_install.sh http://www.hostbuf.com/downloads/finalshell_install.sh;
chmod +x finalshell_install.sh;
sudo  ./finalshell_install.sh
```



http://www.hostbuf.com/t/988.html




















