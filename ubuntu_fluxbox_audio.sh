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

apt install -y alsa-base alsa-tools pulseaudio ffmpeg mplayer
modprobe snd-dummy
modprobe snd-aloop
alsa reload
alsa resume
pulseaudio &
modprobe snd-aloop pcm_substreams=1
echo "# .asoundrc" >> /etc/asound.conf
echo "pcm.!default { type plug slave.pcm "hw:Loopback,0,0" }" >> /etc/asound.conf
cd ./noVNC/
ffmpeg -f alsa -channels 2 -sample_rate 44100 -i hw:Loopback,1,0 -map 0 -codec:a aac -f ssegment -segment_list stream.m3u -segment_list_flags +live -segment_time 10 out%03d.ts &
cd ..
