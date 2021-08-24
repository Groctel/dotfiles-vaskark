# use 'exec startx' to be logged out of X when quit
#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#  startx
#fi

#if [[ "$(tty)" = "/dev/tty1" ]]; then
#  pgrep berry || startx
#fi
