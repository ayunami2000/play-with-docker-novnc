#!/bin/bash
apt update
apt install -y xvfb fluxbox xterm
wget https://github.com/ayunami2000/play-with-docker-novnc/raw/main/jsmpeg-vnc-linux_FIX_FOR_FAKEPORT.zip
unzip jsmpeg-vnc-linux_FIX_FOR_FAKEPORT.zip
Xvfb :0 -screen 0 1280x1024x24 &
./jsmpeg-vnc -display_number 0 -port 80 &
fluxbox &
