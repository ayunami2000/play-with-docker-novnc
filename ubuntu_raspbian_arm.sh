#!/bin/bash
apt update
apt install -y qemu-system-arm qemu-utils python2 git dialog
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
git clone https://github.com/iAmInActions/raspbian-emulation-vnc-stuff
cd raspbian-emulation-vnc-stuff
sleep 6
chmod +x ./runme.sh
bash ./runme.sh
bash --login
