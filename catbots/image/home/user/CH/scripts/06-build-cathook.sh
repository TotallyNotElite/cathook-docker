#!/bin/bash

#
#	This script builds textmode build of cathook
#

numcpu=$(grep -c ^processor /proc/cpuinfo)
cathook=$(cat cathook-location)

if [ $EUID == 0 ]; then
	echo "This script must not be run as root"
	exit
fi

if ! [ -e "$cathook/" ] || ! [ -e "$cathook/.git" ] || ! [ -e "$cathook/src/hack.cpp" ]; then
	echo "Specified path doesn't point to cathook directory"
	exit
fi

sudo mkdir -p "/opt/cathook/bin"
sudo rm "/opt/cathook/bin/libcathook-textmode.so"

mkdir -p build
pushd build

cmake -DCMAKE_BUILD_TYPE=Release -DEnableVisuals=0 -DVACBypass=1 -DTextmode=1 -DEnableWarnings=0 -DEnableOnlineFeatures=0 "$cathook"
make -j$numcpu

if ! [ -e "bin/libcathook.so" ]; then
	echo "FATAL: Build failed"
	exit
fi

popd

sudo cp "build/bin/libcathook.so" "/opt/cathook/bin/libcathook-textmode.so"
