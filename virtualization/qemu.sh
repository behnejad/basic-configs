qemu-system-x86_64 -netdev tap,id=mynet0,ifname=tap -device e1000,netdev=mynet0 vm.qcow2
qemu-system-x86_64 -netdev user,id=net1,hostfwd=tcp::8291-:8291 -device e1000,netdev=net1 -m 256m a.qcow2
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
