#!/bin/bash
add-apt-repository ppa:bumblebee/stable -y
apt update
apt install -y xvfb x11vnc build-essential libx11-dev libxcursor-dev libxrandr-dev libxinerama-dev libxi-dev libgl1-mesa-dev libgl1-mesa-dri
apt install -y wine python-minimal
apt install -y virtualgl
git clone https://github.com/Juvenal-Yescas/mediafire-dl
cd mediafire-dl
pip3 install -r requirements.txt
python3 mediafire-dl.py https://www.mediafire.com/file/763enpozco6bxan/sanicball-v0.8.2-win.zip/file
mkdir sanicball
unzip -d sanicball sanicball-v0.8.2-win.zip
cd ..
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
Xvfb +extension GLX &
export DISPLAY=:0
wine64 ./mediafire-dl/sanicball/Sanicball_v0.8.2.exe &
x11vnc -noshm -geometry 900x720 -shared -forever &
