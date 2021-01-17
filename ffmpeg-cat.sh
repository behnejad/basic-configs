#!/bin/bash
ffmpeg -i 1.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts 1.ts
ffmpeg -i 2.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts 2.ts
ffmpeg -i 3.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts 3.ts
ffmpeg -i 4.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts 4.ts
ffmpeg -i 5.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts 5.ts
ffmpeg -i "concat:1.ts|2.ts|3.ts|4.ts|5.ts" -c copy -bsf:a aac_adtstoasc "res.mp4"
