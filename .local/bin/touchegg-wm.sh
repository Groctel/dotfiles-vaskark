#!/bin/bash

rm -f $HOME/.config/touchegg/.touchegg.lock
rm -f $HOME/.config/touchegg/touchegg.conf
ln -s $HOME/.config/touchegg/touchegg-wm.conf $HOME/.config/touchegg/touchegg.conf

if ps -A | grep touchegg; then
	killall -q touchegg
fi

touchegg &
