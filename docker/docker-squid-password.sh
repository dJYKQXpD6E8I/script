#! /bin/bash

# PASSWORD http 代理密码
source docker-squid-password.conf

apt update
apt install -y apache2-utils

echo "New password: '$PASSWORD'"
htpasswd -c squid_passwd squid