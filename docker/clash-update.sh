#! /bin/ash

URL='https://subconverters.com/sub?target=clash&url=https%3A%2F%2Fcdn1718108738.ppgnginx.com%2Fapi%2Fv1%2Fclient%2Fsubscribe%3Ftoken%3Db03d27091869efeab3637d29131075e0&insert=false&config=https%3A%2F%2Fraw.githubusercontent.com%2FACL4SSR%2FACL4SSR%2Fmaster%2FClash%2Fconfig%2FACL4SSR_Online_Mini_AdblockPlus.ini&emoji=false&list=false&xudp=false&udp=false&tfo=false&expand=true&scv=false&fdn=false&new_name=true'

wget $URL -O /root/.config/clash/config.yaml &&
kill $(netstat -tunlp|grep -m 1 -oE '\d+/clash'|grep -oE '\d+')