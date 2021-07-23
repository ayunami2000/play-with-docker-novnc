#!/bin/bash
cd ~
sudo apt update
sudo apt install -y libossp-uuid-dev libvncserver-dev libcairo-dev libodb-sqlite-dev qemu qemu-system-x86
if [ ! -d "./cvm/" ] 
then
    mkdir cvm
    cd cvm
    wget https://github.com/computernewb/collab-vm-server/releases/download/1.2.10/collab-vm-server-linux-png-amd64.zip
    unzip collab-vm-server-linux-png-amd64.zip
    rm -rf collab-vm-server-linux-png-amd64.zip
    wget https://github.com/ayunami2000/play-with-docker-novnc/raw/main/cvmpublic.zip
    unzip cvmpublic.zip
    rm -rf cvmpublic.zip
    chmod +x ./collab-vm-server
    cd ..
    echo CHANGE PASSWORDS
fi
cd cvm
ssh -R 80:localhost:6004 nokey@localhost.run &
echo open another terminal and wget your preferred iso. ctrl+c to switch to public mode.
./collab-vm-server 6004
./collab-vm-server 6004 public
cd ..
