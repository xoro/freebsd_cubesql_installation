#!/bin/sh

# stop running process
killall cubesql 2&>/dev/null

# remove core folder
INSTALL_DIR=/opt/cubesql/
rm -fR $INSTALL_DIR &>/dev/null
rm -f "/usr/local/bin/cubesqlctl" &>/dev/null
rm -f "/usr/local/etc/rc.d/cubesql" &>/dev/null

# remove startup script
#update-rc.d -f cubesql remove
