#!/bin/sh

# .xprofile
[ -f "$HOME"/.xprofile ] && . "$HOME"/.xprofile

# wm
session=${1:-berry}
case ${session} in
    berry) exec /usr/local/bin/berry ;;
    bspwm) exec /usr/bin/bspwm ;;
    openbox) exec /usr/bin/openbox-session ;;
    gnome) exec /usr/bin/gnome-session ;;
    sway) exec /usr/bin/sway ;;
    *) exec $1 ;;
esac