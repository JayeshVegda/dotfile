starship init fish | source
set -g fish_greeting

alias cfg="nano ~/.config/hypr/hyprland.conf"
alias cursor="cursor --ozone-platform-hint=wayland"

if status is-interactive
    # Initialize Starship (The prompt you just installed)
    starship init fish | source

    # Initialize Zoxide (The smart cd)
    zoxide init fish | source

    # ~ ALIASES ~
    # Replace 'ls' with 'eza' (icons + git status)
    alias ls="eza --icons --group-directories-first"
    alias ll="eza -l --icons --group-directories-first --git"

    # Replace 'cat' with 'bat' (colors)
    alias cat="bat"

    # Replace 'cd' with 'z' (so you don't have to learn a new key)
    alias cd="z"
end
# Make Ctrl+V behave like normal paste
# Disable fzf variable search completely
bind -M insert -e ctrl-v
bind -M insert \cv paste
# --- Disable fzf.fish variable search completely
set -g FZF_DISABLE_VARIABLES 1

# --- JAY'S SERVER TOOLS ---
alias lzd='lazydocker'
alias tv-control='qtscrcpy'
set -gx LANG en_US.UTF-8
