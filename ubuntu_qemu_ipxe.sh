#!/bin/bash
apt update
apt install -y qemu-system-x86
apt install -y python-minimal
apt install -y python2
wget -O iso.iso http://boot.ipxe.org/ipxe.iso
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
qemu-system-x86_64 -vnc :0 \
--enable-kvm -m 2G -device VGA,vgamem_mb=256 \
-net nic,model=virtio -net user -cdrom iso.iso \
-rtc base=localtime,clock=host -smp cores=4,threads=4 \
-usbdevice tablet
