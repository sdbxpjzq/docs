# linux安装supervisor

## 安装`python`

我的是`Python 2.6.6`

## 安装`python-setuptools`

`yum install python-setuptools`

## 安装`supervisor`

`easy_install supervisor`

supervisor安装完成后会生成三个执行程序：supervisortd、supervisorctl、echo_supervisord_conf，分别是supervisor的守护进程服务（用于接收进程管理命令）、客户端（用于和守护进程通信，发送管理进程的指令）、生成初始配置文件程序。

## 生成配置文件

```shell
mkdir /etc/supervisor
echo_supervisord_conf > /etc/supervisor/supervisord.conf
```

配置文件示例:

```shell
[unix_http_server]
file=/tmp/supervisor.sock   ;UNIX socket 文件，supervisorctl 会使用
;chmod=0700                 ;socket文件的mode，默认是0700
;chown=nobody:nogroup       ;socket文件的owner，格式：uid:gid

;[inet_http_server]         ;HTTP服务器，提供web管理界面
;port=127.0.0.1:9001        ;Web管理后台运行的IP和端口，如果开放到公网，需要注意安全性
;username=user              ;登录管理后台的用户名
;password=123               ;登录管理后台的密码

[supervisord]
logfile=/tmp/supervisord.log ;日志文件，默认是 $CWD/supervisord.log
logfile_maxbytes=50MB        ;日志文件大小，超出会rotate，默认 50MB，如果设成0，表示不限制大小
logfile_backups=10           ;日志文件保留备份数量默认10，设为0表示不备份
loglevel=info                ;日志级别，默认info，其它: debug,warn,trace
pidfile=/tmp/supervisord.pid ;pid 文件
nodaemon=false               ;是否在前台启动，默认是false，即以 daemon 的方式启动
minfds=1024                  ;可以打开的文件描述符的最小值，默认 1024
minprocs=200                 ;可以打开的进程数的最小值，默认 200

[supervisorctl]
serverurl=unix:///tmp/supervisor.sock ;通过UNIX socket连接supervisord，路径与unix_http_server部分的file一致
;serverurl=http://127.0.0.1:9001 ; 通过HTTP的方式连接supervisord

; [program:xx]是被管理的进程配置参数，xx是进程的名称
[program:xx]
command=/opt/apache-tomcat-8.0.35/bin/catalina.sh run  ; 程序启动命令
autostart=true       ; 在supervisord启动的时候也自动启动
startsecs=10         ; 启动10秒后没有异常退出，就表示进程正常启动了，默认为1秒
autorestart=true     ; 程序退出后自动重启,可选值：[unexpected,true,false]，默认为unexpected，表示进程意外杀死后才重启
startretries=3       ; 启动失败自动重试次数，默认是3
user=tomcat          ; 用哪个用户启动进程，默认是root
priority=999         ; 进程启动优先级，默认999，值小的优先启动
redirect_stderr=true ; 把stderr重定向到stdout，默认false
stdout_logfile_maxbytes=20MB  ; stdout 日志文件大小，默认50MB
stdout_logfile_backups = 20   ; stdout 日志文件备份数，默认是10
; stdout 日志文件，需要注意当指定目录不存在时无法正常启动，所以需要手动创建目录（supervisord 会自动创建日志文件）
stdout_logfile=/opt/apache-tomcat-8.0.35/logs/catalina.out
stopasgroup=false     ;默认为false,进程被杀死时，是否向这个进程组发送stop信号，包括子进程
killasgroup=false     ;默认为false，向进程组发送kill信号，包括子进程

;包含其它配置文件
[include]
files = relative/directory/*.ini    ;可以指定一个或多个以.ini结束的配置文件
```



把末尾的include去掉；添加配置文件

```shell
[include]
files = /etc/supervisor/conf.d/*.ini
```

conf.d文件夹中的app_admin.ini配置文件如下:

```shell
[program:appadmin]
process_name=%(program_name)s_%(process_num)02d
command=nohup /data/appadmin/app_admin
directory=/data/appadmin     ##程序的目录地址最好要添加，要不然会报错，找不到路径
autostart=true
autorestart=true
user=root
numprocs=1
redirect_stderr=true
stdout_logfile=/etc/supervisor/logs/appadmin.log  #日志文件
```



## 启动Supervisor服务

`supervisord -c /etc/supervisor/supervisord.conf`



## 设置supervisor开机自起：

编辑sh文件并给予权限

```shell
[root@centos]# vi /etc/rc.d/sh/appadmin.sh 
#!/bin/bash
# 开机启动supervisor
supervisord -c /etc/supervisor/supervisord.conf
chmod +x /etc/rc.d/sh/appadmin.sh
```

编辑/etc/rc.d/rc.local 加入开机启动

```shell
[root@appadmin conf.d]# vi /etc/rc.d/rc.local 
#!/bin/bash
touch /var/lock/subsys/local
#开机启动supervisor脚本
/etc/rc.d/sh/appadmin.sh
 
chmod +x /etc/rc.d/rc.local
```

## Web管理界面

出于安全考虑，默认配置是没有开启web管理界面，需要修改supervisord.conf配置文件打开http访权限，将下面的配置：

```shell
[inet_http_server]         ; inet (TCP) server disabled by default
port=0.0.0.0:9001          ; (ip_address:port specifier, *:port for all iface)
username=user              ; (default is no username (open server))
password=123               ; (default is no password (open server))
```

port：绑定访问IP和端口，这里是绑定的是本地IP和9001端口 
username：登录管理后台的用户名 
password：登录管理后台的密码













