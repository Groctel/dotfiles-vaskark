#!/bin/sh
# Lists dark themes by default.
# Light themes are listed if an argument is passed.
# Export FZWAL_RESET_CURSOR=1 if you don't want Pywal to change
# the default behaviour of the terminal cursor (inverse fg and bg).

cp -f ~/.cache/wal/colors.json /tmp/fzwal-backup.json

SCRIPTS='-o wal-berry.sh -o wal-dunst.sh -o wal-xss.sh'

if [ -n "$1" ]; then
    IS_LIGHT=TRUE
    THEME=$(wal --theme |
            sed '1,/Light Themes/d;/Extra/,$d' |
            sed -e '/^\S/d' -e 's/ - //' |
            fzf --preview='wal -qetl --theme {} && wal --preview')
else
    THEME=$(wal --theme |
            sed '/Light Themes/,$d' |
            sed -e '/^\S/d' -e 's/ - //' |
            fzf --preview='wal -qet --theme {} && wal --preview')
fi


if [ -n "$THEME" ]; then
    if [ -n "$IS_LIGHT" ]; then
        wal -ql --theme $THEME $SCRIPTS
    else
        wal -q --theme $THEME $SCRIPTS
    fi
else
    wal -q --theme /tmp/fzwal-backup.json $SCRIPTS
fi

if [ -n "$FZWAL_RESET_CURSOR" ]; then
    for TTY in /dev/pts/*; do
        [ -w $TTY ] && /bin/printf "\e]112\a" > $TTY
    done
    exit 0
fi
