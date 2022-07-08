#!/usr/bin/python3

import os, sys

file = None
srt = []
for i in os.listdir(sys.argv[1]):
    if ".srt" in i:
        srt.append(i)
    elif ".mp4" in i or ".mkv" in i:
        file = i
srt = sorted(srt, key=lambda x: int(x.split('_')[0]))

cmd = f"ffmpeg -i \"{file}\" "
for i in srt:
    cmd += f"-i {i} "

for i in range(len(srt) + 1):
    cmd += f"-map {i} "

cmd += "-c:v copy -c:a copy -c:s srt "

for i in range(len(srt)):
    cmd += f"-metadata:s:s:{i} language={srt[i].replace('.srt', '')} "
cmd += "result.mkv"

print(cmd)
os.chdir(sys.argv[1])
os.system(cmd)
