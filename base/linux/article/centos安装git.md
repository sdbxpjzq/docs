[TOC]

# centos安装git

## 安装依赖

```shell
yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel
yum install gcc perl-ExtUtils-MakeMaker
yum install perl-ExtUtils-CBuilder perl-ExtUtils-MakeMaker
```

## 卸载

```shell
yum remove git
```

## 下载最新版本

https://www.kernel.org/pub/software/scm/git/

找到需要的版本 `wget`下载

```shell
wget https://www.kernel.org/pub/software/scm/git/git-2.15.1.tar.gz
tar xzf git-2.15.1.tar.gz
```

## 安装

```shell
cd git-2.15.1
./configure prefix=/usr/local/git
make
make install
echo "export PATH=$PATH:/usr/local/git/bin" >> /etc/profile
source /etc/profile
```

## 检查

```shell
git --version
```

#参考

https://book.git-scm.com/download/linux