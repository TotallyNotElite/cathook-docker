#!/bin/bash

#
#	This script will make a link to steamapps in /opt/steamapps
#
max=12
if [ $EUID == 0 ]; then
	echo "This script must not be run as root"
	exit
fi

if ! [ $(getent group `cat kisak`s) ]; then
	echo "Please, run scripts in the right order."
	exit
fi

if [ "$#" -ne 1 ]; then
	echo "Usage:"
	echo "    $0 \"/path/to/steam\""
	exit
fi

# Check if this path contains file specific to Team Fortress 2

if ! [ -e "$1/steam/steamapps/common/Team Fortress 2/tf/gameinfo.txt" ]; then
	echo "Specified path doesn't point to steam or you don't have Team Fortress 2 installed"
	exit
fi

echo "Is this the correct path?"
echo "$1"
read -p "Press enter to continue or Ctrl+C (close) to stop."
sudo ln -s "$1" "/opt/steam"
workdir=$PWD
# fuck permissions!!!

sudo chown -h $USER:`cat kisak`s "/opt/steam"
sudo chown -R $USER:`cat kisak`s "/opt/steam"
sudo chmod -R g+rwx "/opt/steam"
sudo chmod +x "/opt"
sudo chmod +x "/opt/steam"
sudo chmod -R go+X "$1"
sudo chown -R $USER:`cat kisak`s "/opt/steam/ubuntu12_32"
sudo chown -R $USER:`cat kisak`s "/opt/steam/ubuntu12_64"
sudo chown -R $USER:`cat kisak`s "/opt/steam/package"
cd $(realpath /opt/steam/ubuntu12_32) ; while [ $(pwd) != "/" ]; do echo $(pwd); sudo chmod +x .; cd ..; done
cd $(realpath /opt/steam/ubuntu12_64) ; while [ $(pwd) != "/" ]; do echo $(pwd); sudo chmod +x .; cd ..; done
cd $(realpath /opt/steam/package) ; while [ $(pwd) != "/" ]; do echo $(pwd); sudo chmod +x .; cd ..; done
cd $workdir
for i in $(seq 1 $max)
do
    sudo rm -r "/home/`cat kisak`-$i/.steam/ubuntu12_32"
    sudo rm -r "/home/`cat kisak`-$i/.steam/ubuntu12_64"
    sudo rm -r "/home/`cat kisak`-$i/.steam/package"
    sudo -H -u `cat kisak`-$i bash -c "ln -s \"/opt/steam/ubuntu12_32\" \"/home/`cat kisak`-$i/.steam\""
    sudo -H -u `cat kisak`-$i bash -c "ln -s \"/opt/steam/ubuntu12_64\" \"/home/`cat kisak`-$i/.steam\""
    sudo -H -u `cat kisak`-$i bash -c "ln -s \"/opt/steam/package\" \"/home/`cat kisak`-$i/.steam\""
done
