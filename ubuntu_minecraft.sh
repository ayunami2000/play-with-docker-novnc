#!/bin/bash
apt update
apt install -y xvfb x11vnc build-essential libx11-dev libxcursor-dev libxrandr-dev libxinerama-dev libxi-dev libgl1-mesa-dev libgl1-mesa-dri
apt install -y python2
apt install -y openjdk-8-jre qt5-default tigervnc-standalone-server twm
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
useradd minecraft
mkdir /home/mc/
cd /home/mc/
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1EkW9E4o7BI3YRhFpGV0NQ8KAKqICM2Jn' -O mmc.tar.gz
tar -xf ./mmc.tar.gz
cd MultiMC/
chown -R minecraft /home/mc/
echo '#!/bin/bash' >> step2.sh
echo 'tigervncserver -noxstartup -SecurityTypes None -geometry 1280x720 :0' >> step2.sh
echo 'export DISPLAY=:0' >> step2.sh
echo 'twm &' >> step2.sh
echo 'export HOME="/home/mc/"' >> step2.sh
echo './MultiMC' >> step2.sh
sudo -u minecraft bash ./step2.sh
