#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done

# Launch bar
polybar -r -c ~/.config/bspwm/polybar/current main &

external_monitor=$(xrandr --query | grep 'HDMI-2')
if [[ $external_monitor = *connected* ]]; then
    polybar -r -c ~/.config/bspwm/polybar/current ext &
fi