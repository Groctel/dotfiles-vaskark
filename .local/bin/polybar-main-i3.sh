#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Launch
echo "---" | tee -a /tmp/polybar.log
polybar -r -c ~/.config/polybar/config main-i3 >>/tmp/polybar.log 2>&1 &

#echo "Bars launched..."
