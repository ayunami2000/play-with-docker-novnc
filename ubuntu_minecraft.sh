#!/bin/bash
apt update
wget -O virtualgl.deb https://sourceforge.net/projects/virtualgl/files/2.6.5/virtualgl_2.6.5_amd64.deb/download
apt install -y ./virtualgl.deb
apt install -y xvfb x11vnc build-essential libx11-dev libxcursor-dev libxrandr-dev libxinerama-dev libxi-dev libgl1-mesa-dev libgl1-mesa-dri
apt install -y python-minimal
apt install -y python2
apt install -y openjdk-8-jre qt5-default
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
Xvfb -screen 0 900x720x24+32 +extension GLX &
export DISPLAY=:0
x11vnc -noshm -geometry 900x720 -shared -forever &
useradd minecraft
mkdir /home/mc/
cd /home/mc/
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1EkW9E4o7BI3YRhFpGV0NQ8KAKqICM2Jn' -O mmc.tar.gz
tar -xf ./mmc.tar.gz
cd MultiMC/
chown -R minecraft /home/mc/
echo '!/bin/bash' >> step2.sh
echo 'export HOME="/home/mc/"' >> step2.sh
echo './MultiMC' >> step2.sh
sudo -u minecraft bash ./step2.sh
