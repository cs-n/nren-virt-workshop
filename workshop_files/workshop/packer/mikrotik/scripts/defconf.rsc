/interface bridge add name=bridge comment=defconf disabled=no
/interface bridge port add bridge=bridge comment=defconf interface=ether2
/interface bridge port add bridge=bridge comment=defconf interface=ether3
/interface bridge port add bridge=bridge comment=defconf interface=ether4
/ip address add address=192.168.88.1/24 comment=defconf interface=bridge network=192.168.88.0
/user add name=vagrant password=vagrant group=full
/tool fetch url="https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub" mode=https
/user ssh-keys import user=vagrant public-key-file=vagrant.pub
