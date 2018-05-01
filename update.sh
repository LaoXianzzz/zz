#!/bin/bash
echo "欢迎使用一键搭建"
echo "即将搭建的是4.29版本"
echo "准备开始安装"
curl https://raw.githubusercontent.com/creationix/nvm/v0.13.1/install.sh | bash
source ~/.bash_profile
nvm install v9.8.0
nvm alias default v9.8.0
yum -y install gcc-c++
yum -y install flex
yum -y install bison
wget http://www.tcpdump.org/release/libpcap-1.8.1.tar.gz
tar -zxvf libpcap-1.8.1.tar.gz
cd libpcap-1.8.1
./configure
make
make install

git clone https://github.com/LaoXianzzz/zz.git
cd zz/
npm i
npm i -g pino
npm install -g forever
forever start index.js sniff eth0 10.144.90.70 | pino

echo "搭建完成"
