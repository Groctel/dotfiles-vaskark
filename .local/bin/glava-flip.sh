#!/bin/bash

GLAVA=$(pgrep -x glava)

if [[ -n "${GLAVA}" ]]; then
    
    CURRENT=$(awk '/#define FLIP/ {print $3}' ~/.config/glava/bars.glsl)
    if [[ "${CURRENT}" = 1 ]] ; then
    	sed -i "s|#define FLIP.*$|#define FLIP 0|g" ~/.config/glava/bars.glsl
    else	
	sed -i "s|#define FLIP.*$|#define FLIP 1|g" ~/.config/glava/bars.glsl
    fi
    
    killall -q glava && glava -d &>/dev/null &

fi