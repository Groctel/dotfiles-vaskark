#!/bin/bash

rm -f $HOME/.config/touchegg/touchegg.conf
ln -s $HOME/.config/touchegg/touchegg-bspwm.conf $HOME/.config/touchegg/touchegg.conf

killall -9 touchegg &> /dev/null
touchegg &> /dev/null
