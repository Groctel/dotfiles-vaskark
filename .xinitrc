#!/bin/sh

# misc
xset +fp ~/.local/share/fonts/misc
xrdb -merge $HOME/.config/x11/xresources

# ssh-agent
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
    eval `ssh-agent`
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

# wm
session=${1:-berry}
case ${session} in
    berry) /usr/local/bin/berry ;;
    bspwm) exec /usr/bin/bspwm ;;
    openbox) exec /usr/bin/openbox-session ;;
    gnome) exec /usr/bin/gnome-session ;;
    *) exec $1 ;;
esac
