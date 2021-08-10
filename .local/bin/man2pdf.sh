#!/bin/sh

man -k . | rofi -dmenu -p 'Man:' -l 5 -width 12 | awk '{print $1}' | xargs -r man -Tpdf | zathura -

