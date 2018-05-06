# Linux安装ansible

Ansible仓库默认不在yum仓库中，因此我们需要使用下面的命令启用epel仓库。

`rpm -iUvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm`

`yum install ansible -y`

`ansible —version`

