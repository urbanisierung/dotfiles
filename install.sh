#!/bin/bash

sudo apt update
# sudo apt install -y

# #######################################################
# Node with nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
nvm install 22
corepack enable pnpm

# #######################################################
# Node global packages
npm i -g zx wrangler ts-node http-server

# #######################################################
# UTILS

# Github CLI
# https://github.com/cli/cli/blob/trunk/docs/install_linux.md
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) &&
  sudo mkdir -p -m 755 /etc/apt/keyrings &&
  out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg &&
  cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null &&
  sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg &&
  sudo mkdir -p -m 755 /etc/apt/sources.list.d &&
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null &&
  sudo apt update &&
  sudo apt install gh -y

# 7z
sudo apt install p7zip-full -y

# audio
sudo apt install pulseaudio pavucontrol pactl blueman -y

# rclone
# https://rclone.org/install/
sudo -v
curl https://rclone.org/install.sh | sudo bash

# arandr
# https://christian.amsuess.com/tools/arandr/
sudo apt install arandr -y

# CopyQ
# https://github.com/hluk/CopyQ
sudo add-apt-repository ppa:hluk/copyq
sudo apt update
sudo apt install copyq -y

# flameshot
# https://flameshot.org/#download
sudo apt install flameshot -y

# font awesome
sudo apt install fonts-font-awesome

# atuin
# https://atuin.sh/
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

# translate-shell
# https://github.com/soimort/translate-shell/wiki/Distros#debian--ubuntu
sudo apt install translate-shell

# #######################################################
# GCLoud
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates gnupg curl
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update && sudo apt-get install google-cloud-cli
sudo apt install kubectl
TELEPORT_EDITION="cloud"
TELEPORT_DOMAIN=example.teleport.sh
TELEPORT_VERSION="$(curl https://$TELEPORT_DOMAIN/v1/webapi/automaticupgrades/channel/stable/cloud/version | sed 's/v//')"
curl https://cdn.teleport.dev/install-v17.2.1.sh | bash -s ${TELEPORT_VERSION?} ${TELEPORT_EDITION?}
tsh login --proxy=camunda.teleport.sh --auth=okta

# #######################################################
# Docker
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |
  sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres
pgcli postgresql://postgres:mysecretpassword@0.0.0.0:5432

# #######################################################
# SOPS
curl -LO https://github.com/getsops/sops/releases/download/v3.9.4/sops-v3.9.4.linux.amd64
sudo mv sops-v3.9.4.linux.amd64 /usr/local/bin/sops
sudo chmod +x /usr/local/bin/sops
gcloud init
gcloud auth application-default login

# #######################################################
# VSCode
# https://code.visualstudio.com/docs/setup/linux
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders

# #######################################################
# Zed
# https://zed.dev/docs/linux
curl -f https://zed.dev/install.sh | ZED_CHANNEL=preview sh
