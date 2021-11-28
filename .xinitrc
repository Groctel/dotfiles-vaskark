#!/bin/sh

# .xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# wm
session=${1:-berry}
case ${session} in
    berry) exec /usr/local/bin/berry ;;
    bspwm) exec /usr/bin/bspwm ;;
    openbox) exec /usr/bin/openbox-session ;;
    gnome) exec /usr/bin/gnome-session ;;
    *) exec $1 ;;
esac
