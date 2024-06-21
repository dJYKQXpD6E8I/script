#! /bin/bash

cd /etc/nginx
tar -czvf nginx_$(date +'%F_%H-%M-%S').tar.gz nginx.conf sites-available/ sites-enabled/ nginxconfig.io/
tar -xzvf nginxconfig.io-compass-kids.com.tar.gz | xargs chmod 0644
openssl dhparam -out /etc/nginx/dhparam.pem 2048
mkdir -p /var/www/_letsencrypt
chown nginx /var/www/_letsencrypt
sed -i -r 's/(listen .*443)/\1; #/g; s/(ssl_(certificate|certificate_key|trusted_certificate) )/#;#\1/g; s/(server \{)/\1\n    ssl off;/g' /etc/nginx/sites-available/compass-kids.com.conf
nginx -t && systemctl reload nginx
certbot certonly --dry-run --webroot -d compass-kids.com --email oPs6aywhtyi2@proto.me -w /var/www/_letsencrypt -n --agree-tos --force-renewal
sed -i -r -z 's/#?; ?#//g; s/(server \{)\n    ssl off;/\1/g' /etc/nginx/sites-available/compass-kids.com.conf
nginx -t && systemctl reload nginx
echo -e '#!/bin/bash\nnginx -t && systemctl reload nginx' | tee /etc/letsencrypt/renewal-hooks/post/nginx-reload.sh\chmod a+x /etc/letsencrypt/renewal-hooks/post/nginx-reload.sh
chmod a+x /etc/letsencrypt/renewal-hooks/post/nginx-reload.sh
nginx -t && systemctl reload nginx