#!/bin/sh

if [ "$(pgrep -x glava)" ]; then
    
    CURRENT=$(awk '/#define FLIP/ {print $3}' ~/.config/glava/bars.glsl)
    if [ "${CURRENT}" = 1 ] ; then
        sed -i "s|#define FLIP.*$|#define FLIP 0|g" ~/.config/glava/bars.glsl
    else	
	    sed -i "s|#define FLIP.*$|#define FLIP 1|g" ~/.config/glava/bars.glsl
    fi
    
    pkill -x glava; glava -d 2>/dev/null &

fi