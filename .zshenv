# term
export TERM="xterm-256color"

# xdg
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# editor
export EDITOR='nvim'
export VISUAL='nvim'

# man
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANPAGER="nvim -c 'set ft=man' -"

# pfetch
export PF_INFO="kernel uptime shell wm memory palette" 
export PF_COL1=2
export PF_COL2=4
#export PF_ASCII="darwin"

# nnn
export NNN_FIFO='/tmp/nnn.fifo' 
export NNN_COLORS='2345'
export NNN_TRASH=1

# path
typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")
export PATH
