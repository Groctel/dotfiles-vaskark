#!/bin/bash

# relaunch berry if the binary changes, otherwise bail
csum=$(sha1sum $(which berry))
new_csum=""
while true
do
    if [ "$csum" != "$new_csum" ]
    then
        csum=$new_csum
        berry
    else
        exit 0
    fi
    new_csum=$(sha1sum $(which berry))
    sleep 0.5
done
