#!/bin/sh

#
# Picom start/reload
#


# if picom is running, kill it to prevent multiple instances
if [ "$(pgrep -x picom)" ]; then
	pkill -x picom
fi

# launch
picom --experimental-backends --config ~/.config/picom/picom.conf 2>/dev/null &
