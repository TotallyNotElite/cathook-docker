#!/bin/bash

#
#	Symlinks
#

max=12

if [ "$#" == 1 ]; then
	max=$1
fi

kisak=`cat kisak`

if ! [ -e "/opt/steamapps" ]; then
	echo "Can't find steamapps folder."
	echo "Please, run scripts in the right order."
	exit
fi

read -p "Press ENTER to continue"

STEAM_ROOT=/home/$kisak-1/.local/share/Steam

cd $STEAM_ROOT ; while [ $(pwd) != "/" ]; do echo $(pwd); sudo chmod +x .; cd ..; done
sudo chmod g+rwx -R $STEAM_ROOT

for i in $(seq 2 $max)
do
	if ! [ -d "/home/$kisak-$i" ]; then
		echo "No $kisak $i";
		continue;
	fi
	echo "Linking for $kisak-$i"
	sudo -H -u $kisak-$i bash -c "mkdir -p \"/home/$kisak-$i/.local/share/Steam\""	
	if ! [ -e "/home/$kisak-$i/.steam/steam" ]; then
		sudo -H -u $kisak-$i bash -c "mkdir -p \"/home/$kisak-$i/.steam\""
		sudo -H -u $kisak-$i bash -c "ln -s \"/home/$kisak-$i/.local/share/Steam\" \"/home/$kisak-$i/.steam/steam\""
	fi
	cd /home/$kisak-$i/.local/share/Steam
	for s in controller_base linux32 linux64 public package graphics ubuntu12_32 ubuntu12_64 resource tenfoot bin friends servers bootstrap.tar.xz; do
		sudo rm -rf "/home/$kisak-$i/.local/share/Steam/$s"
		sudo -H -u $kisak-$i bash -c "ln -s \"$STEAM_ROOT/$s\" \"/home/$kisak-$i/.local/share/Steam/$s\""	
	done
done
