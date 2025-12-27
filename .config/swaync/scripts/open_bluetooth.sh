#!/bin/bash

if command -v blueman-manager &> /dev/null; then
    hyprctl dispatch exec blueman-manager
    swaync-client -cp
else
    notify-send "Bluetooth" "blueman-manager not found" -i dialog-error
fi


