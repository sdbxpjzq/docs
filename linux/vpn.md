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



speedtest-nyc3.digitalocean.com   n0

speedtest-nyc2.digitalocean.com 350+

speedtest-nyc1.digitalocean.com  320+



speedtest-sfo1.digitalocean.com   能到500 还丢包

speedtest-sfo2.digitalocean.com  比1强点

speedtest-sgp1.digitalocean.com   100+   比较好啊



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



## 香港

https://my.rfchost.com/cart.php?gid=7

9折优惠码：SUMMER10OFF



## 新加坡

https://indovirtue.com/premium-singapore-ssd-vps



## 其他

https://www.gigsgigscloud.com/singapore-cloud-vps-kvm/ — 看评论说服务不好,可以先试试





## virpus

http://virpus.com/ssd-cache-vps.php

优惠码: `P17`



## 更多查看	

https://servercat.me

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





# TCP双边加速

`FinalShell`

### 一. 开放端口

```shell
service iptables start

iptables -A INPUT -p tcp --dport 你的vps端口号 -j ACCEPT

iptables -A OUTPUT -p tcp --sport 你的vps端口号 -j ACCEPT

service iptables save

```



### 二. 安装命令:

```shell
rm -f install_fs.sh

wget https://raw.githubusercontent.com/rptec/FinalSpeed/master/install_fs.sh

chmod +x install_fs.sh

./install_fs.sh 2>&1 | tee install.log

```

国内推荐

```shell
rm -f install_fs.sh
wget https://coding.net/u/siyanglee/p/finalspeed/git/raw/master/install_fs.sh
chmod +x install_fs.sh
./install_fs.sh 2>&1 | tee install.log
```



### 三. 常用命令使用说明

- 更新：执行一键安装会自动完成更新。
- 卸载： sh /fs/stop.sh ; rm -rf /fs
- 启动： sh /fs/start.sh
- 停止： sh /fs/stop.sh
- 重新启动： sh /fs/restart.sh
- 运行日志： tail -f /fs/server.log

## 客户端下载

PS：**以下所有的工作基础都建立在shadowsocks已经配置完成的情况下。**

### MAC:

客户端Java版，支持OS X，Linux

- 下载地址：[点击这里](https://raw.githubusercontent.com/leesiyang/finalspeed/master/finalspeed_client1.2.zip)
- 国内镜像：[点击这里](https://coding.net/u/siyanglee/p/finalspeed/git/raw/master/finalspeed_client1.2.zip)

系统需要安装java运行环境，



高版本

```shell
curl -o finalshell_install.sh http://www.hostbuf.com/downloads/finalshell_install.sh;chmod +x finalshell_install.sh;sudo ./finalshell_install.sh
```



### Windows版下载地址:



<http://www.hostbuf.com/downloads/finalshell_install.exe>

客户端Windows版

- 下载地址：[点击这里](https://raw.githubusercontent.com/leesiyang/finalspeed/master/finalspeed_install1.2.exe)
- 国内镜像：[点击这里](https://coding.net/u/siyanglee/p/finalspeed/git/raw/master/finalspeed_install1.2.exe)



### 配置

![](https://ws3.sinaimg.cn/large/006tKfTcly1fkxvx7ao2wj30vw0ye0u9.jpg)

名称可随意填写，`加速端口`为服务端端口为`443`，`本地端口`可随意，这里为`6666`。

至此，FinalSpeed的客户端配置已经完成。
当然，工作还远没有结束，为了让FinalSpeed最后能生效，你还需要修改shadowsocks的服务端和客户端的配置。
3、打开shadowsocks客户端，将服务器IP改成127.0.0.1.
4、使用putty连接你的服务器，如果已经连接便不需要再次连接。打开你的shadowsocks.json文件，将server参数由原来的服务器IP改成**0.0.0.0**，重启服务器的shadowsocks服务
5、在配置好所有东西以后，把shadowsocks和finalSpeed都退出一下再打开。如果一切顺利，当你上youtube等平时不能上的网站的时候，你可以在finalSpeed的客户端中看到下载和上传速度。

[参考一](https://github.com/chenqunfeng/Blog/issues/2)

[参考二](http://www.hostbuf.com/t/988.html)






















