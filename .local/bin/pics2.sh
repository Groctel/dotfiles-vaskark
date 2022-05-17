#!/bin/sh

sh -c 'ls -t "$HOME"/Pictures/wow/* | head -50 | xargs nsxiv -rt'