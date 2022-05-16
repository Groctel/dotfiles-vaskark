#!/bin/sh

if [ "$(pgrep -x glava)" ]; then
	pkill glava
else
	glava -d
fi
