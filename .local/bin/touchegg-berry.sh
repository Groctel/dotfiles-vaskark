#!/bin/sh

rm -f $HOME/.config/touchegg/touchegg.conf
ln -s $HOME/.config/touchegg/touchegg-berry.conf $HOME/.config/touchegg/touchegg.conf

#if ps -A | grep touchegg; then
#	killall -q touchegg
#fi

#touchegg &
