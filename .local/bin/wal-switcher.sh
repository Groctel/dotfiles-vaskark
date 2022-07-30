#!/bin/sh

#
# Pywal user theme switcher
#

theme=$(wal --theme | sed '/Light Themes/,$d' | sed '/Dark Themes/,$d' | sed -e '/^\S/d' -e 's/ - //' | rofi \
    -dmenu \
    -i \
    -p 'pywal' \
    -hide-scrollbar \
    -matching fuzzy \
    -font 'scientifica bold 8' \
    -theme "$HOME/.cache/wal/colors-rofi-mine.rasi" \
    -theme-str 'window {width: 12%;} listview {lines: 4; columns: 1;}'
)

[ -n "$theme" ] && wal -q --theme "$theme" -o wal-extras.sh
