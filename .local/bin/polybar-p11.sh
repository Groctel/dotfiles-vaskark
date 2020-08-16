#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
pkill polybar

# Launch
echo "---" | tee -a /tmp/polybar.log
polybar main -r -c ~/.config/polybar/config.p11 &

#echo "Bars launched..."
