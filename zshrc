# zshrc by Dmitry Nets
# This config is based oh-my-zsh
# Use zsh-setup.sh to install oh-my-zsh and additional plugins
#
# Set default user to prevent user@hostname from displaying in
# prompt while on home machine
DEFAULT_USER="$USER"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
#ZSH_THEME="gyanu"
#ZSH_THEME="gallois"
ZSH_THEME="dnets"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git common-aliases gitfast git-extras vi-mode wd opp history)

# Use hjkl for completion
zmodload zsh/complist

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/home/dnets/.gem/ruby/2.2.0/bin:$PATH
export EDITOR="vim"
export NO_AT_BRIDGE=1
# export MANPATH="/usr/local/man:$MANPATH#"

source $ZSH/oh-my-zsh.sh

# Enable extended globbing
setopt extended_glob

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# rm: remove recursive interactive verbose w/ directories
alias rmr="rm -rdvI"

# ls: list directories
alias lsd="ls -d  */ .*/"

alias ls="ls -a --color=tty"

# Pacman: search packages
alias pms="sudo pacman -Ss"
# Pacman: install package
alias pmi="sudo pacman -S"
# Pacman: remove single package
alias pmr="sudo pacman -R"
# Pacman: remove package and orphaned dependencies
alias pmrd="sudo pacman -Rs"
# Pacman: update all packages
alias pmu="sudo pacman -Syu"
# Pacman: clear db.lck
alias pmcdb="sudo rm /var/lib/pacman/db.lck"
# Pacman: show package files paths
alias pmw="pacman -Qlk"

# yaourt
alias y="yaourt"
# yaourt: update
alias yu="yaourt -Syua"

# tmux
alias tmux="tmux -2"

# Get files from EX.UA
alias exua="~/scripts/exua.sh"

# Play Project Brutality + Hell On Earth
alias zb="~/games/z3/zandronum Project\ Brutality\ 2.03.pk3 hellonearthstarterpack.wad ExtraTextures.wad PB_WOSHUD_Normal.pk3"

# mkdir
alias md="mkdir -pv"

# git: checkout branch
alias gbn="git checkout -b"
# git: list tracked files
alias gls="git ls-files"
# git: push origin master
alias gpom="git push origin master"
# git: log
alias glog="git log --graph --stat"
alias gloa="git log --graph --stat --all"
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glga="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias glgs="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit  --stat"
alias glgsa="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit  --stat --all"
alias gbd="git branch -d"

alias gmeld="git difftool -d"

alias gbv="git branch -v"

# Disk usage human-readable
alias df="df -h"

# du: list directories sorted by size
alias duds="du -sh * | sort -h"

# Jot down quick notes
alias idea="vim ~/notes/ideas"

export NPM_PACKAGES="/home/dnets/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

export NPM_PACKAGES="/home/dnets/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
