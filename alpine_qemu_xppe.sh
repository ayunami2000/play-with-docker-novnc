#!/bin/bash
apk update
apk add qemu-system-x86_64 python2
apk --no-cache add procps
git clone https://github.com/Juvenal-Yescas/mediafire-dl
cd mediafire-dl
pip3 install -r requirements.txt
python3 mediafire-dl.py https://www.mediafire.com/file/gqpuqi803so5lag/BartPE.iso/file
cd ..
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
qemu-system-x86_64 -vnc :0 -m 3072 \
-net nic,model=ne2k_pci -net user -cdrom ./mediafire-dl/BartPE.iso \
-rtc base=localtime,clock=host -smp cores=4,threads=4 \
-usbdevice tablet -vga vmware
