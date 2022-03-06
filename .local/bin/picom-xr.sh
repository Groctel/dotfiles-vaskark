#!/bin/sh

#
# Picom start/reload
#

if [ "$(pgrep -x picom)" ]; then
	pkill -x picom
	picom --config ~/.config/picom/picom-xr.conf 2>/dev/null &
else
	picom --config ~/.config/picom/picom-xr.conf 2>/dev/null &
fi