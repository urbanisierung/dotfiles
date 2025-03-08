# ###############################################################################
# ZSHRC
# ###############################################################################

export PATH=$PATH:/home/adam/.bin/bin
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export ZSH=$HOME/.oh-my-zsh
export EDITOR="nano"
ZSH_THEME="agnoster"
plugins=(git zsh-autosuggestions kubectl kube-ps1)
source $ZSH/oh-my-zsh.sh

# ###############################################################################
# CUSTOM CONFIGS
# ###############################################################################

source ~/.config/envvars/aliases.env

# -------------------------------------------------------------------------------
# THIRD PARTIES

export FLYCTL_INSTALL="/home/adam/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

export GOPATH=/usr/local/go/bin
export PATH=$PATH:$GOPATH

export PATH="$PATH:/opt/nvim-linux64/bin"

export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/home/adam/.local/share/flatpak/exports/share"

# asdf
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

PROMPT='$(kube_ps1)'$PROMPT

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

# ###############################################################################
# FURHTER TERMINAL CUSTOMIZATIONS
# ###############################################################################

eval "$(atuin init zsh)"
eval "$(starship init zsh)"
export PATH=/home/adam/.nvm/versions/node/v20.8.1/bin:/home/adam/.local/share/zinit/polaris/bin:/home/adam/.asdf/shims:/home/adam/.asdf/bin:/home/adam/.fly/bin:/home/adam/.krew/bin:/home/adam/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin:/home/adam/.local/bin:/home/adam/.cargo/bin:/var/lib/flatpak/exports/bin:/.local/share/flatpak/exports/bin:/home/adam/.bin/bin:/usr/local/go/bin:/opt/nvim-linux64/bin:/home/adam/bin
