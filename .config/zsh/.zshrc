# path
export PATH="$HOME/.local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=/usr/local/oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy/mm/dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
extract
command-not-found
zsh-autosuggestions
zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# aliases
[ -f "$ZDOTDIR/aliases" ] && source "$ZDOTDIR/aliases"

# kitty completion
kitty + complete setup zsh | source /dev/stdin

# pywal
(cat ~/.cache/wal/sequences &)

# paleta
#cat ~/.cache/current-palette

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# xterm/urxvt cursor (beam)
# 35 (blink), 36 (no blink)
echo -e -n "\x1b[\x36 q"

# ncmpcpp (ctrl+\)
ncmpcppShow() {
  BUFFER="ncmpcpp -q"
  zle accept-line
}
zle -N ncmpcppShow
bindkey '^\' ncmpcppShow

# lfcd (ctrl+])
lfcd="$HOME/.config/lf/lfcd.sh"
    if [ -f "$lfcd" ]; then
    source "$lfcd"
fi
bindkey -s '^]' 'lfcd\n'

# functions
source ~/.config/zsh/functions/fzf-edit 2>/dev/null
source ~/.config/zsh/functions/fzf-kill 2>/dev/null
source ~/.config/zsh/functions/fzf-man 2>/dev/null

# pure
fpath+=/usr/local/pure
autoload -U promptinit; promptinit
zstyle :prompt:pure:git:stash show yes
prompt pure
