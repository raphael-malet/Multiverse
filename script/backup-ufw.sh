#!/bin/bash
sudo apt-get -y install ftp
date=$(date +%d-%m-%Y-%H.%M)
back=backup_$date
sudo tar -czvf $back.tar.gz /etc/ufw

HOST=192.168.65.10
USER=ftpserv
PASSWORD=1234ftpftp

ftp -inv $HOST <<EOF
user $USER $PASSWORD
mput $back.tar.gz
bye
EOF
sudo rm $back.tar.gz
