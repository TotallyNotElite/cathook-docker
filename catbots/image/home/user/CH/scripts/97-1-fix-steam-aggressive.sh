#!/bin/bash

#
#	This script fixes "unable to load driver: radeonsi_dri.so" error.
#	More information availible here: https://askubuntu.com/questions/771032/steam-not-opening-in-ubuntu-16-04-lts
#

if ! [ $EUID == 0 ]; then
	echo "This script must be ran as root"
	exit
fi

for n in $(ls /home/)
do
	if [ -e "/home/$n/.steam" ]
	then
		find "/home/$n/.steam/steam/ubuntu12_32" -name "libgcc_s.so*" -delete -print
		find "/home/$n/.steam/steam/ubuntu12_32" -name "libgstdc++.so*" -delete -print
	fi
done