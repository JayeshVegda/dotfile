## 1. GLOBAL SETTINGS
#set -g fish_greeting "" # Disable the default greeting
set -gx LANG en_US.UTF-8

function fish_greeting
    fastfetch
end
# Fix for Ghostty/Kit/Alacritty SSH issues
# This forces SSH to use a standard terminal type so remote servers don't break
#alias ssh="TERM=xterm-256color /usr/bin/ssh"

## 2. INTERACTIVE SESSION (Only run this for the user, not scripts)
if status is-interactive

    # --- TOOLS INIT ---
    starship init fish | source

    # Initialize Zoxide and replace 'cd' automatically
    # This removes the need for 'alias cd=z'
    zoxide init fish --cmd cd | source

    # --- ABBREVIATIONS (Better than aliases) ---
    # Expands when you type. e.g. 'cfg' -> space -> expands to full path
    abbr --add cfg "nvim ~/.config/hypr/hyprland.conf"
    abbr --add lzd lazydocker

    # --- ALIASES ---
    # Visuals
    alias ls="eza --icons --group-directories-first"
    alias ll="eza -l --icons --group-directories-first --git"
    alias cat="bat"

    # Hyprland & Wayland specific
    alias cursor="cursor --ozone-platform-hint=wayland"

    # --- VI MODE & KEYBINDINGS ---
    set -g fish_key_bindings fish_vi_key_bindings
end

# Remove stty commands unless strictly necessary (can slow down startup)
# stty -ixon
# stty sane
