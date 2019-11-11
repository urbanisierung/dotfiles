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
PROMPT=$PROMPT'$(kube_ps1) '

# some aliases

alias fixtouchpad="sudo modprobe -r psmouse && sudo modprobe psmouse"
alias restartnw="sudo service network-manager restart"
alias pglocal="pgcli postgresql://postgres:mysecretpassword@0.0.0.0:5432"

source ~/.config/envvars/aliases.env

# further exports

export GOPATH=$HOME/work
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin

export KUBEBUILDERBIN=/usr/local/kubebuilder/bin

export PATH=$KUBEBUILDERBIN:$GOPATH/bin:$GOROOT/bin:$PATH