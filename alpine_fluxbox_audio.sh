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

apk add pulseaudio pulseaudio-alsa alsa-plugins-pulse pulseaudio-utils vlc
pulseaudio &
pacmd load-module module-null-sink sink_name=virtual_a
pacmd load-module module-combine-sink sink_name="virtual_b" slaves="virtual_a"
sed -i 's/geteuid/getppid/' /usr/bin/vlc
cvlc -vvv pulse://$(pactl list | grep "Monitor Source" | awk '{print $3}') --sout '#transcode{acodec=mp3,ab=128,channels=2}:standard{access=http,dst=0.0.0.0:81/a.mp3}'
