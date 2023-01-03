#/bin/bash
YourDomain=vultr.rcant.com
YourID=e3114f49-2ebc-401b-a7f9-4f5ed27f9f2b

sudo apt-get -y update
sudo apt-get -y install vim git 
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

curl -fsSL https://mirrors.ustc.edu.cn/docker-ce/linux/debian/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://mirrors.ustc.edu.cn/docker-ce/linux/debian \
  $(lsb_release -cs) \
  stable"

sudo apt-get -y update

sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

systemctl start docker
systemctl enable docker

cd ~
git clone https://github.com/pengchujin/v2rayDocker.git
cd v2rayDocker
sudo docker run -d --rm --name v2ray -p 443:443 -p 80:80 -v $HOME/.caddy:/root/.caddy  pengchujin/v2ray_ws:0.11 $YourDomain V2RAY_WS $YourID && sleep 3s && sudo docker logs v2ray
cd -