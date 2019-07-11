#!/bin/bash

# setup my massive monitor at 45hz if its plugged in

RESOLUTION="3440 1440 30" 
OUTPUT="DP-1-1"

CONNECTED=$(xrandr --current | grep -i $OUTPUT | cut -f2 -d' ')

if [ "$CONNECTED" = "connected" ]; then
    MODELINE=$(cvt $RESOLUTION | cut -f2 -d$'\n')
    MODEDATA=$(echo $MODELINE | cut -f 3- -d' ')
    MODENAME=$(echo $MODELINE | cut -f2 -d' ')

    echo "Adding mode - " $MODENAME $MODEDATA
    xrandr --newmode $MODENAME $MODEDATA
    xrandr --addmode $OUTPUT $MODENAME
    xrandr --output $OUTPUT --mode $MODENAME
else
    echo "Monitor is not detected"
fi
