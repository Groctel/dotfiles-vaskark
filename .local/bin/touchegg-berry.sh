#!/bin/sh

rm -f $HOME/.config/touchegg/touchegg.conf
ln -s $HOME/.config/touchegg/touchegg-berry.conf $HOME/.config/touchegg/touchegg.conf

killall -s USR1 touchegg
sleep 0.1s
touchegg &
