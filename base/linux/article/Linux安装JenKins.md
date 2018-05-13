# Linux安装JenKins

```shell
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins
```

启动jenkins的命令：

```shell
service jenkins start/stop/restart
```

**访问JenKins**

使用tomcat的方式访问：http://localhost:8080/jenkins/
 使用Java命令行或是Linux的方式是：http://localhost:8080



## 升级

主目录一般在

`/var/lib/jenkins`

可以通过系统信息查看.

### war下载:

`wget  http://updates.jenkins-ci.org/download/war/2.121/jenkins.war`

### 停止Jenkins服务

### 替换jenkins.war

1. 目录替换方式

![](https://ws4.sinaimg.cn/large/006tNc79ly1fr8q8kplatj30y60b40sx.jpg)

将其替换掉(可以先备份)



## 解决Jenkins执行sudo命令

解决方案：

1. 在Jenkins宿主服务器上运行如下命令 
   `$ sudo visudo`
2. 在文件的末尾加上一行 
   `jenkins ALL=(ALL) NOPASSWD: ALL`
3. 保存文件（注意保存的时候修改文件名，文件名后缀不要加上默认的.tmp，即可覆盖原文件） 
   `Ctrl+O`
4. 退出编辑 
   `Ctrl+X`
5. 重启Jenkins服务 
   `$ /etc/init.d/jenkins restart`

最后，重新执行构建任务，不会出现先前的错误。

## 生成密钥

`ssh-keygen -t rsa -C "1165064143@qq.com"`



# 配置github webhook

### webhook地址

假设Jenkins所在服务器的地址是：192.168.0.1，端口为8080，那么webhook地址就是`http://192.168.0.1:8080/github-webhook`

上述地址必须是外网也能访问的，否则GitHub无法访问到Jenkins；



![](https://ws1.sinaimg.cn/large/006tNc79ly1fr9ecmn40yj30sv0jx75c.jpg)







# 参考

https://blog.csdn.net/boling_cavalry/article/details/78943061















