#! /bin/bash

longURL='https://cdn1718108738.ppgnginx.com/api/v1/client/subscribe?token=b03d27091869efeab3637d29131075e0'

gzip -d clash-linux-amd64-n2023-09-05-gdcc8d87.gz
mv clash-linux-amd64-* clash
chmod +x clash
# curl $longURL | base64 --decode | tee config.yaml 
clash -f config.yaml
