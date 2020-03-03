#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Launch
echo "---" | tee -a /tmp/polybar-main.log
polybar -r -c ~/.config/polybar/config2b main >>/tmp/polybar-main.log 2>&1 &

#echo "Bars launched..."
