#!/bin/sh

#
# ytd - youtube-dl
#

case $1 in
    a|audio)
        youtube-dl \
            --add-metadata \
            --ignore-errors \
            -f "bestaudio[ext=m4a]" \
            -o "$HOME/Downloads/%(title)s.%(ext)s" \
            "$2"

        exit
    ;;
    v|video)
        youtube-dl \
            --ignore-errors \
            -f "bestvideo[ext=mp4][height<1200]+bestaudio[ext=m4a]/best[ext=mp4][height<1200]/best" \
            -o "$HOME/Downloads/%(title)s.%(ext)s" \
            "$2"

        exit
    ;;
    *)
        printf 'Usage: ytd a|audio|v|video url\n'
        exit
    ;;
esac
