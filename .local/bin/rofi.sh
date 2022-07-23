#!/bin/sh

#
# rofi
#

rofi -show drun \
-display-drun '🚀' \
-display-run '👾' \
-display-ssh '💻' \
-display-emoji '🍔' \
-display-keys '🔑' \
-disable-history \
-font "scientifica bold 8" \
-hide-scrollbar \
-matching normal \
-theme "~/.cache/wal/colors-rofi-mine.rasi" \
-theme-str 'window {width: 15%;} listview {lines: 5;}'
