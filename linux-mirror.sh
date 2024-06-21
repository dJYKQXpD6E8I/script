curl -h > /dev/null || apt install -y curl || (apt update && apt install  -y curl)
lsb_release -h > /dev/null || apt install -y lsb_core || (apt update && apt install  -y lsb_core)
bash <(curl -sSL https://linuxmirrors.cn/main.sh)