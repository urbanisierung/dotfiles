# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

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

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

zinit light jonmosco/kube-ps1

function get_cluster_short() {
  echo "$1" | cut -d _ -f4
}

KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short

PROMPT='$(kube_ps1)'$PROMPT

# fbd - delete git branch (including remote branches)
# read https://peterp.me/cli-tips-interactive-branch-delete/
fbd() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" | fzf --multi ) &&
  git branch -D $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
