#!/bin/bash

if command -v nm-connection-editor &> /dev/null; then
    hyprctl dispatch exec nm-connection-editor
    swaync-client -cp
else
    notify-send "Network Settings" "nm-connection-editor not found" -i dialog-error
fi


