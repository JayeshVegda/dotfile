## 1. GLOBAL SETTINGS
#set -g fish_greeting "" # Disable the default greeting
set -gx LANG en_US.UTF-8

# Only set TERM if it's not already set
if not set -q TERM
    set -gx TERM xterm-256color
end
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
    alias unlock="sudo rm /var/lib/pacman/db.lck"
    alias lt="eza --tree --level=2 --icons"
    # --- ALIASES ---
    # Visuals
    alias audit="sudo ~/.local/bin/system-audit.sh"
    alias ls="eza --icons --group-directories-first"
    alias ll="eza -l --icons --group-directories-first --git"
    alias cat="bat"
    alias yays="yay -S --noconfirm --answerdiff None --answerclean None"
    # Hyprland & Wayland specific
    alias cursor="cursor --ozone-platform-hint=wayland"
    alias homeserver="ssh homeserver@192.168.1.71"
    # --- VI MODE & KEYBINDINGS ---
    set -g fish_key_bindings fish_vi_key_bindings
end
export PATH="$HOME/.local/bin:$PATH"
# Remove stty commands unless strictly necessary (can slow down startup)
# stty -ixon
# stty sane
alias reboot-windows="sudo grub-reboot \"Windows Boot Manager (on /dev/nvme0n1p1)\"; sudo reboot"
