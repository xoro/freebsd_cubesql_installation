#!/bin/sh

# Update the portstree.
portsnap fetch extract
portsnap fetch update

# Build and install the linux-c7 port.
echo 'DEFAULT_VERSIONS+=linux=c7' >> /etc/make.conf
make -C /usr/ports/emulators/linux-c7 install clean -DBATCH
# Configure and enable the linux compat layer!
sysrc linux_enable="YES"
echo 'linprocfs /compat/linux/proc linprocfs rw 0 0' >> /etc/fstab
echo 'tmpfs /compat/linux/dev/shm tmpfs rw,mode=1777 0 0' >> /etc/fstab
reboot

# Fetch and install cubeSQL.
sh
export INSTALL_DIR=/opt/cubesql/
export CUBESQL_VERSION=561
cd /tmp/
fetch http://www.sqlabs.com/download/cubesql/${CUBESQL_VERSION}/cubesql_linux64bit.tgz
tar xzf cubesql_linux64bit.tgz
cd cubesql
# create new installation folder
mkdir -p /opt/cubesql
# copy from data to /opt/cubesql
cp -fR ./data/* /opt/cubesql
chown root:wheel "/opt/cubesql"
# install core executable
cp /opt/cubesql/core/Linux/cubesql /opt/cubesql/cubesql
chmod +x "/opt/cubesql/cubesql"
# remove unused core folder
rm -fR "/opt/cubesql/core"
# handle the cubesqlctl binary
cp ./data/script/Linux/cubesqlctl "/usr/local/bin"
chmod +x "/usr/local/bin/cubesqlctl"
chown root:wheel "/usr/local/bin/cubesqlctl"
# create directory required by cubesql
mkdir -p /var/opt/cubesql/databases
mkdir -p /var/opt/cubesql/restore
mkdir -p /var/opt/cubesql/backups
mkdir -p /var/opt/cubesql/www
mkdir -p /var/opt/cubesql/upload

# enable the cubesql service on startup and load it
fetch --no-verify-peer -o /usr/local/etc/rc.d/cubesql https://raw.githubusercontent.com/xoro/freebsd_cubesql_installation/master/cubesql
chmod a+x /usr/local/etc/rc.d/cubesql
sysrc cubesql_enable="YES"
service cubesql start

echo "Exiting script successfully."
exit 0
