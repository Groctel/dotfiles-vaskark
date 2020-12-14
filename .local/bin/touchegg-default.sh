#!/bin/bash

rm -f $HOME/.config/touchegg/touchegg.conf
ln -s $HOME/.config/touchegg/touchegg-default.conf $HOME/.config/touchegg/touchegg.conf

killall -9 touchegg &> /dev/null
sleep 0.1
touchegg &> /dev/null &

