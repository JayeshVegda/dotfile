#!/bin/bash

# Toggle systemd-inhibit (caffeine-like functionality)
INHIBIT_PID=$(pgrep -f "systemd-inhibit --what=idle sleep infinity")

if [ -n "$INHIBIT_PID" ]; then
    # Inhibit is active, disable it
    kill $INHIBIT_PID
    notify-send "Inhibit" "Disabled - System will sleep normally" -i system-suspend
else
    # Inhibit is not active, enable it
    systemd-inhibit --what=idle sleep infinity &
    notify-send "Inhibit" "Enabled - Preventing system sleep" -i system-run
fi
