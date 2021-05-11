#!/bin/bash
apt update
apt install -y qemu-system-x86 qemu-utils
apt install -y python-minimal
apt install -y python2
qemu-img create -f raw hda.img 10G
git clone https://github.com/Juvenal-Yescas/mediafire-dl
cd mediafire-dl
pip3 install -r requirements.txt
python3 mediafire-dl.py http://www.mediafire.com/file/sj7694734mb06jv/downloadisofile.blogspot.com_Tiny7.iso/file
cd ..
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
qemu-system-x86_64 -vnc :0 -hda ./hda.img \
--enable-kvm -m 2G -device VGA,vgamem_mb=256 \
-net nic,model=virtio -net user -cdrom ./mediafire-dl/downloadisofile.blogspot.com_Tiny7.iso \
-rtc base=localtime,clock=host -smp cores=4,threads=4 \
-usbdevice tablet
