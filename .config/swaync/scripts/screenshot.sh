#!/bin/bash

# Take screenshot and save to ~/Pictures/Screenshots/
mkdir -p ~/Pictures/Screenshots
filename="$HOME/Pictures/Screenshots/screenshot-$(date +%Y%m%d-%H%M%S).png"

# Try grim first (for wlroots), then maim (for X11), then scrot
if command -v grim &> /dev/null; then
    grim "$filename" && notify-send "Screenshot" "Saved to $filename" -i camera-photo
elif command -v maim &> /dev/null; then
    maim "$filename" && notify-send "Screenshot" "Saved to $filename" -i camera-photo
elif command -v scrot &> /dev/null; then
    scrot "$filename" && notify-send "Screenshot" "Saved to $filename" -i camera-photo
else
    notify-send "Screenshot" "No screenshot tool found (grim/maim/scrot)" -i dialog-error
fi


