#!/bin/bash

#
#	This script stops all processes of steam and TF2
#

sudo kill $(cat /tmp/cat-ipc-server.pid /tmp/ncat-cathook-webpanel.pid /tmp/ncat-account-generator.pid)
sudo killall -9 hl2_linux
sudo killall -9 steam

sudo rm /tmp/ncat-account-generator.pid
sudo rm /tmp/ncat-cathook-webpanel.pid