export http_proxy=http://clash:7890
export https_proxy=http://clash:7890

apt update
apt install python3 wget -y
wget https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl3.py -O /usr/bin/systemctl
chmod a+x /usr/bin/systemctl