#!/bin/bash

if nmcli radio wifi | grep -q "enabled"; then
    nmcli radio wifi off
    notify-send "WiFi" "Disabled" -i network-wireless
else
    nmcli radio wifi on
    notify-send "WiFi" "Enabled" -i network-wireless
fi


