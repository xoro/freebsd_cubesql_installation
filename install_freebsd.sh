#!/bin/sh
INSTALL_DIR=/usr/local/cubesql

#remove old installation folder (if exists)
rm -Rdf $INSTALL_DIR

# create new installation folder
mkdir -p $INSTALL_DIR

# copy from data to $INSTALL_DIR
cp -fR ./data/* $INSTALL_DIR
chown root:wheel "$INSTALL_DIR"

# copy startup script
# MUST be root:root
# some distributions doesn't have the rc.d subdirectory
#INIT_DIR=/etc/rc.d/init.d
#if ! [ -d  $INIT_DIR ]; then
#INIT_DIR=/etc/init.d
#fi

#STARTUP_DIR=/etc/rc.d
#if ! [ -d  $STARTUP_DIR ]; then
#STARTUP_DIR=/etc
#fi

# install core executable
cp $INSTALL_DIR/core/Linux/cubesql $INSTALL_DIR/cubesql
chmod +x "$INSTALL_DIR/cubesql"

# remove unused core folder
rm -fR "$INSTALL_DIR/core"

cp ./data/script/Linux/cubesqlctl "/usr/local/bin"
chmod +x "/usr/local/bin/cubesqlctl"
chown root:wheel "/usr/local/bin/cubesqlctl"

#cp ./data/script/Linux/cubesql.startup "$INIT_DIR/cubesql"
#chmod +x "$INIT_DIR/cubesql"
#chown root:wheel "$INIT_DIR/cubesql"

#chkconfig --add cubesql
