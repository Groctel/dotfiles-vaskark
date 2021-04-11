# path
export PATH="$HOME/.local/bin:$PATH"

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
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANPAGER="nvim -c 'set ft=man' -"

# pfetch
export PF_INFO="kernel uptime shell wm memory palette" 
export PF_COL1=2
export PF_COL2=4

# nnn
export NNN_FIFO='/tmp/nnn.fifo' 
export NNN_COLORS='2345'
export NNN_TRASH=1
export NNN_OPENER=$HOME/.config/nnn/plugins/nuke
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_PLUG='f:fzcd;o:fzopen;d:diffs;i:ipinfo;v:imgview;m:mediainf;n:nuke;w:wall'

# fzf
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git' --exclude '.cache'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND --type f"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
export FZF_DEFAULT_OPTS="
--layout=reverse-list
--info=inline
--height=50%
--multi
--border=sharp
--preview-window=:hidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
"
