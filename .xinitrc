#!/bin/sh

# misc
xset +fp "$HOME"/.local/share/fonts/misc
xrdb -merge "$HOME"/.Xresources

# ssh-agent
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
    eval "$(ssh-agent)" 2>/dev/null
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

# wm
session=${1:-berry}

case ${session} in
    berry) /usr/local/bin/berry ;;
    bspwm) /usr/bin/bspwm ;;
    openbox) /usr/bin/openbox-session ;;
    gnome) /usr/bin/gnome-session ;;
    shod) "$HOME"/.config/shod/autostart ;;
    *) exec $1 ;;
esac