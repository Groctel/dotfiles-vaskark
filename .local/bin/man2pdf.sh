#!/bin/sh

man -k . | rofi -dmenu -p 'Man' -theme-str 'window {width: 15%;} listview {lines: 5;}' | awk '{print $1}' | xargs -r man -T pdf | zathura -
