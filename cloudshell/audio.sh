#!/bin/bash
cd ~
if [ ! -d "./noVNC/" ] 
then
    git clone https://github.com/ayunami2000/noVNC
fi
sudo apt update
sudo apt install -y pulseaudio ffmpeg
pulseaudio -D --exit-idle-time=-1
pactl load-module module-null-sink sink_name=SpeakerOutput sink_properties=device.description="Dummy_Output"
pacmd load-module module-virtual-source source_name=VirtualMicrophone
cd noVNC/audio
ffmpeg -f pulse -i default -c:a aac -f hls -hls_time 4 -hls_segment_type "mpegts" -hls_list_size 10 -hls_delete_threshold 20 -hls_flags "delete_segments+program_date_time+temp_file" -master_pl_name "manifest.m3u8" -hls_segment_filename "segment_%v_%03d.ts" "manifest_%v.m3u8"
cd ../..
