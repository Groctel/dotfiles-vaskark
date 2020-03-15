#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Launch
echo "---" | tee -a /tmp/polybar-main.log
polybar -r -c ~/.config/polybar/config main-i3 >>/tmp/polybar-main-i3.log 2>&1 &

#echo "Bars launched..."
