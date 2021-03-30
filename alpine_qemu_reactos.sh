apk update
apk add qemu-system-x86_64 python2
apk --no-cache add procps
wget -O iso.zip https://sourceforge.net/projects/reactos/files/ReactOS/0.4.13/ReactOS-0.4.13-release-14-g2494cfc-live.zip/download
unzip iso.zip
git clone https://github.com/novnc/noVNC
./noVNC/utils/launch.sh --listen 80 &
qemu-system-x86_64 -m 3072 \
-net nic,model=virtio -net user -cdrom $(find . -maxdepth 1 -type f -name "*.iso") \
-rtc base=localtime,clock=host -smp cores=4,threads=4 \
-usbdevice tablet -vga vmware
