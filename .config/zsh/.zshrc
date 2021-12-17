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
_comp_options+=(globdots) # Include hidden files.

# kitty
kitty + complete setup zsh | source /dev/stdin

# pywal
(cat ~/.cache/wal/sequences &)
. ~/.cache/wal/colors.sh

# aliases
[ -f "$ZDOTDIR/.aliases" ] && source "$ZDOTDIR/.aliases"

# mode (e,v)
bindkey -v
export KEYTIMEOUT=1

# edit line vim (ctrl-e), emacs (ctrl-x, ctrl-e):
autoload edit-command-line; zle -N edit-command-line
bindkey '^x^e' edit-command-line

# urxvt/xterm cursor beam: 35 (blink), 36 (no blink)
echo -e -n "\x1b[\x36 q"

# clifm (ctrl+])
bindkey -s '^]' 'clifm\n'

# wal
# bindkey -s '^{' 'wal -f random_user -o wal-extras.sh\n'

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
# fpath+=/usr/local/pure
# autoload -U promptinit; promptinit
# zstyle ':prompt:pure:prompt:success' color green
# zstyle ':prompt:pure:prompt:failure' color red
# zstyle ':prompt:pure:git:stash' show yes
# PURE_PROMPT_SYMBOL=""
# PURE_PROMPT_VICMD_SYMBOL=""
# PURE_GIT_UP_ARROW="💨"
# PURE_GIT_DOWN_ARROW="😰"
# PURE_GIT_STASH_SYMBOL="📦"
# prompt pure

# starship
eval "$(starship init zsh)"
