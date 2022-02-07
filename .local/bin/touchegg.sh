#!/bin/bash

if [[ "$(pgrep -x touchegg)" ]]; then
	killall -q touchegg 2>/dev/null
	touchegg &>/dev/null &
else
	touchegg &>/dev/null &
fi
