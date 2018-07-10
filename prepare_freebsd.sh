#!/bin/sh

# Configure and enable the linux compat layer, install the linux-c7 package and reboot
sysrc linux_enable="YES"
service abi start
pkg install linux-c7
echo 'linprocfs   /compat/linux/proc    linprocfs       rw           0       0' >> /etc/fstab
echo 'linsysfs    /compat/linux/sys     linsysfs        rw           0       0' >> /etc/fstab
echo 'tmpfs       /compat/linux/dev/shm tmpfs           rw,mode=1777 0       0' >> /etc/fstab
mount /compat/linux/proc
mount /compat/linux/sys
mount /compat/linux/dev/shm
cd /compat/linux/usr/lib
ln -s libssl.so.10 libssl.so
ln -s libcrypto.so.10 libcrypto.so
cd /compat/linux/usr/lib64
ln -s libssl.so.10 libssl.so
ln -s libcrypto.so.10 libcrypto.so
