#!/bin/bash

rm -f "$HOME"/.config/touchegg/.touchegg.lock

if pgrep -x touchegg; then
	killall -q touchegg
fi

touchegg &
