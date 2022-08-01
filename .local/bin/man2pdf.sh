#!/bin/sh

#
# Manpage pdf
#

choice=$(man -k . | \
	rofi \
	-i \
	-dmenu \
	-p 'Manpages' \
	-font 'scientifica bold 8' \
	-theme '~/.cache/wal/colors-rofi-mine.rasi' \
	-theme-str 'window {width: 15%;} listview {lines: 5;}' | \
	awk '{ print $1 }')

[ -n "$choice" ] && echo "$choice" | xargs -r man -T pdf | zathura -