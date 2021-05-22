#!/bin/bash

# If picom is running, kill it to prevent multiple instances
if ps -A | grep picom; then
	pkill picom
fi

# Wait until the processes have been shut down
sleep 0.05s

# Launch
picom --config ~/.config/picom/picom-xr.conf >> /tmp/picom.log 2>&1 &
