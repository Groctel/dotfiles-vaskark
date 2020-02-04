# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/.local/bin:$PATH

# export TERM="rxvt-unicode-256color"
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k"

# Specific theme settings
source ~/.spaceship
source ~/.powerlevel

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
ZSH_THEME_RANDOM_CANDIDATES=("bira" "ys" "half-life" "agnoster" "gnzh" "powerlevel10k" "spaceship" "nanotech" "intheloop" "wedisagree" "fwalch" "jaischeema")

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh_reload systemadmin themes command-not-found sudo extract)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias df='df -H | grep sda5'
alias du='du -h'
alias cd..='cd ..'
alias h='history'
alias hc='history -c'
alias p='pwd -P'

# listings
alias ls='lsd -h'
alias l='ls -l'
alias ll='ls -al'
alias lt='lsd --tree --depth 2'

# general
alias v='nvim'
alias tc1="tty-clock -cst -C 3 -f '%B %d %Y'"
alias mount='mount | column -t'
alias um='unimatrix -a -f -n -s 98'
alias kc='kitty +kitten icat'
alias kd='kitty +kitten diff'
alias mpc='mpc --host=127.0.0.1 --port=6600'
alias wttr='curl wttr.in'
alias cls='clear'
alias zshrc='vim ~/.zshrc'
alias ht='htop -u $USER'
alias xr="vim ~/.Xresources"
alias xu='xrdb ~/.Xresources'
alias ms='ncmpcpp'
alias uf='cls;ufetch'
alias bf='bunnyfetch'
alias pf='clear;pfetch'
alias f='fff'
alias n='nnn -d -o'
alias cv='cava'

# neofetch
alias nf0='clear;neofetch --config none'
alias nf='clear;neofetch'
alias nfo='clear;neofetch --off'
alias nfw='clear;neofetch --source $HOME/Pictures/women'
alias nfs='clear;neofetch --config ~/.config/neofetch/config-small.conf'

# wifi
alias up='nmcli c u'
alias dn='nmcli c d'

# windscribe
alias wsc='windscribe connect'
alias wsd='windscribe disconnect'

# yadm
alias yc='yadm commit -a'
alias ya='yadm add'
alias yp='yadm push -u origin master'

# pywal
alias w1='wal -i ~/Pictures/favs/'
alias w2='wal --theme random'
alias wf='wal --theme dkeg-skigh'

# superuser
alias reboot='sudo reboot'
alias shutdown='sudo shutdown now'
alias upd8='sudo apt update;sudo apt full-upgrade;sudo apt autoremove;sudo apt clean'
alias rnm='sudo systemctl restart network-manager'
alias ffs='sudo !!'
alias s1='sudo make install'
alias s2='sudo make PREFIX=/usr/local install'

# pacman
alias pq='pacman -Qm'

# systemctl
alias sct='systemctl --user list-timers --all'

# completion for kitty
autoload -Uz compinit
compinit
kitty + complete setup zsh | source /dev/stdin

# Run when terminal opens/resets
#clear
#unimatrix -a -f -l o -n -o -s 100 -w

# pfetch
export PF_INFO="ascii os kernel uptime shell de pkgs memory"
export PF_SEP=":"
export PF_COL1=3
export PF_COL2=6

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /home/jason/.config/broot/launcher/bash/br
