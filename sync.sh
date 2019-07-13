#!/bin/bash

if [ "$1" = "get" ]; then
  cp ~/.config/wallpaper/* wallpaper/
  cp /usr/bin/i3exit bin/
  cp /usr/bin/i3undock bin/
  cp ~/.config/i3/config i3/
  cp /etc/i3status.conf i3/
  cp ~/.zshrc .
  cp ~/.config/scripts/brightness.sh scripts/
  cp ~/.config/scripts/lock-lid.sh scripts/
  cp ~/.config/scripts/lock.sh scripts/
  cp ~/.config/scripts/monitor.sh scripts/
fi

if [ "$1" = "push" ]; then
  mkdir ~/.config/wallpaper
  cp wallpaper/* ~/.config/wallpaper
  mkdir ~/.config/scripts
  cp scripts/* ~/.config/scripts
  cp i3/config ~/.config/i3/config
  sudo cp i3/i3status.conf /etc/
  sudo cp bin/* /usr/bin
fi