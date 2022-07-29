#!/usr/bin/env bash

#
# Pywal theme switcher
#

theme=$(wal --theme | sed '/Light Themes/,$d' | sed '/Dark Themes/,$d' | sed -e '/^\S/d' -e 's/ - //' | rofi \
    -dmenu \
    -i \
    -p 'Themes' \
    -hide-scrollbar \
    -matching normal \
    -font 'scientifica bold 8' \
    -theme "$HOME/.cache/wal/colors-rofi-mine.rasi" \
    -theme-str 'window {width: 12%;} listview {lines: 4; columns: 1;}')

if [ "$theme" ]; then
	wal -q --theme $theme -o wal-extras.sh 2>/dev/null
fi

