#!/bin/bash
ffmpeg -i 1.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts 1.ts
ffmpeg -i 2.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts 2.ts
ffmpeg -i 3.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts 3.ts
ffmpeg -i 4.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts 4.ts
ffmpeg -i 5.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts 5.ts
ffmpeg -i "concat:1.ts|2.ts|3.ts|4.ts|5.ts" -c copy -bsf:a aac_adtstoasc "res.mp4"
ffmpeg -hwaccel cuda -i a.mp4 -s 1920x1080 -c:a copy b.mp4
ffmpeg -hwaccel cuda -i a.mp4 -map 0 -c copy -c:v hevc_nvenc -profile:v main10 -pix_fmt p010le b.mp4
ffmpeg -y -hide_banner -hwaccel nvdec -hwaccel_device 0 -vsync 0 -i "input.mp4" -c copy -c:v:0 hevc_nvenc -profile:v main10 -pix_fmt p010le -rc:v:0 vbr_hq -rc-lookahead 32 -cq 21 -qmin 1 -qmax 51 -b:v:0 10M -maxrate:v:0 20M -gpu 0 "output.mkv"
ffmpeg -y -hide_banner -vsync 0 -hwaccel cuda -hwaccel_output_format cuda  -hwaccel_device 0 -c:v:0 h264_cuvid -i "input.mp4" -vf "hwdownload,format=nv12" -c copy -c:v:0 hevc_nvenc -profile:v main10 -pix_fmt p010le -rc:v:0 vbr -tune hq -preset p5 -multipass 1 -bf 4 -b_ref_mode 1 -nonref_p 1 -rc-lookahead 75 -spatial-aq 1 -aq-strength 8 -temporal-aq 1 -cq 21 -qmin 1 -qmax 99 -b:v:0 10M -maxrate:v:0 20M -gpu 0 "output.mkv"
ffmpeg -codecs -hide_banner -formats -filters 
ffmpeg -h encoder=hevc_nvenc
ffmpeg -f gdigrab -framerate 60 -i desktop a.mp4
ffmpeg -i 1.mp4 -vf "drawtext=fontfile=./font.ttf:text='sample text':fontcolor=white:fontsize=48:box=1:boxcolor=black@0.5:boxborderw=5:x=(w-text_w-10):y=(h-text_h-10)" -c:a 2.mp4
ffmpeg -hide_banner -i 1.mp4 -s 1280x720 2.mp2
