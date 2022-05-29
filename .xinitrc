#!/bin/sh

# misc
xset +fp "$HOME"/.local/share/fonts/misc,/usr/local/share/fonts/spleen
xrdb -merge "$HOME"/.Xresources
# plank
export XDG_SESSION_TYPE=x11

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
    cwm) "$HOME"/bin/cwm.sh ;;
    gnome) /usr/bin/gnome-session ;;
    openbox) /usr/bin/openbox-session ;;
    sdorfehs) /usr/local/bin/sdorfehs ;;
    *) exec $1 ;;
esac
