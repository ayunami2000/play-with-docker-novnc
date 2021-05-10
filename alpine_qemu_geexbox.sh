apk update
apk add qemu-system-x86_64 python2
apk --no-cache add procps
wget -O iso.iso http://sourceforge.net/projects/archiveos/files/g/geexbox/geexbox-3.1-x86_64.iso/download
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
qemu-system-x86_64 -vnc :0 \
--enable-kvm -m 2G -device VGA,vgamem_mb=256 \
-net nic,model=virtio -net user -cdrom iso.iso \
-rtc base=localtime,clock=host -smp cores=4,threads=4 \
-usbdevice tablet -vga vmware
