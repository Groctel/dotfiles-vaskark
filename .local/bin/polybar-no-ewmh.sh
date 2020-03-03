#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Launch
echo "---" | tee -a /tmp/polybar-top.log /tmp/polybar-bottom.log
polybar -r -c ~/.config/polybar/config.no-ewmh top >>/tmp/polybar-top.log 2>&1 &
#polybar -r -c ~/.config/polybar/config.no-ewmh bottom >>/tmp/polybar-bottom.log 2>&1 &

#echo "Bars launched..."
