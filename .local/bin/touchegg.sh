#!/bin/sh

if [ "$(pgrep -x touchegg)" ]; then
	pkill -x touchegg 2>/dev/null
	touchegg 2>/dev/null &
else
	touchegg 2>/dev/null &
fi
