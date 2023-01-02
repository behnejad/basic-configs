#!/bin/bash
cd /usr/lib/vmware/modules/source
tar xf vmmon.tar
tar xf vmnet.tar
cd vmmon-only
make
cd ../vmnet-only
make
cd ..
mkdir /lib/modules/`uname -r`/misc
mv vmmon.o /lib/modules/`uname -r`/misc/vmmon.ko
mv vmnet.o /lib/modules/`uname -r`/misc/vmnet.ko
rm -r vmmon-only/
rm -r vmnet-only/
depmod -a
/etc/init.d/vmware restart

