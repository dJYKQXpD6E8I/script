cd ~
git clone https://github.com/m0hithreddy/Proxifier-For-Linux.git && cd Proxifier-For-Linux
autoreconf -vfi
./configure
make all
make uninstall
make install
cp /usr/local/etc/proxifier.conf /usr/local/etc/proxifier.conf.bk
vim /usr/local/etc/proxifier.conf
systemctl daemon-reload # Reload the service units
systemctl start proxifier