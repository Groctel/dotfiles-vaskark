# Pure
fpath+=/usr/share/pure
autoload -U promptinit; promptinit
prompt pure
zstyle :prompt:pure:git:stash show yes
PURE_CMD_MAX_EXEC_TIME=5

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# Aliases
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"

# Plugins
source ~/.zsh/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh
source /usr/share/oh-my-zsh/plugins/extract/extract.plugin.zsh 2>/dev/null
source /usr/share/oh-my-zsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh 2>/dev/null
source /usr/share/oh-my-zsh/plugins/command-not-found/command-not-found.plugin.zsh 2>/dev/null
source /usr/share/oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Pywal colors for some terms
(cat ~/.cache/wal/sequences &)

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Vi
#bindkey -v
