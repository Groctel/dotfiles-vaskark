#!/bin/bash
# Toggle polybar:
# Kill it if it is running or spawn it if it does not running
xdotool search --class Polybar &>/dev/null && (ps x | grep "polybar --class Polybar" | grep -v grep | awk '{print $1}' | xargs kill) || polybar -r -c ~/.config/polybar/no-ewmh/config.no-ewmh top &
