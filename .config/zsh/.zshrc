# options
setopt autocd autopushd hist_ignore_all_dups inc_append_history extended_history share_history
stty stop undef # Disable ctrl-s to freeze terminal.

# aliases
[ -f "$ZDOTDIR/aliases" ] && source "$ZDOTDIR/aliases"

# basic auto/tab complete:
zmodload zsh/complist
autoload -Uz compinit; compinit
_comp_options+=(globdots) # Include hidden files
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|?=**'
zstyle ':completion:*' menu select

# use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# mode
bindkey -v
export KEYTIMEOUT=1

# change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt

# edit line
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# kitty
kitty + complete setup zsh | source /dev/stdin

# wal
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors.sh

# urxvt/xterm cursor beam: 35 (blink), 36 (no blink)
echo -e -n "\x1b[\x36 q"

# ncmpcpp (ctrl+\)
ncmpcppShow() {
  BUFFER="ncmpcpp -q"
  zle accept-line
}
zle -N ncmpcppShow
bindkey '^\' ncmpcppShow

# fff
f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

# lf
[ -f "$XDG_CONFIG_HOME/lf/icons" ] && source "$XDG_CONFIG_HOME/lf/icons"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# functions
source $ZDOTDIR/functions/fzf-edit 2>/dev/null
source $ZDOTDIR/functions/fzf-kill 2>/dev/null
source $ZDOTDIR/functions/fzf-man 2>/dev/null
source $ZDOTDIR/functions/fzf-git 2>/dev/null

# extract
source $ZDOTDIR/zsh-extract/extract.plugin.zsh 2>/dev/null

# autosuggestions
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^ ' autosuggest-toggle

# syntax highlighting
# source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(brackets cursor line main pattern regexp root)
# ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=black,bold,bg=red')

# f-sy-h
source $ZDOTDIR/fast-syntax-highlighting/F-Sy-H.plugin.zsh 2>/dev/null

# keychain
eval "$(keychain --eval --agents ssh id_rsa --timeout 30 -q)"

# pure
# fpath+=~/.pure
# zstyle ':prompt:pure:prompt:success' color magenta
# zstyle ':prompt:pure:git:stash' show yes
# autoload -U promptinit; promptinit
# prompt pure

# starship
eval "$(starship init zsh)"
