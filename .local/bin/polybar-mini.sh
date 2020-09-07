#!/usr/bin/env sh

# Terminate already running bar instances
if ps -A | grep polybar; then
	killall -q polybar
fi

# Launch
echo "---" | tee -a /tmp/polybar-mini.log
#polybar -r -c $HOME/.config/polybar/config top >>/tmp/polybar1.log 2>&1 &
polybar -r -c $HOME/.config/polybar/config.mini default >>/tmp/polybar-mini.log 2>&1 &

#echo "Bars launched..."
