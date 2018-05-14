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





# node配置

安装一下nvm wrapper这个插件





# shell脚本

```shell
#!/bin/bash
WEB_PATH='/data/wwwroot/test' #这个代表项目所在目录，就是要生产的目录
WEB_USER='www' #用户， Nginx和Apache一般都是这个用户
WEB_USERGROUP='www' #用户组


echo "Start pull" #UI，这个无所谓
cd $WEB_PATH #进入目录
echo "pulling source code .. " #UI
/usr/local/git/bin/git reset --hard origin/master #回到这个版本
/usr/local/git/bin/git clean -f #清除文件
/usr/local/git/bin/git pull #拉文件下来
#git checkout master #回到master分支
echo "changing permissions .."
#sudo chown -R 777 $WEB_USER:$WEB_USERGROUP $WEB_PATH #防止pull下来过后出现权限问题，
sudo chown -R 777 $WEB_PATH
echo "Finished."

```







# 参考

https://blog.csdn.net/boling_cavalry/article/details/78943061















