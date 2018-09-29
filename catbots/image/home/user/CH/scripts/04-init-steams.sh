#!/bin/bash

#
#	This script starts N steam instances, 6 by default
#	Can also be used to start instances #N-#M

min=1
max=6

if [ "$#" == 1 ]; then
	max=$1
elif [ "$#" == 2 ]; then
	min=$1
	max=$2	
fi

# Required for steam to start as other users
xhost + >/dev/null

for i in $(seq $min $max)
do
	echo "Starting Steam for `cat kisak` $i"
	sudo su - `cat kisak`-$i -c "steam &>/tmp/steam-`cat kisak`-$i.log 2>&1 &"
done
