#!/bin/sh

#
# Picom start/reload
#

if [ "$(pgrep -x picom)" ]; then
	pkill -x picom
	picom --experimental-backends --config ~/.config/picom/picom.conf 2>/dev/null &
else
	picom --experimental-backends --config ~/.config/picom/picom.conf 2>/dev/null &
fi
