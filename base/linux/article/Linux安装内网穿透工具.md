# Linux安装holer(内网穿透工具)

## holer

https://github.com/Wisdom-Projects/holer



## ngrok

直接使用这个就行

https://ngrok.com/



下边的忽略的

====================================================================



https://github.com/inconshreveable/ngrok.git

编译ngrok

export GOPATH=/usr/local/ngrok/

```
cd /usr/local/
git clone https://github.com/inconshreveable/ngrok.git
export NGROK_DOMAIN="ngrok.com"
cd ngrok
```

为域名生成证书

```
openssl genrsa -out rootCA.key 2048
openssl req -x509 -new -nodes -key rootCA.key -subj "/CN=$NGROK_DOMAIN" -days 5000 -out rootCA.pem
openssl genrsa -out server.key 2048
openssl req -new -key server.key -subj "/CN=$NGROK_DOMAIN" -out server.csr
openssl x509 -req -in server.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out server.crt -days 5000
```

在软件源代码目录下面会生成一些证书文件，我们需要把这些文件拷贝到指定位置

```
cp rootCA.pem assets/client/tls/ngrokroot.crt
cp server.crt assets/server/tls/snakeoil.crt
cp server.key assets/server/tls/snakeoil.key
```

