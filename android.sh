git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
echo "#!/bin/bash">bruh.sh
echo "apt update">>bruh.sh
echo "apt install -y x11vnc xvfb fluxbox curl jq">>bruh.sh
echo "export DISPLAY=:0">>bruh.sh
echo "Xvfb :0 -screen 0 1024x768x16 &">>bruh.sh
echo "fluxbox &">>bruh.sh
echo "x11vnc -display :0 -bg -forever -nopw -quiet -xkb">>bruh.sh
echo "echo hw.sdCard=yes>>~/.android/avd/arm.avd/config.ini">>bruh.sh
echo "echo sdcard.size=512M>>~/.android/avd/arm.avd/config.ini">>bruh.sh
echo "echo hw.keyboard=yes>>~/.android/avd/arm.avd/config.ini">>bruh.sh
echo "mksdcard 512MB ~/.android/avd/arm.avd/sdcard.img">>bruh.sh
echo "emulator64-arm -avd arm -gpu off -verbose &">>bruh.sh
#echo "wget -O app.apk `curl -s 'http://ws75.aptoide.com/api/7/apps/search/query=com.innersloth.spacemafia/limit=1' | jq -r '.datalist.list[0].file.path'`">>bruh.sh
#todo: detect when lockscreen/homescreen is showing and then run install
#echo "adb wait-for-device push app.apk /sdcard/Download">>bruh.sh
#echo "adb wait-for-device install -s app.apk">>bruh.sh
echo "/bin/bash">>bruh.sh
docker run -it -v $(pwd):/bruh -p 5900:5900 --name bruh softsam/android-23:latest /bin/bash /bruh/bruh.sh
