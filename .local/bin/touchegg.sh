#!/bin/bash

if pgrep -x touchegg; then
	killall -q touchegg 2> /dev/null
fi
touchegg &
