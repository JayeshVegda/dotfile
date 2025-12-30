# Arch Linux Hyprland Rice

My personal Arch Linux desktop configuration with Hyprland, featuring a Catppuccin Mocha themed setup.

## System Overview

- **OS:** CachyOS Linux (Arch-based)
- **Window Manager:** Hyprland (Wayland compositor)
- **Theme:** Catppuccin Mocha
- **Font:** JetBrains Mono Nerd Font
- **Dotfiles Manager:** yadm

## Desktop Environment

### Hyprland

Modular Hyprland configuration with the following structure:

- **Main Config:** `~/.config/hypr/hyprland.conf`
- **Theme:** Catppuccin Mocha color scheme defined in `themes/mocha.conf`
- **Modules:**
  - `autostart.conf` - Startup applications
  - `bind.conf` - Keybindings and shortcuts
  - `general.conf` - General settings
  - `decoration.conf` - Window decorations
  - `animations.conf` - Animation settings
  - `dwindle.conf` - Dwindle layout configuration
  - `master.conf` - Master layout configuration
  - `misc.conf` - Miscellaneous settings
  - `input.conf` - Input device configuration
  - `programs.conf` - Application-specific rules
  - `windowrules.conf` - Window rules
  - `monitors.conf` - Display configuration
  - `env.conf` - Environment variables
  - `plugin.conf` - Plugin configuration

**Key Features:**
- Hyprscrolling layout with column-based window management
- Custom workspace navigation (1-10)
- Window movement and resizing with mouse
- Column resizing and management
- Screenshot support via hyprshot
- Lock screen with hyprlock

**Keybindings:**
- `SUPER + Return` - Open terminal (Ghostty)
- `SUPER + B` - Open browser (Zen)
- `ALT + Space` - Toggle Vicinae launcher
- `SUPER + Shift + S` - Screenshot region
- `SUPER + Shift + L` - Lock screen
- `SUPER + Q` - Close window
- `SUPER + [1-9,0]` - Switch workspaces
- `SUPER + Shift + [1-9,0]` - Move window to workspace
- `SUPER + H/J/K/L` - Focus windows (vim-style)
- `SUPER + ,/.` - Navigate columns
- `SUPER + =/-` - Resize columns

### Waybar

Custom status bar with the following modules:

**Left:**
- Taskbar (wlr/taskbar) - Application icons

**Center:**
- Workspaces (hyprland/workspaces) - Workspace switcher

**Right:**
- Brightness control (backlight) - AMD GPU backlight
- Audio control (pulseaudio) - Volume with per-app support
- Custom Bluetooth module - Bluetooth status and control
- Custom Network module - WiFi/Ethernet status
- Custom Do Not Disturb - Notification toggle
- Custom btop - System monitor integration
- Clock - Time with calendar widget
- Custom Power - Power menu launcher

**Custom Scripts:**
- `~/.local/bin/waybar-btop.sh` - btop integration
- `~/.local/bin/waybar-bluetooth.sh` - Bluetooth status
- `~/.local/bin/waybar-network.sh` - Network status
- `~/.local/bin/waybar-notifications.sh` - Notification status

### Swaync (Notification Daemon)

Configured with:

- **Position:** Top-right
- **Widgets:**
  - Title with clear all button
  - Buttons grid (WiFi, Bluetooth, DND, Idle)
  - MPRIS media player control
  - Backlight slider
  - Volume control with per-app support
  - Inhibitors display
  - Notifications list

- **Features:**
  - Notification grouping
  - Custom notification sounds
  - Spotify mute support
  - Relative timestamps
  - Keyboard shortcuts enabled

### Ashell

System shell/launcher with:

- **Position:** Top
- **Modules:**
  - App launcher (Vicinae integration)
  - System tray
  - Clock
  - Workspaces
  - Media player
  - Privacy controls
  - Settings
  - Updates checker (pacman + paru)
  - Notifications

- **Custom Buttons:**
  - File manager (Yazi)
  - Various system controls

- **Appearance:**
  - Islands style
  - Catppuccin-inspired colors
  - Custom opacity and scaling

## Terminal & Shell

### Ghostty

Terminal emulator configuration:

- **Theme:** Catppuccin Mocha
- **Font:** Iosevka (default)
- **Mouse scroll multiplier:** 0.5
- **Term:** xterm-256color

### Fish Shell

Interactive shell with the following setup:

**Tools & Integrations:**
- **Starship** - Prompt customization
- **Zoxide** - Smart directory navigation (replaces `cd`)
- **Fastfetch** - System information on shell start
- **eza** - Modern `ls` replacement with icons
- **bat** - Modern `cat` replacement with syntax highlighting

**Configuration:**
- **VI Mode** - Vim-style keybindings enabled
- **Abbreviations:**
  - `cfg` - Opens Hyprland config in Neovim
  - `lzd` - Opens lazydocker
- **Aliases:**
  - `ls` - eza with icons and grouped directories
  - `ll` - eza long format with git status
  - `cat` - bat with syntax highlighting
  - `lt` - eza tree view
  - `yays` - yay install without confirmation
  - `cursor` - Cursor editor with Wayland hint
  - `unlock` - Remove pacman lock file

**Environment:**
- LANG: en_US.UTF-8
- PATH includes `~/.local/bin`

### Starship Prompt

Custom prompt configuration:

- **Format:** `[user@hostname] in [directory] [git_status] [cmd_duration]`
- **Colors:** Green for user/hostname, cyan for directory
- **Features:**
  - Git status indicators (ahead/behind/diverged)
  - Command duration display
  - Sudo indicator
  - Repository truncation
  - Custom success/error symbols

## Applications

### Neovim

Text editor with:

- **Plugin Manager:** lazy.nvim
- **Lock File:** `lazy-lock.json` for reproducible plugin versions

### Yazi

Terminal file manager with custom keybindings:

**Key Features:**
- Smart filter (F key)
- Help menu (? key)
- Shell integration (! key)
- Terminal launcher (Ctrl+T)
- Cursor editor integration (e key)
- Quick navigation:
  - `g + h` - Home directory
  - `g + d` - Downloads
  - `g + D` - Documents
  - `g + c` - Config directory
- Find and filter functionality

### Vicinae

Application launcher and productivity tool:

- **Theme:** Catppuccin Mocha (dark)
- **Icon Theme:** Catppuccin Macchiato Flamingo
- **Font:** JetBrainsMono Nerd Font Mono
- **Opacity:** 0.88
- **Keybind:** `ALT + Space` to toggle

**Extensions:**
- KDE Connect integration
- Spotify Player control
- Fuzzy file finder
- Clipboard history
- Emoji search

**Features:**
- Close on focus loss
- Search files in root
- Custom keybinds (Ctrl+TAB for action panel)

### Zen Browser

Default browser, auto-starts on login.

### EasyEffects

Audio processing and equalization:

- Auto-starts as GApplication service
- Integrated with PipeWire

## System Tools

### hypridle

Idle management daemon for Hyprland:

- Handles screen locking
- Power management
- Auto-starts on login

### hyprlock

Screen locker integrated with Hyprland.

### hyprshot

Screenshot utility:

- Region screenshots (SUPER + Shift + S)
- Full screen screenshots (Print key)
- Clipboard integration

## Utilities & Tools

### Audio System

- **PipeWire** - Audio server
- **EasyEffects** - Audio effects and equalization
- **pactl/wpctl** - Audio control commands
- **playerctl** - Media player control

### System Monitoring

- **btop** - System monitor (integrated in Waybar)
- **fastfetch** - System information display

### File Management

- **Dolphin** - GUI file manager (default)
- **Yazi** - Terminal file manager

### Development Tools

- **Cursor** - Code editor (Wayland compatible)
- **Git** - Version control
- **yadm** - Dotfiles management

### Package Management

- **pacman** - Official package manager
- **paru/yay** - AUR helpers
- **flatpak** - Flatpak applications

## Autostart Applications

Configured in `~/.config/hypr/modules/autostart.conf`:

1. **zen-browser** - Web browser
2. **hyprpm reload -n** - Hyprland plugin manager
3. **easyeffects --gapplication-service** - Audio effects
4. **hypridle** - Idle management
5. **swaync** - Notification daemon
6. **ashell** - System shell
7. **vicinae server** - Launcher server
8. **~/scripts/wallpaper_cycle.sh** - Wallpaper rotation

## Color Scheme

Catppuccin Mocha color palette used throughout:

- **Base:** `#1e1e2e`
- **Mantle:** `#181825`
- **Crust:** `#11111b`
- **Text:** `#cdd6f4`
- **Subtext:** `#bac2de`, `#a6adc8`
- **Surface:** `#313244`, `#45475a`, `#585b70`
- **Overlay:** `#6c7086`, `#7f849c`, `#9399b2`
- **Accent Colors:**
  - Rosewater: `#f5e0dc`
  - Flamingo: `#f2cdcd`
  - Pink: `#f5c2e7`
  - Mauve: `#cba6f7`
  - Red: `#f38ba8`
  - Maroon: `#eba0ac`
  - Peach: `#fab387`
  - Yellow: `#f9e2af`
  - Green: `#a6e3a1`
  - Teal: `#94e2d5`
  - Sky: `#89dceb`
  - Sapphire: `#74c7ec`
  - Blue: `#89b4fa`
  - Lavender: `#b4befe`

## Configuration Files

All configuration files are managed via yadm and located in `~/.config/`:

```
.config/
├── fish/              # Fish shell
├── ghostty/           # Terminal emulator
├── hypr/              # Hyprland window manager
│   ├── hyprland.conf
│   ├── themes/
│   └── modules/
├── nvim/              # Neovim editor
├── swaync/            # Notification daemon
├── vicinae/           # Application launcher
├── waybar/            # Status bar (submodule)
├── yazi/              # File manager
├── ashell/            # System shell
└── starship.toml      # Prompt configuration
```

## Scripts

Custom scripts located in `~/.local/bin/`:

- `waybar-btop.sh` - btop integration for Waybar
- `waybar-bluetooth.sh` - Bluetooth status for Waybar
- `waybar-network.sh` - Network status for Waybar
- `waybar-notifications.sh` - Notification status for Waybar

Custom scripts in `~/scripts/`:

- `wallpaper_cycle.sh` - Wallpaper rotation script

## Notes

- Waybar is managed as a Git submodule
- Configuration uses modular approach for easy maintenance
- All applications are configured for Wayland compatibility
- Catppuccin Mocha theme is consistently applied across all applications
- Fish shell with VI mode provides efficient terminal navigation
- Hyprscrolling layout provides unique column-based window management

---

**Last Updated:** December 30, 2025
