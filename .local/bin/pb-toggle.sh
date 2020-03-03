#!/bin/bash
# Toggle polybar:
# If on, turn off. If off, start.
xdotool search polybar &>/dev/null && (ps x | grep "polybar" | grep -v grep | awk '{print $1}' | xargs kill) || polybar-2b.sh &
