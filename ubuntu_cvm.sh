#!/bin/bash
apt update
apt install -y libossp-uuid-dev libvncserver-dev libcairo-dev libodb-sqlite-dev qemu qemu-system-x86
wget https://github.com/computernewb/collab-vm-server/releases/download/1.2.10/collab-vm-server-linux-jpeg-amd64.zip
unzip collab-vm-server-linux-jpeg-amd64.zip
rm -rf collab-vm-server-linux-jpeg-amd64.zip
wget https://github.com/ayunami2000/play-with-docker-novnc/raw/main/cvmpublic.zip
unzip cvmpublic.zip
rm -rf cvmpublic.zip
chmod +x ./collab-vm-server
wget http://ftp.sh.cvut.cz/slax/Slax-9.x/slax-64bit-9.11.0.iso
echo qemu-system-x86_64 -soundhw hda -boot d -cdrom slax-64bit-9.11.0.iso -m 2048 -net nic,model=virtio -net user -rtc base=localtime,clock=host -smp cores=4,threads=4 -usbdevice tablet -vga vmware
echo setup the vm now. when done do ctrl+c to start public
./collab-vm-server 80
./collab-vm-server 80 public
