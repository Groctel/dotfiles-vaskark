#!/usr/bin/env sh

# If picom is running, kill it to prevent multiple instances
if ps -A | grep picom; then
	killall -q picom
fi

# Launch
picom --experimental-backends --config ~/.config/picom/picom-blur.conf >> /tmp/picom.log 2>&1 &
