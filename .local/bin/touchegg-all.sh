#!/bin/sh

# remove symlink
rm -f $HOME/.config/touchegg/touchegg.conf

# current env
ENV="$DESKTOP_SESSION"

# make new symlink based on current env
while :
do
    read ENV
    case $ENV in
        berry)
            ln -s $HOME/.config/touchegg/touchegg-berry.conf $HOME/.config/touchegg/touchegg.conf
            ;;
        bspwm)
            ln -s $HOME/.config/touchegg/touchegg-bspwm.conf $HOME/.config/touchegg/touchegg.conf
            ;;
        sowm)
            ln -s $HOME/.config/touchegg/touchegg-sowm.conf $HOME/.config/touchegg/touchegg.conf
            ;;
        *)
            ln -s $HOME/.config/touchegg/touchegg-default.conf $HOME/.config/touchegg/touchegg.conf
            ;;
    esac
done

# kill and/or start
if ps -A | grep touchegg; then
	killall -q touchegg
fi
touchegg &
