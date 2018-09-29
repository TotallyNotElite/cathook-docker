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
	if [ -e "/home/$n/.steam/steam/" ]
	then
		if [ -e "/home/$n/.steam/steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu/" ]
		then
			if [ -e "/home/$n/.steam/steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu/libstdc++.so.6" ]
			then
				echo "Fixing $n.."
				sudo mv /home/$n/.steam/steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu/libstdc++.so.6 /home/$n/.steam/steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu/libstdc++.so.6.bak
				echo "Fixed."
			else
				echo "Skipping $n - already fixed."
			fi
		else
			echo "Skipping $n - please run steam first."
		fi
	else
		echo "Skipping $n - no steam found."
	fi
done
