SELECTED_EMOJI=$(grep -v "^\s*[#\;]\|^\s*$" ~/.config/emoji.txt | rofi -dmenu -p "Select emoji" -i | awk '{print $1}' | tr -d '\n')
if [ "$XDG_SESSION_TYPE" = "wayland" ]
then printf "%s" "$SELECTED_EMOJI" | wl-copy
else printf "%s" "$SELECTED_EMOJI" | xclip -sel clip
fi
