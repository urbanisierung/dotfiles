#!/bin/bash

if [ "$1" = "get" ]; then
  cp ~/.config/wallpaper/* wallpaper/
  cp /usr/bin/i3exit bin/
  cp /usr/bin/i3undock bin/
  cp ~/.config/i3/config i3/
  cp ~/.zshrc .
fi