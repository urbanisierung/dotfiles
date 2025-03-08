#!/bin/bash

# local files to git
if [ "$1" = "get" ]; then
  cp ~/.config/wallpaper/* wallpaper/
  cp /usr/bin/i3exit bin/
  cp /usr/bin/i3undock bin/
  cp ~/.config/i3/config i3/
  cp /etc/i3status.conf i3/
  cp /etc/i3blocks.conf i3/
  cp ~/.zshrc config/
  cp ~/.config/starship.toml config/
  cp -r /usr/local/bin/*.sh scripts/
  cp ~/.config/Code/User/settings.json config/
  cp -r ~/.screenlayout/* screenlayout/
  cp -r ~/.config/zed/* zed/
fi

# git files to local
if [ "$1" = "push" ]; then
  mkdir ~/.config/wallpaper
  cp wallpaper/* ~/.config/wallpaper
  mkdir ~/.config/scripts
  cp scripts/* ~/.config/scripts
  cp config/settings.json ~/.config/Code/User/settings.json
  cp zed/* ~/.config/zed/
  cp i3/config ~/.config/i3/config
  cp -r screenlayout/* ~/.screenlayout
  cp config/.zshrc ~/
  cp config/starship.toml ~/.config/
  cp config/emoji.txt ~/.config/
  sudo cp i3/i3status.conf /etc/
  sudo cp i3/i3blocks.conf /etc/
  sudo cp bin/* /usr/bin
fi
