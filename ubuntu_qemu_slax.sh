#!/bin/bash
apt update
apt install -y qemu qemu-system-x86 python2
qemu-img create -f raw hda.img 10G
wget -O iso.iso http://ftp.sh.cvut.cz/slax/Slax-9.x/slax-64bit-9.11.0.iso
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
qemu-system-x86_64 -vnc :0 -m 3072 \
-net nic,model=virtio -net user -cdrom iso.iso \
-rtc base=localtime,clock=host -smp cores=4,threads=4 \
-usbdevice tablet -vga vmware
