#!/bin/bash
bp=`dirname "$1"`
name=`basename -- "$1"`
ffmpeg -hide_banner -y -hwaccel cuda -hwaccel_output_format cuda -vsync 0 -i "$1" -map 0 -c copy -c:s srt -c:v hevc_nvenc -preset p6 -fps_mode auto "$bp/../done/$name.mkv"
echo "=================="
sleep 5