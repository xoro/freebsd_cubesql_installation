# Installing cubeSQL 64bit on CentOS6 64bit

```
# yum update
# chkconfig --del iptables
# chkconfig --del ip6tables
# reboot
# curl http://www.sqlabs.com/download/cubesql/561/cubesql_linux64bit.tgz --output cubesql_linux64bit.tgz
# tar xzf cubesql_linux64bit.tgz
# cd cubesql
# ./install_generic.sh
# service cubesql start
```


# Installing cubeSQL 64bit on CentOS7 64bit

```
# yum update
# yum install net-tools
# systemctl stop firewalld
# systemctl disable firewalld
# reboot
# curl http://www.sqlabs.com/download/cubesql/561/cubesql_linux64bit.tgz --output cubesql_linux64bit.tgz
# tar xzf cubesql_linux64bit.tgz
# cd cubesql
# ./install_generic.sh
# service cubesql start
```


# Installing cubeSQL 32bit on FreeBSD 64bit, CentOS6

```
# pkg update
# echo 'linux_enable="YES"' >> /etc/rc.conf
# reboot
# pkg install linux-c6 bash
# echo 'linprocfs /compat/linux/proc linprocfs rw 0 0' >> /etc/fstab
# echo 'tmpfs /compat/linux/dev/shm tmpfs rw,mode=1777 0 0' >> /etc/fstab
# reboot
# fetch http://www.sqlabs.com/download/cubesql/561/cubesql_linux32bit.tgz
# tar xzf cubesql_linux32bit.tgz
# cd cubesql
# cp ../install_freebsd.sh .
# ./install_freebsd.sh
# service cubesql start
```


# Installing cubeSQL 64bit on FreeBSD 64bit, CentOS6

```
# pkg update
# echo 'linux_enable="YES"' >> /etc/rc.conf
# reboot
# portsnap fetch extract
# echo 'DEFAULT_VERSIONS+=linux=c6_64' >> /etc/make.conf
# echo 'OVERRIDE_LINUX_NONBASE_PORTS=c6_64' >> /etc/make.conf
# make -C /usr/ports/emulators/linux-c6 install clean -DBATCH
# echo 'linprocfs /compat/linux/proc linprocfs rw 0 0' >> /etc/fstab
# echo 'tmpfs /compat/linux/dev/shm tmpfs rw,mode=1777 0 0' >> /etc/fstab
# reboot
# fetch http://www.sqlabs.com/download/cubesql/561/cubesql_linux64bit.tgz
# tar xzf cubesql_linux64bit.tgz
# cd cubesql
# fetch https://raw.githubusercontent.com/xoro/freebsd_cubesql_installation/master/install_freebsd.sh
# cp ../install_freebsd.sh .
# ./install_freebsd.sh
# service cubesql start
```
