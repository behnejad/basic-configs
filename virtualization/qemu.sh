qemu-system-x86_64 vm.qcow2 -netdev tap,id=mynet0,ifname=tap -device e1000,netdev=mynet0
qemu-img convert -f vdi test.vdi -O qcow2 test.qcow2

# mount qcow2
modprobe nbd max_part=8
qemu-nbd --connect=/dev/nbd0 1.qcow2
fdisk /dev/nbd0 -l
mount /dev/nbd0p1 /mnt/somepoint/
umount /mnt/somepoint/
qemu-nbd --disconnect /dev/nbd0
rmmod nbd
# end mount
