#!/bin/bash
apt update
apt install -y qemu-system-x86 p7zip-full
apt install -y python-minimal
apt install -y python2
git clone https://github.com/Juvenal-Yescas/mediafire-dl
cd mediafire-dl
pip3 install -r requirements.txt
python3 mediafire-dl.py https://www.mediafire.com/file/x83o2uwzxipbwf0/tiny7_img.7z/file
7z e tiny7_img.7z
cd ..
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
qemu-system-x86_64 -vnc :0 -hda ./mediafire-dl/hda.img \
--enable-kvm -m 2G -device VGA,vgamem_mb=256 \
-net nic,model=e1000 -net user \
-rtc base=localtime,clock=host -smp cores=4,threads=4 \
-usbdevice tablet
