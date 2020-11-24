sudo firewall-cmd --zone=public --list-all
sudo firewall-cmd --zone=public --add-port=8443/tcp && sudo firewall-cmd --permanent --zone=public --add-port=8443/tcp