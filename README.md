# Arch Linux Hyprland Rice

My personal Arch Linux desktop configuration with Hyprland and Catppuccin Mocha theme.

## System

- **OS:** CachyOS Linux (Arch-based)
- **Window Manager:** Hyprland (Wayland compositor)
- **Theme:** Catppuccin Mocha
- **Font:** JetBrains Mono Nerd Font
- **Dotfiles Manager:** yadm

## Desktop Environment

- **Hyprland** - Tiling Wayland compositor with modular configuration
- **Waybar** - Status bar with custom modules (taskbar, workspaces, audio, network, bluetooth, notifications, clock)
- **Swaync** - Notification daemon with MPRIS, volume, and backlight widgets
- **Ashell** - System shell with app launcher, tray, and system info
- **hypridle** - Idle management daemon
- **hyprlock** - Screen locker
- **hyprshot** - Screenshot utility

## Terminal & Shell

- **Ghostty** - Terminal emulator with Catppuccin Mocha theme
- **Fish** - Interactive shell with VI mode
- **Starship** - Custom prompt with git status and command duration
- **Zoxide** - Smart directory navigation (replaces `cd`)
- **Fastfetch** - System information display on shell start
- **eza** - Modern `ls` replacement with icons
- **bat** - Modern `cat` replacement with syntax highlighting

## Applications

- **Neovim** - Text editor with lazy.nvim plugin manager
- **Yazi** - Terminal file manager with custom keybindings
- **Vicinae** - Application launcher and productivity tool (replaces Rofi)
- **Zen Browser** - Default web browser
- **Dolphin** - GUI file manager

## Audio

- **PipeWire** - Audio server
- **EasyEffects** - Audio effects and equalization
- **playerctl** - Media player control

## System Tools

- **btop** - System monitor (integrated in Waybar)
- **Cursor** - Code editor (Wayland compatible)
- **pacman/paru/yay** - Package managers
- **Git** - Version control

## Autostart

- zen-browser
- hyprpm reload
- easyeffects
- hypridle
- swaync
- ashell
- vicinae server
- wallpaper_cycle.sh

## Keybindings

- `SUPER + Return` - Terminal
- `SUPER + B` - Browser
- `ALT + Space` - Vicinae launcher
- `SUPER + Shift + S` - Screenshot region
- `SUPER + Shift + L` - Lock screen
- `SUPER + [1-9,0]` - Switch workspaces
- `SUPER + H/J/K/L` - Focus windows (vim-style)

## Configuration Files

```
.config/
├── fish/              # Fish shell
├── ghostty/           # Terminal
├── hypr/              # Hyprland (modular config)
├── nvim/              # Neovim
├── swaync/            # Notifications
├── vicinae/           # Launcher
├── waybar/            # Status bar
├── yazi/              # File manager
└── ashell/            # System shell
```

---

**Last Updated:** December 30, 2025
