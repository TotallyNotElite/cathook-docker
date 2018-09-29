#!/bin/bash

#
#	12 is pretty insane amount amount and requires ~18GB ram, but for users who are too lazy to add a number at the end, let's just use the previous as default
#

max=12

if [ "$#" == 1 ]; then
	max=$1
fi

if ! [ -e "/opt/steamapps" ]; then
	echo "Can't find steamapps folder."
	echo "Please, run scripts in the right order."
	exit
fi

read -p "Press ENTER to continue"

for i in $(seq 1 $max)
do
	if [ -d "/home/`cat kisak`-$i" ]; then
		echo "`cat kisak`-$i already exists"
		continue
	fi
	echo "Creating user `cat kisak`-$i"
	sudo useradd -m `cat kisak`-$i
	sudo usermod -g `cat kisak`s `cat kisak`-$i
	sudo mkdir -p /home/`cat kisak`-$i
	sudo chown `cat kisak`-$i:`cat kisak`s /home/`cat kisak`-$i
	sudo -H -u `cat kisak`-$i bash -c "mkdir -p /home/`cat kisak`-$i/.local/share/Steam"
	sudo -H -u `cat kisak`-$i bash -c "ln -s \"/opt/steamapps\" \"/home/`cat kisak`-$i/.local/share/Steam/steamapps\""
	sudo -H -u `cat kisak`-$i bash -c "mkdir -p ~/.steam"
	sudo -H -u `cat kisak`-$i bash -c "touch ~/.steam/steam_install_agreement.txt"
done
