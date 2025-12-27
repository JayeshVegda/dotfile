#!/bin/bash

# Try common lock screen commands
if command -v swaylock &> /dev/null; then
    swaylock
elif command -v i3lock &> /dev/null; then
    i3lock
elif command -v lock &> /dev/null; then
    lock
else
    notify-send "Lock Screen" "No lock screen tool found" -i dialog-error
fi


