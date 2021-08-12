#!/bin/bash

rm -f "$HOME"/.config/touchegg/.touchegg.lock
rm -f "$HOME"/.config/touchegg/touchegg.conf
ln -s "$HOME"/.config/touchegg/touchegg-default.conf "$HOME"/.config/touchegg/touchegg.conf

if pgrep -x touchegg; then
	killall -q touchegg
fi

touchegg &
