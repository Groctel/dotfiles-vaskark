#!/usr/bin/env sh

# If picom is running, kill it to prevent multiple instances
if ps -A | grep picom; then
	killall -q picom
fi

sleep 1s

# Launch
picom --dbus --experimental-backends --config ~/.config/picom/picom.conf >> /tmp/picom.log 2>&1 &
