# path
typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")
export PATH

# env
export SSH_KEY_PATH="~/.ssh/id_rsa"
export EDITOR='nvim'
export VISUAL='nvim'
export BROWSER='google-chrome-stable'

# fzf
export FZF_DEFAULT_OPTS='--border'

# pfetch
export PF_INFO="os kernel uptime shell wm memory"
export PF_SEP=":"
export PF_COL1=2
export PF_COL2=4

# nnn
export NNN_FIFO='/tmp/nnn.fifo' 
export NNN_COLORS='2356'
export NNN_TRASH=1

# zone
export TZ=":/usr/share/zoneinfo/America/Toronto"
