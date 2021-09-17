#!/bin/sh

man -k . | rofi -dmenu -p 'Man:' -l 5 -theme-str 'window {width: 15%;}' | awk '{print $1}' | xargs -r man -Tpdf | zathura -