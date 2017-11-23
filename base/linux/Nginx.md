[TOC]

什么是 c10k?

![](https://ws1.sinaimg.cn/large/006tKfTcly1fia39sk9wvj31fs0lmwgg.jpg)

![](https://ws3.sinaimg.cn/large/006tKfTcly1fia3db7oulj31fc0jeab8.jpg)

![](https://ws1.sinaimg.cn/large/006tKfTcly1fia3ht53hej315605u3yr.jpg)



# events





# 反向代理和负载均衡

```shell
upstream node_app {
        server 127.0.0.1:3000;
}
location /api {
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host  $http_host;
        proxy_set_header X-Nginx-Proxy true;
        proxy_set_header Connection "";
        proxy_pass      http://node_app;
    }
```



负载均衡算法

- ip_hash 默认
- [fair](https://github.com/gnosek/nginx-upstream-fair)









# 跨域访问

add_header 

![](https://ws3.sinaimg.cn/large/006tKfTcly1fia8etpahnj30zq0hy0tk.jpg)





# 禁用缓存

```shell
location ~.*\.(js|css|html|png|jpg)$
{
    add_header Cache-Control no-cache;
} 
```

