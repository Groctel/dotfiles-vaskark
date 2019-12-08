#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch top and bottom
polybar -r -c ~/.config/polybar/config.no-ewmh top &
#polybar -r -c ~/.config/polybar/config.no-ewmh bottom &
