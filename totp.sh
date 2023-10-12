#!/bin/bash
KEYB32=`printf "\xaa\xaa\xaa\xaa\xaa\xaa\xaa\xaa\xaa\xaa\xaa\xaa\xaa\xaa\xaa\xaa"`
DT=`date +%s`
COUNTER=$[(DT/60) + 1]
HEX=`printf "00000000%08x\n" $COUNTER`
BIN=`echo -n $HEX | sed 's/\(..\)/\\\x\1/g'`
DGST=`printf "$BIN" | openssl dgst -sha1 -hmac "$KEYB32"`
arrIN=(${DGST// / })
DGST=${arrIN[1]}
LAST=`printf '%d' 0x${DGST:39}`
NUMBER=${DGST:LAST*2:8}
DECNUMBER=`printf "%d" $((0x${NUMBER}&0x7FFFFFFF))`
printf "OTP: %.6d" $[DECNUMBER%1000000]