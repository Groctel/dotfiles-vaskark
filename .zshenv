# path
typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")
export PATH

# env
export SSH_KEY_PATH="~/.ssh/id_rsa"
export EDITOR='nvim'
export VISUAL='nvim'
export BROWSER='google-chrome-stable'

# fzf
export FZF_DEFAULT_COMMAND="fdfind"
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
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
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
"

# pfetch
export PF_INFO="os kernel uptime shell wm memory"
export PF_SEP=":"
export PF_COL1=2
export PF_COL2=4

# nnn
export NNN_FIFO='/tmp/nnn.fifo' 
export NNN_COLORS='2356'
export NNN_TRASH=1

# zone
export TZ=":/usr/share/zoneinfo/America/Toronto"
