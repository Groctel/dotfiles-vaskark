#!/bin/bash

TE=$(pgrep -x touchegg)
if [[ -n "$TE" ]]; then
	killall -q touchegg 2>/dev/null
	touchegg &>/dev/null &
else
	touchegg &>/dev/null &
fi
