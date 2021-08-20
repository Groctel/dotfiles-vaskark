#!/bin/sh

# system
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# .xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# wm
session=${1:-berry}
case $session in
    berry) exec /usr/local/bin/berry 2>/tmp/xinitrc.log ;;
    bspwm) exec /usr/bin/bspwm 2>/tmp/xinitrc.log ;;
    openbox) exec /usr/bin/openbox-session 2>/tmp/xinitrc.log ;;
    gnome) exec /usr/bin/gnome-session 2>/tmp/xinitrc.log ;;
    *) exec $1 2>/tmp/xinitrc.log ;;
esac