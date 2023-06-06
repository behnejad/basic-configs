#!/bin/bash
bp=`dirname $0`
for i in *; do $bp/command.sh `pwd`/"$i"; done