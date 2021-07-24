# path
typeset -U PATH path

# dir complete
setopt autocd autopushd

# ctrl-s off
stty stop undef

# basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|?=**'
zmodload zsh/complist
compinit
_comp_options+=(globdots)       # Include hidden files.

# kitty completion
kitty + complete setup zsh | source /dev/stdin

# pywal
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

# aliases
[ -f "$ZDOTDIR/.aliases" ] && source "$ZDOTDIR/.aliases"

# mode: vi (v) or emacs (e)
bindkey -e
export KEYTIMEOUT=1

# xterm/urxvt cursor (beam)
# 35 (blink), 36 (no blink)
echo -e -n "\x1b[\x36 q"

# clifm
bindkey -s '^]' 'clifm\n'

# ncmpcpp
ncmpcppShow() {
  BUFFER="ncmpcpp -q"
  zle accept-line
}
zle -N ncmpcppShow
bindkey '^\' ncmpcppShow

# shfm
shfm() {
    cd "$(command shfm "$@")"
}

# fff
f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

# pure
fpath+=/usr/local/pure
autoload -U promptinit; promptinit
zstyle :prompt:pure:git:stash show yes
#zstyle :prompt:pure:path color blue
#zstyle ':prompt:pure:prompt:*' color cyan
prompt pure

# functions
source $ZDOTDIR/functions/fzf-edit 2>/dev/null
source $ZDOTDIR/functions/fzf-kill 2>/dev/null
source $ZDOTDIR/functions/fzf-man 2>/dev/null

# plugins
source $ZDOTDIR/plugins/extract/extract.plugin.zsh 2>/dev/null
source $ZDOTDIR/plugins/command-not-found/command-not-found.plugin.zsh 2>/dev/null
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null

# highlights
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
