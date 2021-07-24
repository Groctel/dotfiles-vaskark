# path
typeset -U PATH path

# dir complete
setopt autocd autopushd

# ctrl-s/q off
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

# mode
bindkey -e
export KEYTIMEOUT=1

# edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

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
source $ZDOTDIR/plugins/zsh-extract/extract.plugin.zsh 2>/dev/null
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null
source $ZDOTDIR/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh 2>/dev/null

# syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')

# history-substring-search keys
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
