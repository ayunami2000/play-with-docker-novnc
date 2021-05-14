#!/bin/bash
apt update
apt install -y xvfb x11vnc build-essential libx11-dev libxcursor-dev libxrandr-dev libxinerama-dev libxi-dev libgl1-mesa-dev libgl1-mesa-dri
apt install -y openjdk-8-jre
git clone https://github.com/iAmInActions/noVNC
./noVNC/utils/launch.sh --listen 80 &
sleep 3
apt install -y tigervnc-standalone-server twm qtbase5-dev x11-utils xdotool
useradd notroot
echo 'notroot  ALL=(ALL:ALL) ALL' >> /etc/sudoers
sleep 4
clear
mkdir /home/notroot/
chown notroot /home/notroot/
cd /home/notroot/
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1EkW9E4o7BI3YRhFpGV0NQ8KAKqICM2Jn' -O mmc.tar.gz
tar -xf ./mmc.tar.gz
cd MultiMC/
chown -R notroot /home/notroot/
echo '#!/bin/bash' >> step2.sh
echo 'export HOME="/home/notroot/"' >> step2.sh
echo 'tigervncserver -noxstartup -SecurityTypes None -geometry 1280x720 :0' >> step2.sh
echo 'export DISPLAY=:0' >> step2.sh
echo 'twm &' >> step2.sh
echo 'xterm -e ./MultiMC' >> step2.sh
chmod +x ./step2.sh
sudo -u notroot ./step2.sh &
export DISPLAY=:0
sleep 8
xmessage -buttons "" "Version: 1.12.2
User: Player
IP: eternalmc.xyz
Password: unsafe" &
sleep 1
export MSG_ID=$(xdotool search --onlyvisible --name xmessage)
xdotool windowmove $MSG_ID 0 680
sudo -u notroot bash --login
