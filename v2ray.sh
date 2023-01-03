#/bin/bash
YourDomain=vultr.rcant.com
YourID=e3114f49-2ebc-401b-a7f9-4f5ed27f9f2b

yum -y update
yum -y install vim git libsodium yum-utils
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum makecache fast
yum install -y docker-ce docker-ce-cli containerd.io

systemctl start docker
systemctl enable docker

cd ~
git clone https://github.com/pengchujin/v2rayDocker.git
cd v2rayDocker
sudo docker run -d --rm --name v2ray -p 443:443 -p 80:80 -v $HOME/.caddy:/root/.caddy  pengchujin/v2ray_ws:0.11 $YourDomain V2RAY_WS $YourID && sleep 3s && sudo docker logs v2ray
cd -