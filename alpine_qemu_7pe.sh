#!/bin/bash
apk update
apk add qemu-img qemu-system-x86_64 python2
apk --no-cache add procps
qemu-img create -f raw hda.img 5G
git clone https://github.com/Juvenal-Yescas/mediafire-dl
cd mediafire-dl
pip3 install -r requirements.txt
python3 mediafire-dl.py https://www.mediafire.com/file/05en23pzwr4cmpo/7pe_amd64_E.iso/file
cd ..
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
qemu-system-x86_64 -vnc :0 -hda ./hda.img \
--enable-kvm -m 2G -device VGA,vgamem_mb=256 \
-net nic,model=e1000 -net user -cdrom ./mediafire-dl/7pe_amd64_E.iso \
-rtc base=localtime,clock=host -smp cores=4,threads=4 \
-usbdevice tablet
