#!/bin/bash
apt update
apt install -y qemu-system-arm qemu-utils
apt install -y python2
apt install git dialog
git clone https://github.com/iAmInActions/raspbian-emulation-vnc-stuff
cd raspbian-emulation-vnc-stuff
chmod +x ./runme.sh
./runme.sh
