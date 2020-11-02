#!/bin/bash

# If picom is running, kill it to prevent multiple instances
if ps -A | grep picom; then
	killall -q picom
fi

# Wait until the processes have been shut down
sleep 0.05s

# Launch
picom --experimental-backends --config ~/.config/picom/picom.conf >> /tmp/picom.log 2>&1 &
