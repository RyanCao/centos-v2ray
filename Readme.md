# 阅读指南

# 一键docker部署V2ray
> Caddy自动证书申请，TLS+WebSocket

### 准备工作
+ 一个域名，并且将域名添加一条A记录到你的VPS
+ VPS安装`Docker`及`Docker Compose`

附上`CentOS7`的安装命令
```
yum -y install git vim
```

```
git clone https://github.com/RyanCao/centos-v2ray.git
cd centos-v2ray
```

修改
```
YourDomain=vultr.rcant.com
YourID=e3114f49-2ebc-401b-a7f9-4f5ed27f9f2b
```

执行
```
./v2ray.sh build
```