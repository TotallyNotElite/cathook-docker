#!/bin/bash

#
#	Will delete all catbot- users and their home directories
#

read -p "Press ENTER to continue"

kisak=`cat kisak`

for i in {2..32}
do
	if ! [ -d "/home/$kisak-$i" ]; then
		echo "No $kisak $i";
		continue;
	fi
	echo "Deleting user $kisak-$i"
	sudo groupdel $kisak-$i
	sudo userdel -r $kisak-$i
done