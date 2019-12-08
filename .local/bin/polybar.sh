#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch top and bottom
echo "---" | tee -a /tmp/polybar-top.log /tmp/polybar-bottom.log
polybar top >>/tmp/polybar-top.log 2>&1 &
polybar bottom >>/tmp/polybar-bottom.log 2>&1 &

echo "Bars launched..."
