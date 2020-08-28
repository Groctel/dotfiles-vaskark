# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/.local/bin:$PATH

# export TERM="rxvt-unicode-256color"
export TERM="xterm-256color"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# pfetch
export PF_INFO="os kernel uptime shell wm memory"
export PF_SEP=":"
export PF_COL1=2
export PF_COL2=4

# completion for kitty
autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pywal
(cat ~/.cache/wal/sequences &)
#(cat ~/.config/wpg/sequences &)

# fzf
export FZF_DEFAULT_OPTS='--border'
#export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# gitstatus
#GITSTATUS_LOG_LEVEL=DEBUG

# termite
if [[ $TERM == xterm-termite ]]; then
    . /usr/local/etc/profile.d/vte.sh
    __vte_osc7
fi

# pure prompt (omz turned off above)
fpath+=/usr/share/pure
autoload -U promptinit; promptinit
#source ~/.zsh/vim.zsh
prompt pure

PURE_CMD_MAX_EXEC_TIME=5
#zstyle :prompt:pure:path color white
#zstyle ':prompt:pure:prompt:*' color magenta
zstyle :prompt:pure:git:stash show yes

# vi mode
# bindkey -v
