#!/bin/zsh

# zsh profile file. Runs on login. Environmental variables are set here.

# If you don't plan on reverting to bash, you can remove the link in ~/.profile
# to clean up.

# Adds `~/.local/bin` to $PATH
export PATH=$HOME/.local/bin:$PATH

# General
#export TERM="xterm-256color"
#export EDITOR=nvim

# pfetch
export PF_INFO="os kernel uptime shell wm memory"
export PF_SEP=":"
export PF_COL1=2
export PF_COL2=4

# fzf
export FZF_DEFAULT_OPTS='--border'
#export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
#export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
#export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
