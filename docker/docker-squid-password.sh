#! /bin/bash

PASSWORD='m3ccXerA3iad'

apt update
apt install -y apache2-utils

echo "New password: '$PASSWORD'"
htpasswd -c squid_passwd squid