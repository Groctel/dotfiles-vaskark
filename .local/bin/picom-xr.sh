#!/bin/sh

#
# Picom start/reload
#

# if picom is running, kill it to prevent multiple instances
if [ "$(pgrep -x picom)" ]; then
	pkill -x picom
fi

# launch
picom --config ~/.config/picom/picom-xr.conf 2>/dev/null &
