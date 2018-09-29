#!/bin/bash

#
#	This script copies recommended settings to cathook folder
#

if [ $EUID == 0 ]; then
	echo "This script must not be run as root"
	exit
fi

sudo mkdir -p "/opt/cathook/data"
sudo chmod 777 "/opt/cathook/data"

cp cat_autoexec_textmode.cfg "/opt/steamapps/common/Team Fortress 2/tf/cfg"
cp botspam "/opt/cathook/data"
