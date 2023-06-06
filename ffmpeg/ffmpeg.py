#!/usr/bin/python3

import os, sys
import shutil
file = None
ext = None
srt = []
for i in os.listdir(sys.argv[1]):
    if ".srt" in i:
        srt.append(i)
    elif ".mkv" in i:
        file = i
        ext = ".mkv"
    elif ".mp4" in i:
        file = i
        ext = ".mp4"
    
srt = sorted(srt, key=lambda x: int(x.split('_')[0]))

if file is None:
    exit(-1)

cmd = f"ffmpeg -y -hide_banner -i \"{file}\" "
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
os.rename(file, "file" + ext)
os.rename("result.mkv", "../" + file.replace(ext, ".mkv"))
os.chdir("..")
shutil.rmtree(sys.argv[1])
