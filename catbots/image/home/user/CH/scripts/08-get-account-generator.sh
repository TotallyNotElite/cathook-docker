#!/bin/bash

#
#	This script performs installation of nullifiedcat account generator
#

if [ $EUID == 0 ]; then
	echo "This script must not be run as root"
	exit
fi

git clone https://github.com/nullworks/account-generator --recursive

pushd account-generator
./install.sh
popd
