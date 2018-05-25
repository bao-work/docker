# 源地址不能用 https 不知道为什么
cp /flask/sources.list /etc/apt/sources.list
cp /flask/pip.conf /etc/pip.conf
apt-get update
apt-get -y install python3 python3-pip
pip3 install flask
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
cd /flask
flask run --host 0.0.0.0