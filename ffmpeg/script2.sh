#!/bin/bash
bp=`dirname $0`
find . -type f -iname "*.mp4" -exec $bp/command2.sh `pwd`/"{}" \;
clear
exit
