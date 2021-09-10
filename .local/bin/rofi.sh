#!/bin/sh

rofi -show drun \
-display-drun 'Apps' \
-display-run 'Bin' \
-display-ssh 'SSH' \
-display-filebrowser 'Files' \
-display-emoji 'Emoji' \
-display-keys 'Keys' \
-disable-history \
-hide-scrollbar \
-matching normal \
-font 'scientifica bold 8' \
-theme-str 'window {width: 14%; lines: 6;}'
