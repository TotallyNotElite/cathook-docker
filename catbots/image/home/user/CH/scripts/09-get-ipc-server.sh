#!/bin/bash

#
#	This script performs installation of cathook IPC server
#

if [ $EUID == 0 ]; then
	echo "This script must not be run as root"
	exit
fi

git clone https://github.com/nullworks/cathook-ipc-server --recursive

numcpu=$(grep -c ^processor /proc/cpuinfo)

pushd cathook-ipc-server
./install.sh
popd
