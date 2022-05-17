#!/bin/sh

sh -c 'ls -t "$HOME"/Pictures/* | head -50 | xargs nsxiv -rt'