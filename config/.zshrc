# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=$PATH:/home/adam/.bin/bin

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export EDITOR="nano"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# zsh plugins

plugins=(git zsh-autosuggestions kubectl kube-ps1)
source $ZSH/oh-my-zsh.sh

# some aliases

alias fixtouchpad="sudo modprobe -r psmouse && sudo modprobe psmouse"
alias restartnw="sudo service network-manager restart"
alias pglocal="pgcli postgresql://postgres:mysecretpassword@0.0.0.0:5432"
alias pitch="~/dev/apps/pitch/pitch.AppImage"
alias backup="source ~/.config/envvars/backup.env && ~/github.com/urbanisierung/dotfiles/homebackup.mjs"
alias dmy="cd ~/dev/my"

source ~/.config/envvars/aliases.env
source ~/.config/envvars/accounts_signup.env
source ~/.config/envvars/e2e_dev.env
source ~/.config/envvars/github.env
# source ~/.config/envvars/e2e_int.env

alias e2edev="source ~/.config/envvars/e2e_dev.env"
alias e2eint="source ~/.config/envvars/e2e_int.env"

# further exports

export GOPATH=$HOME/work
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export GO111MODULE=on

export KUBEBUILDERBIN=/usr/local/kubebuilder/bin

export PATH=$KUBEBUILDERBIN:$GOPATH/bin:$GOROOT/bin:$PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

function get_cluster_short() {
  echo "$1" | cut -d _ -f4
}

KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short

# eval "$(starship init zsh)"

PROMPT='$(kube_ps1)'$PROMPT

# eval "$(starship init zsh)"

# fbd - delete git branch (including remote branches)
fbd() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" | fzf --multi ) &&
  git branch -D $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

function zshaddhistory() {
  echo "${1%%$'\n'}|${PWD}   " >> ~/.zsh_history_ext
}

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
