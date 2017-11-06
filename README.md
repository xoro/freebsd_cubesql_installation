# Installing cubeSQL 64bit on FreeBSD 11.1 64bit (linux-c7)

To install cubeSQL on FreeBSd 11.1 64bit just download the shell script and execute it.

```
# fetch --no-verify-peer https://raw.githubusercontent.com/xoro/freebsd_cubesql_installation/master/install_freebsd.sh
# chmod a+x install_freebsd.sh
# ./install_freebsd.sh
```

This is a temporary section that describes the installation command by command.

```
pkg update
echo 'linux_enable="YES"' >> /etc/rc.conf reboot

pkg install linux-c6 bash
echo 'linprocfs /compat/linux/proc linprocfs rw 0 0' >> /etc/fstab
echo 'tmpfs /compat/linux/dev/shm tmpfs rw,mode=1777 0 0' >> /etc/fstab reboot

fetch http://www.sqlabs.com/download/cubesql/561/cubesql_linux32bit.tgz
tar xzf cubesql_linux32bit.tgz

cd cubesql
rm -Rdf /compat/linux/opt/cubesql &>/dev/null
rm /usr/local/bin/cubesqlctl &>/dev/null
mkdir -p /compat/linux/opt/cubesql
cp -fR ./data/* /compat/linux/opt/cubesql
chown root:wheel /compat/linux/opt/cubesql
cp /compat/linux/opt/cubesql/core/Linux/cubesql /compat/linux/opt/cubesql/cubesql
chmod +x /compat/linux/opt/cubesql/cubesql
rm -fR /compat/linux/opt/cubesql/core
cp ./data/script/Linux/cubesqlctl /usr/local/bin
chmod +x /usr/local/bin/cubesqlctl
chown root:wheel /usr/local/bin/cubesqlctl

/compat/linux/opt/cubesql/cubesql -v NONE -g SYSTEM
```
