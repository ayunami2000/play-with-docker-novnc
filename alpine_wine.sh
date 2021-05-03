apk update
apk add xvfb x11vnc build-base libx11-dev libxcursor-dev libxrandr-dev libxinerama-dev libxi-dev mesa-dev mesa-dri-gallium xvfb-run
apk add xterm wine
apk add virtualgl --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
Xvfb +extension GLX &
export DISPLAY=:0
wine explorer /desktop=shell &
xterm &
x11vnc -noshm -geometry 900x720 -shared -forever &
