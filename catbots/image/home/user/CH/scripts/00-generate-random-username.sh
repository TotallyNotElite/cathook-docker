#!/bin/bash

#
# Script generates random 6-char length string that will be used for usernames
#

name=$(cat /dev/urandom | tr -dc 'a-z' | fold -w 6 | head -n 1)
echo $name > kisak
