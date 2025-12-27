#!/bin/bash

if command -v pavucontrol &> /dev/null; then
    hyprctl dispatch exec pavucontrol
    swaync-client -cp
else
    notify-send "Audio Settings" "pavucontrol not found" -i dialog-error
fi


