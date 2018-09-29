#!/bin/bash

#
#	This script starts IPC server, account generator, etc..
#

if [ $EUID == 0 ]; then
	echo "This script must not be run as root"
	exit
fi

xhost +

/opt/cathook/ipc/bin/server -s >/dev/null &
echo $! >/tmp/cat-ipc-server.pid
pushd account-generator
node app >/tmp/cathook-accgen.log &
popd
pushd cathook-ipc-web-panel
sudo bash ./run.sh &
popd

sleep 5;

echo "Account generator password: `cat /tmp/cat-accgen2-password`"
echo "IPC Web Panel password: `cat /tmp/cat-webpanel-password`"