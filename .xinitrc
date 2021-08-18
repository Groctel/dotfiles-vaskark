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
exec berry 2> /tmp/xinitrc.log