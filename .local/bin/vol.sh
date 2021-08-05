#!/bin/sh

PULSE=true
NUM="${2:-5}"

if [ "$PULSE" = true ]; then
    toggle() { pulsemixer --toggle-mute ;}
    up() { pulsemixer --change-volume +"$NUM" ;}
    down() { pulsemixer --change-volume -"$NUM" ;}
else
    toggle() { amixer sset Master toggle ;}
    up() { amixer sset Master "$NUM"%+ ;}
    down() { amixer sset Master "$NUM"%- ;}
fi

case "$1" in
    t) toggle ;;
    u) up ;;
    d) down ;;
esac >/dev/null
