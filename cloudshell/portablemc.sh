#!/bin/bash
sudo apt update
sudo apt install -y xvfb x11vnc build-essential libx11-dev libxcursor-dev libxrandr-dev libxinerama-dev libxi-dev libgl1-mesa-dev libgl1-mesa-dri fluxbox xterm
git clone https://github.com/ayunami2000/noVNC
git clone https://github.com/mindstorm38/portablemc
./noVNC/utils/launch.sh --listen 8080 &
Xvfb -screen 0 900x720x24+32 +extension GLX &
export DISPLAY=:0
fluxbox &
x11vnc -noshm -geometry 900x720 -shared -forever &
yes y | python3.7 ./portablemc/portablemc.py start -u cloudshell
