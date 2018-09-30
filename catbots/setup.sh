#!/bin/bash

name=$(cat /dev/urandom | tr -dc 'a-z' | fold -w 6 | head -n 1)
echo $name > kisak

cp ./kisak ./image/home/user/CH/

make
