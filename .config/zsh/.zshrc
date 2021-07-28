# path
typeset -U PATH path

# set
setopt autocd histignorealldups
stty stop undef

# basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|?=**'
zmodload zsh/complist
compinit
_comp_options+=(globdots)       # Include hidden files.

# kitty
kitty + complete setup zsh | source /dev/stdin

# pywal
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

# aliases
[ -f "$ZDOTDIR/.aliases" ] && source "$ZDOTDIR/.aliases"

# mode
bindkey -e
export KEYTIMEOUT=1

# edit line vim (ctrl-e), emacs (ctrl-x, ctrl-e):
autoload edit-command-line; zle -N edit-command-line
bindkey '^x^e' edit-command-line

# urxvt/xterm: 35 (blink), 36 (no blink)
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

# lf
LFCD="$HOME/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
bindkey -s '^o' 'lfcd\n'

[ -f "$HOME/.config/lf/icons" ] && source "$HOME/.config/lf/icons"

# functions
source $ZDOTDIR/functions/fzf-edit 2>/dev/null
source $ZDOTDIR/functions/fzf-kill 2>/dev/null
source $ZDOTDIR/functions/fzf-man 2>/dev/null

# plugins
source $ZDOTDIR/plugins/zsh-extract/extract.plugin.zsh 2>/dev/null
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null
source $ZDOTDIR/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh 2>/dev/null

# autosuggestions
bindkey '^ ' autosuggest-toggle

# syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=black,bold,bg=red')

# history-substring-search keys
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pure
fpath+=/usr/local/pure
autoload -U promptinit; promptinit
zstyle :prompt:pure:git:stash show yes
prompt pure
