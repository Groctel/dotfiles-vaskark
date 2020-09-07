#!/usr/bin/env sh

# Terminate already running bar instances
if ps -A | grep polybar; then
	killall -q polybar
fi

# Launch
echo "---" | tee -a /tmp/polybar.log
polybar main -r -c ~/.config/polybar/config.p11 &

#echo "Bars launched..."
