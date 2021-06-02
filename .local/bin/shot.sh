#!/usr/bin/env bash

if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]] || [[ "${1}" == "help" ]]; then
    cat << 'EOF'

dmenu_shot provides a menu with set of custom commands to
perform some simple automated image manipulation on screenshots
taken using Flameshot, and then putting them into clipboard.


Commands:
    -h, --help    To show this help


Menu:
    Trim:         It just trims the extra spaces around the
                   selected region.
    Remove_white: Useful to remove the white background. It will
                   replace white with transparent.
    Negative:     Convert the image to negative colors.


Author:
    Mehrad Mahmoudian


Git repository for bug report and contributions:
    https://codeberg.org/mehrad/dmenu_shot
EOF
    exit 0
fi


RET=$(echo -e "trim\nremove_white\nnegative\nbordered\ncancel" | dmenu -i -h 28 -fn "scientifica:bold:size=8" -p " screenshot: ")

case $RET in
    trim)
        flameshot gui --raw \
            | convert png:- -trim png:- \
            | xclip -selection clipboard -target image/png
        ;;
    remove_white)
        flameshot gui --raw \
            | convert png:- -transparent white -fuzz 90% png:- \
            | xclip -selection clipboard -target image/png
        ;;
    negative) 
        flameshot gui --raw \
            | convert png:- -negate -channel RGB png:- \
            | xclip -selection clipboard -target image/png
        ;;
    bordered)
        flameshot gui --raw \
            | convert png:- -bordercolor white -border 2 png:- \
            | xclip -selection clipboard -target image/png
        ;;
	*) ;;
esac