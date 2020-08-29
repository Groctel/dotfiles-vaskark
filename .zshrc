# Pure prompt
fpath+=/usr/share/pure
autoload -U promptinit; promptinit
prompt pure
zstyle :prompt:pure:git:stash show yes
PURE_CMD_MAX_EXEC_TIME=5

# Enable colors and prompt:
#autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
#HISTSIZE=10000
#SAVEHIST=10000
#HISTFILE=~/.cache/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

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
