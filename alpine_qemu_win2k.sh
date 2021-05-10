#!/bin/bash
apk update
apk add qemu-img qemu-system-x86_64 python2 p7zip
apk --no-cache add procps
qemu-img create -f raw hda.img 5G
wget "https://cloudflare-ipfs.com/ipfs/QmRYFE2mvasp6qhk6EiLsp6kRgqAyBMJa7PByVrvGq3SRn/Microsoft%20Windows%202000%20Professional%20(5.00.2195.6717.sp4).7z"
7z e "./Microsoft%20Windows%202000%20Professional%20(5.00.2195.6717.sp4).7z"
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
qemu-system-x86_64 -vnc :0 -hda ./hda.img \
-m 256 -device VGA,vgamem_mb=16 \
-net nic,model=virtio -net user -cdrom "./EN_WIN2000_PRO_SP4.ISO" \
-rtc base=localtime,clock=host -smp cores=4,threads=4 \
-usbdevice tablet
