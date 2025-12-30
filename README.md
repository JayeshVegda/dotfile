# Dotfiles

My personal dotfiles managed with [yadm](https://yadm.io/) (Yet Another Dotfiles Manager).

## 🖥️ System

- **OS:** CachyOS Linux (Arch-based)
- **Window Manager:** Hyprland (Wayland compositor)
- **Shell:** Fish shell
- **Terminal:** Ghostty
- **Theme:** Catppuccin Mocha

## 📦 What's Included

This repository contains configuration files for:

### Desktop Environment
- **Hyprland** - Tiling Wayland compositor configuration
  - Modular configuration in `~/.config/hypr/modules/`
  - Custom keybindings, window rules, and startup programs
- **Waybar** - Status bar (managed as submodule)
- **Swaync** - Notification daemon for Wayland
- **Vicinae** - Additional desktop utilities

### Terminal & Shell
- **Fish Shell** - Interactive shell configuration
  - `~/.config/fish/config.fish` - Main configuration
  - `~/.config/fish/fish_variables` - Environment variables
- **Ghostty** - Terminal emulator configuration

### Applications
- **Neovim** - Text editor configuration
  - Plugin management via lazy.nvim
- **Yazi** - Terminal file manager
  - Keymap and package configurations

## 🚀 Installation

### Prerequisites

- [yadm](https://yadm.io/) installed on your system
- Git installed

### Quick Setup

```bash
# Clone this repository using yadm
yadm clone https://github.com/JayeshVegda/dotfile.git

# If bootstrap script exists, it will be prompted to run
# Or run manually:
yadm bootstrap
```

### Manual Setup

If you prefer to set up manually:

```bash
# Clone the repository
yadm clone https://github.com/JayeshVegda/dotfile.git

# Review the files that will be linked
yadm status

# The files are automatically linked to your home directory
```

## 📁 Repository Structure

```
.config/
├── fish/              # Fish shell configuration
│   ├── config.fish
│   └── fish_variables
├── ghostty/           # Ghostty terminal config
│   └── config
├── hypr/              # Hyprland window manager
│   ├── hyprland.conf
│   ├── changes.md
│   └── modules/       # Modular config files
│       ├── autostart.conf
│       ├── bind.conf
│       ├── general.conf
│       ├── input.conf
│       ├── programs.conf
│       └── windowrules.conf
├── nvim/              # Neovim configuration
│   └── lazy-lock.json
├── swaync/            # Notification daemon
│   ├── config.json
│   └── style.css
├── vicinae/           # Desktop utilities
│   └── settings.json
├── waybar/            # Status bar (submodule)
└── yazi/              # File manager
    ├── keymap.toml
    └── package.toml
```

## 🔧 Usage

### Managing Files

```bash
# Check status of managed files
yadm status

# Add new files to be managed
yadm add ~/.config/newapp/config

# Commit changes
yadm commit -m "Update config"

# Push to remote
yadm push

# Pull latest changes
yadm pull
```

### Working with Git

Since yadm uses Git under the hood, you can use standard Git commands:

```bash
# View commit history
yadm log

# See differences
yadm diff

# Create a branch
yadm checkout -b feature-branch
```

## 🎨 Customization

### Hyprland

The Hyprland configuration is modular, with separate files for:
- **autostart.conf** - Programs to start on login
- **bind.conf** - Keyboard shortcuts and keybindings
- **general.conf** - General settings
- **input.conf** - Input device configuration
- **programs.conf** - Application-specific settings
- **windowrules.conf** - Window rules and behaviors

### Fish Shell

Customize your shell experience by editing:
- `~/.config/fish/config.fish` - Main configuration
- `~/.config/fish/fish_variables` - Environment variables

## 📝 Notes

- **Waybar** is managed as a Git submodule. To update it:
  ```bash
  cd ~/.config/waybar
  git pull origin main
  cd ~
  yadm add .config/waybar
  yadm commit -m "Update waybar submodule"
  ```

- Configuration files are automatically linked to your home directory by yadm
- Some files may need manual adjustment for your specific system
- Always review changes before committing, especially when pulling updates

## 🔒 Security

If you have sensitive files (SSH keys, GPG keys, etc.), consider using yadm's encryption feature:

```bash
# Add patterns to encrypt
echo ".ssh/id_rsa" >> ~/.config/yadm/encrypt

# Encrypt files
yadm encrypt

# Decrypt on another machine
yadm decrypt
```

## 🤝 Contributing

This is a personal dotfiles repository, but suggestions and improvements are welcome! Feel free to:
- Open issues for bugs or questions
- Submit pull requests for improvements
- Share your own configurations

## 📄 License

This repository contains personal configuration files. Feel free to use and modify as needed.

## 🔗 Links

- [yadm Documentation](https://yadm.io/)
- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Fish Shell Documentation](https://fishshell.com/docs/current/)
- [Neovim Documentation](https://neovim.io/doc/)

## 📧 Contact

For questions or suggestions, please open an issue on GitHub.

---

**Last Updated:** December 30, 2025
