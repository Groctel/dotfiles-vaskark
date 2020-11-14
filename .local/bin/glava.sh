#!/bin/sh
# GLava toggle

TOGGLE=$HOME/.cache/glava-toggle

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    killall -9 glava
else
    rm $TOGGLE
    glava -d -a fifo
fi
