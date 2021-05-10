git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
{
echo "apt update"
echo "apt install -y x11vnc xvfb fluxbox curl jq"
echo "export DISPLAY=:0"
echo "Xvfb :0 -screen 0 1024x768x16 &"
echo "fluxbox &"
echo "x11vnc -display :0 -bg -forever -nopw -quiet -xkb"
echo "echo hw.sdCard=yes>>~/.android/avd/arm.avd/config.ini"
echo "echo sdcard.size=512M>>~/.android/avd/arm.avd/config.ini"
echo "echo hw.keyboard=yes>>~/.android/avd/arm.avd/config.ini"
echo "mksdcard 512MB ~/.android/avd/arm.avd/sdcard.img"
echo "emulator64-arm -avd arm -gpu off -verbose &"
echo "wget -O app.apk `curl -s 'http://ws75.aptoide.com/api/7/apps/search/query=com.innersloth.spacemafia/limit=1' | jq -r '.datalist.list[0].file.path'`"
#todo: detect when lockscreen/homescreen is showing and then run install
echo "adb wait-for-device push app.apk /sdcard/Download"
echo "adb wait-for-device install -s app.apk"
} | docker run -it -p 5900:5900 --name bruh softsam/android-23:latest /bin/bash
