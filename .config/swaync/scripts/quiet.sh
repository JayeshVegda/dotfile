#!/bin/bash

if ! powerprofilesctl get | grep -q "balanced"; 
then
    notify-send "Power Profile" "Setting quiet mode..." -i battery-profile-powersave
    powerprofilesctl set power-saver
else
    notify-send "Power Profile" "Setting balanced mode..." -i battery-profile-balanced
    powerprofilesctl set balanced
fi
