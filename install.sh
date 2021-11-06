#!/bin/bash

# Author: Fajar Nugroho / mafiasoleh@gmail.com
# Version: 0.0.1

clear -x
export DEBIAN_FRONTEND=noninteractive
user=$(whoami);
if [[ $user != "root" ]]; then
  echo ""
  echo "+===============================================================+"
  echo "|  CAUTION: This installer requires root privileges,            |"
  echo "|           Please login as root and run the installer again.   |"
  echo "+===============================================================+"
  echo ""
  echo;
  exit 1;
fi;


useradd --system --no-create-home --user-group genieacs
apt install curl wget apt-transport-https ca-certificates gnupg2 lsb-release -y
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main" | sudo tee /etc/apt/sources.list.d/mongodb-org.list
curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
apt install -y nodejs mongodb-org
systemctl enable --now mongod
npm install -g --unsafe-perm genieacs@1.2.8
mkdir -p /opt/genieacs/ext
chown genieacs:genieacs /opt/genieacs/ext
mkdir /var/log/genieacs
chown genieacs:genieacs /var/log/genieacs
pico /opt/genieacs/genieacs.env
chown genieacs:genieacs /opt/genieacs/genieacs.env
chmod 600 /opt/genieacs/genieacs.env
cp -brv ./conf/systemd/genieacs-*.service /etc/systemd/system/
  192  pico /etc/logrotate.d/genieacs
  193  systemctl daemon-reload
  196  sudo systemctl enable genieacs-cwmp
  197  sudo systemctl start genieacs-cwmp
  198  sudo systemctl status genieacs-cwmp
  199  sudo systemctl enable genieacs-nbi
  200  sudo systemctl start genieacs-nbi
  201  sudo systemctl status genieacs-nbi
  202  sudo systemctl enable genieacs-fs
  203  sudo systemctl start genieacs-fs
  204  sudo systemctl status genieacs-fs
  205  sudo systemctl enable genieacs-ui
  206  sudo systemctl start genieacs-ui
  207  sudo systemctl status genieacs-ui
  208  systemctl status genieacs-*
  209  systemctl status genieacs-*
  210  ping 10.0.0.202
  211  ip addr
  212  ping 10.0.0.203
  213  systemctl restart genieacs-*
  214  systemctl status genieacs-*
  215  tail -f /var/log/genieacs/genieacs-cwmp-access.log
  216  ls
  217  cat genieacs-cwmp.service
  218  cd /opt/genieacs/ext/
  219  ls
  220  cd ..
  221  ls
  222  cat genieacs.env
  223  pico /etc/network/interfaces
  224  reboot
  225  pico /etc/network/interfaces
  226  reboot
  227  ip addr
  228  ip addr
  229  ping 10.255.0.1
  230  ping 10.255.0.10
  231  reboot
  232  systemctl status genieacs-*