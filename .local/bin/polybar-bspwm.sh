#!/bin/bash

# Terminate already running bar instances
if ps -A | grep polybar; then
	killall -q polybar
fi

# Launch
echo "---" | tee -a /tmp/polybar.log
polybar -r -c ~/.config/bspwm/polybar/config.bspwm main >>/tmp/polybar.log 2>&1 &

#echo "Bars launched..."
