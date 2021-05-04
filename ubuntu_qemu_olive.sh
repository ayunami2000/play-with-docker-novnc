#!/bin/bash
apt update
apt install -y qemu python-minimal
wget -O iso.iso https://downloads.sourceforge.net/project/archiveos/o/olive/olive-0.2.iso
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
qemu-system-x86_64 -vnc :0 -m 3072 \
-net nic,model=virtio -net user -cdrom iso.iso \
-rtc base=localtime,clock=host -smp cores=4,threads=4 \
-usbdevice tablet -vga vmware