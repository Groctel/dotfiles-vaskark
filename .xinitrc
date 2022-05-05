#!/bin/sh

# fonts
xset +fp "$HOME"/.local/share/fonts/misc,/usr/local/share/fonts/spleen

# xresources
[ -f "$HOME"/.Xresources ] && xrdb -merge "$HOME"/.Xresources

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
    wayland) env GNOME_SHELL_SESSION_MODE=ubuntu /usr/bin/gnome-session --session=ubuntu ;;
    shod) "$HOME"/.config/shod/autostart ;;
    *) exec $1 ;;
esac
