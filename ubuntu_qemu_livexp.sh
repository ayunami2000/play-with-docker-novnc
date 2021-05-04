#!/bin/bash
apt update
apt install -y qemu python-minimal unrar
qemu-img create -f raw hda.img 5G
git clone https://github.com/Juvenal-Yescas/mediafire-dl
cd mediafire-dl
pip3 install -r requirements.txt
python3 mediafire-dl.py http://www.mediafire.com/file/ur73tnfepw2uvps/LiveXP.v10.11-ddlupdate__By_Engh3.rar/file
unrar e ./LiveXP.v10.11-ddlupdate__By_Engh3.rar
cd ..
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
qemu-system-x86_64 -vnc :0 -hda ./hda.img -m 3072 \
-net nic,model=e1000 -net user -cdrom ./mediafire-dl/LiveXP.v10.11-ddlupdate.iso \
-rtc base=localtime,clock=host -smp cores=4,threads=4 \
-usbdevice tablet -vga vmware
