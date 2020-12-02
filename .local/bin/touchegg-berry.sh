#!/bin/bash

rm -f $HOME/.config/touchegg/touchegg.conf
ln -s $HOME/.config/touchegg/touchegg-berry.conf $HOME/.config/touchegg/touchegg.conf

killall -9 touchegg &> /dev/null
sleep 0.5
touchegg &
