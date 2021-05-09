apk update
apk add xvfb fluxbox x11vnc build-base libx11-dev libxcursor-dev libxrandr-dev libxinerama-dev libxi-dev mesa-dev mesa-dri-gallium xvfb-run
apk add xterm #chromium
apk add virtualgl --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
Xvfb -screen 0 900x720x24+32 +extension GLX &
export DISPLAY=:0
fluxbox &
x11vnc -noshm -geometry 900x720 -shared -forever &

apk add alsa-base pulseaudio pulseaudio-alsa alsa-plugins-pulse pulseaudio-utils vlc
alsa reload
alsa resume
pulseaudio &
modprobe snd-aloop pcm_substreams=1
echo "# .asoundrc" >> /etc/asound.conf
echo "pcm.!default { type plug slave.pcm "hw:Loopback,0,0" }" >> /etc/asound.conf
cd ./noVNC/
ffmpeg -f alsa -channels 2 -sample_rate 44100 -i hw:Loopback,1,0 -map 0 -codec:a aac -f ssegment -segment_list stream.m3u -segment_list_flags +live -segment_time 10 out%03d.ts &
cd ..
sed -i 's/geteuid/getppid/' /usr/bin/vlc

wget -O bruh.mp3 https://imagesharing.com/uploads/20201125/4420f20ce9b9944e87e94fbf89b261a10cab63e5.mp3
vlc bruh.mp3 --aout=pulse
