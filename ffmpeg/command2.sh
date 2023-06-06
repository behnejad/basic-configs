#!/bin/bash
bp=`dirname "$1"`
name=`basename -- "$1"`
#echo ">$1<" "><"
ffmpeg -hide_banner -y -hwaccel cuda -hwaccel_output_format cuda -i "$1" -map 0 -c copy -c:s srt -c:v hevc_nvenc -preset p5 -fps_mode auto "$1.mkv" && rm "$1"
clear
#echo "=================="
#sleep 5
