#!/bin/sh
pactl set-sink-mute 0 toggle & pactl set-sink-mute 1 toggle & pactl set-sink-mute 2 toggle
