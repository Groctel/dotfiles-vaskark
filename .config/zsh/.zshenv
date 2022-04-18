# path
export PATH="$HOME/.local/bin:$PATH"
typeset -U PATH path

# xdg
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# gtk-2.0
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"

# less
export LESSHISTFILE=""

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# man
export MANPAGER="nvim +Man!"

# qt
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_QPA_PLATFORMTHEME="qt5ct"

# pfetch
export PF_INFO="ascii os kernel memory uptime wm shell" 
export PF_COL1=2
export PF_COL2=5
export PF_ASCII="OpenBSD"

# rg
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep" 

# starship
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/pure.toml"

# nnn
export NNN_OPTS="acCDEoQ"
export NNN_COLORS="2456"
export NNN_TRASH=2
export NNN_OPENER="$HOME/.config/nnn/plugins/nuke"
export NNN_ORDER="t:$HOME/Pictures;t:$HOME/Pictures/wow;t:$HOME/Pictures/shots"
export NNN_PLUG="d:diffs;g:-!git diff;k:pskill;l:-!git log;m:-!mediainfo;n:nuke;o:fzopen;s:suedit;v:imgview;w:wall"

# fzf
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git' --exclude '.cache'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND --type f"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
export FZF_CTRL_R_OPTS="--exact"
export FZF_DEFAULT_OPTS="
--header-first
--layout=reverse-list
--info=default
--height=70%
--multi
--padding=1
--border=sharp
--preview-window=:hidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
"

# fff
export FFF_COL1=2   # dir
export FFF_COL2=5   # status bg
export FFF_COL3=4   # sel
export FFF_COL4=5   # cursor
export FFF_COL5=0   # status fg
