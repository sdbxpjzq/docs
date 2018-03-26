# Elasticsearch

https://www.elastic.co/downloads/elasticsearch

[Elasticsearch: 权威指南](https://elasticsearch.cn/book/elasticsearch_definitive_guide_2.x/mapping-analysis.html)

## 下载

`cd /usr/local/`

`mkdir elasticsearch`

`wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.3.zip`

## 执行

`bin/elasticsearch`
`./elasticsearch -d` -- 后台启动 检查`ps aux|grep elasticsearch`

可以先设置权限(`chmod -R 777 ./xxx`)不要`root`用户执行(为了安全考虑)

## 测试

`curl http://localhost:9200/` 


# elasticsearch-php

https://github.com/elastic/elasticsearch-php

## 安装

`composer require elasticsearch/elasticsearch`



## 插件安装

### 安装elasticsearch-head

6.X中，elasticsearch-head

1. 不能放在elasticsearch的 plugins、modules 目录下
2. 不能使用 elasticsearch-plugin install



https://github.com/mobz/elasticsearch-head



## 教程参考

https://www.sojson.com/blog/85.html

https://blog.csdn.net/qq_21383435/article/details/79367821





内容展示
![](https://ws1.sinaimg.cn/large/006tNc79gy1fpnualproij317s162gs9.jpg)













