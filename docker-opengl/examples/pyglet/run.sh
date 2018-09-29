#!/bin/sh

script_dir="`cd $(dirname $0); pwd`"

$script_dir/../../run.sh  -i pyglet -p 6081 "$@"
