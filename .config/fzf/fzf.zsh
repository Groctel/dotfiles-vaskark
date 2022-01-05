# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jason/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/jason/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jason/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/jason/.fzf/shell/key-bindings.zsh"
