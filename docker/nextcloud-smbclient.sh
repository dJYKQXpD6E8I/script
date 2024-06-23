#! /bin/bash

export http_proxy=http://clash:7890
export https_proxy=http://clash:7890

apt update
apt-get install -y smbclient
apt-get install -y php-smbclient
apt-get install -y libsmbclient
apt-get install -y libsmbclient-dev
apt install -y wget
wget http://pear.php.net/go-pear.phar
php go-pear.phar
#安装mongo扩展
pecl install mongodb
php -i | grep php.ini
vim php.ini 添加 extension=mongodb.so
pecl install smbclient