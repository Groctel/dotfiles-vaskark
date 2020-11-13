#!/bin/sh
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.

TOGGLE=$HOME/.cache/glava-toggle

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    killall -9 glava
else
    rm $TOGGLE
    glava -d -a fifo
fi
