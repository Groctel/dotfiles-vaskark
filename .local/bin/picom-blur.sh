#!/usr/bin/env sh

# If picom is running, kill it to prevent multiple instances
if ps -A | grep picom; then
	killall -q picom
fi

# Wait until the processes have been shut down
sleep 0.1s

# Launch
picom --dbus --experimental-backends --config ~/.config/picom/picom-blur.conf >> /tmp/picom.log 2>&1 &
