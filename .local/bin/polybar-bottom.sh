#!/usr/bin/env sh

# Terminate already running bar instances
pkill polybar

# Launch
echo "---" | tee -a /tmp/polybar.log
polybar -r -c ~/.config/polybar/config top >>/tmp/polybar.log 2>&1 &
polybar -r -c ~/.config/polybar/config bottom >>/tmp/polybar.log 2>&1 &

#echo "Bars launched..."
