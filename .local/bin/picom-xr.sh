#!/usr/bin/env sh

# If picom is running, kill it to prevent multiple instances
if ps -A | grep picom; then
	killall -q picom
fi

sleep 0.1s

# Launch
picom --config ~/.config/picom/picom-xr.conf >> /tmp/picom.log 2>&1 &
