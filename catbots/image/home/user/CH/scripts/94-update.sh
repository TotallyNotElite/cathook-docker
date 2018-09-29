#!/bin/bash

#
#	This script updates setup/run scripts and cathook IPC server
#

if [ $EUID == 0 ]; then
	echo "This script must not be run as root"
	exit
fi

git fetch
git pull

pushd account-generator
./update.sh
popd

pushd cathook-ipc-web-panel
./update.sh
popd

pushd cathook-ipc-server
./update.sh
popd