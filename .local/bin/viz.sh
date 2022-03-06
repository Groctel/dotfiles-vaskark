#!/usr/bin/env bash

# Toggle visualizer:
# Kill it if it is running or spawn it if it does not running

xdotool search --class Visualizer &>/dev/null && (ps -x | grep "kitty --class Visualizer" | grep -v grep | awk '{print $1}' | xargs kill) || kitty --class Visualizer -o background_opacity=0 -o font_size=1 -o window_margin_width=0 -o window_padding_width=0 -o initial_window_width=300 -o initial_window_height=100 -e pfetch &
