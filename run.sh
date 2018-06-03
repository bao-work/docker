cp /root/sources.list /etc/apt/sources.list
cp /root/pip.conf /etc/pip.conf
apt-get update
apt-get -y install python3 python3-pip
pip3 install flask==1.0.2
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
cd /root
flask run --host 0.0.0.0