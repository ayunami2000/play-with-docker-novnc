#!/bin/bash
apt update
wget -O virtualgl.deb https://sourceforge.net/projects/virtualgl/files/2.6.5/virtualgl_2.6.5_amd64.deb/download
apt install -y ./virtualgl.deb
apt install -y xvfb x11vnc build-essential libx11-dev libxcursor-dev libxrandr-dev libxinerama-dev libxi-dev libgl1-mesa-dev libgl1-mesa-dri python-minimal
apt install -y fluxbox
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
Xvfb -screen 0 900x720x24+32 +extension GLX &
export DISPLAY=:0
fluxbox &
x11vnc -noshm -geometry 900x720 -shared -forever &

modprobe snd-dummy
modprobe snd-aloop
apt install -y alsa-base alsa-tools pulseaudio vlc

sed -i 's/geteuid/getppid/' /usr/bin/vlc
cvlc -vvv alsa://plughw:Loopback,1,0 --sout '#transcode{acodec=mp3,ab=128,channels=2}:standard{access=http,dst=0.0.0.0:81/a.mp3}' &
cvlc -vvv alsa://plughw:Loopback,0,0 --sout '#transcode{acodec=mp3,ab=128,channels=2}:standard{access=http,dst=0.0.0.0:82/a.mp3}' &
wget https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3
vlc ./file_example_MP3_700KB.mp3 &
