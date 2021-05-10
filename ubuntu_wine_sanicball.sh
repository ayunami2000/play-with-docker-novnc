#!/bin/bash
wget -nc https://dl.winehq.org/wine-builds/winehq.key
apt-key add winehq.key
apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main' -y
apt update
wget -O virtualgl.deb https://sourceforge.net/projects/virtualgl/files/2.6.5/virtualgl_2.6.5_amd64.deb/download
apt install -y ./virtualgl.deb
apt install -y xvfb x11vnc build-essential libx11-dev libxcursor-dev libxrandr-dev libxinerama-dev libxi-dev libgl1-mesa-dev libgl1-mesa-dri
apt install -y python-minimal
apt install -y python2
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
apt install -y --install-recommends winehq-stable
git clone https://github.com/Juvenal-Yescas/mediafire-dl
cd mediafire-dl
pip3 install -r requirements.txt
python3 mediafire-dl.py https://www.mediafire.com/file/763enpozco6bxan/sanicball-v0.8.2-win.zip/file
mkdir sanicball
unzip -d sanicball sanicball-v0.8.2-win.zip
cd ..
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
Xvfb -screen 0 900x720x24+32 +extension GLX &
export DISPLAY=:0
wine64 ./mediafire-dl/sanicball/Sanicball_v0.8.2.exe &
x11vnc -noshm -geometry 900x720 -shared -forever &
