#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Launch
echo "---" | tee -a /tmp/polybar.log
polybar -r -c ~/.config/polybar/config main-small-bottom -l info >>/tmp/polybar.log 2>&1 &

#echo "Bars launched..."
