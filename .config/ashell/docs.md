🚀 Getting Started

Ashell is a status bar for Hyprland and Niri, written in Rust using the iced library.
Does it only work on Hyprland and Niri?

This project originally supported only Hyprland, primarily because it is the compositor I use to test ashell.

Thanks to community support, ashell now supports Niri as well.

In the future, we plan to expand this functionality to other Wayland compositors.
Features

    App Launcher button
    Clipboard button
    OS Updates indicator
    Hyprland/Niri Active Window
    Hyprland/Niri Workspaces
    System Information (CPU, RAM, Temperature)
    Hyprland/Niri Keyboard Layout
    Hyprland Keyboard Submap
    Tray
    Date and Time
    Privacy indicators (microphone, camera, and screen sharing usage)
    Media Player
    Settings Panel
        Power menu
        Battery information
        Audio sources and sinks
        Screen brightness
        Network controls
        VPN
        Bluetooth
        Power profiles
        Idle inhibitor
        Airplane mode
    Custom Modules


🛠️ Installation

You can install Ashell using the following methods:
Packages
info

Officially maintained: Arch Linux package and the Nix configuration included in the repository.

Community packaging: Fedora via Copr (see below). If a package is broken, try building from source first.

Packaging status
Arch Linux

Install a tagged release from the AUR repositories:

yay -S ashell

Or install from the AUR, which compiles the latest source:

yay -S ashell-git

Nix

To install Ashell using the Nix package manager, make sure flakes are enabled, then run:
Tagged Release

nix profile install github:MalpenZibo/ashell?ref=0.5.0

Main Branch

nix profile install github:MalpenZibo/ashell

NixOS / Home Manager

To use this flake, add the input to your flake.nix:

inputs = {
  # ... other inputs
  ashell.url = "github:MalpenZibo/ashell";
  # ... other inputs
};
outputs = {...} @ inputs: {<outputs>}; # Make sure to pass inputs to your specialArgs!

And in your configuration.nix:

{ pkgs, inputs, ... }:

{
  environment.systemPackages = [inputs.ashell.packages.${pkgs.system}.default];
  # or home.packages = ...
}

This will build Ashell from source.
Alternatively, you can use pkgs.ashell from nixpkgs, which is cached.
Fedora (Copr)

Unofficial Copr repository (maintained by @killcrb):

sudo dnf -y copr enable killcrb/ashell
sudo dnf -y install ashell

Building from Source

To build Ashell from source, ensure the following dependencies are installed:

    Rust (with cargo)
    wayland-protocols
    clang
    libxkbcommon
    wayland
    dbus
    libpipewire
    libpulse

Then, from the root of the repository, run:

cargo build --release

# To install it system-wide
sudo cp target/release/ashell /usr/local/bin/ashell⚙️ Configuration

All configuration options are stored in the config.toml file, located at:

~/.config/ashell

info

Ashell does not create this file automatically.

Ashell watches this file for changes and will apply updates immediately—so you can tweak the configuration while Ashell is running.

See more about the TOML format.
Command-line parameters

You can pass a configuration file to Ashell using the --config-path parameter:

ashell --config-path /path/to/config.toml

This allows you to use a different configuration file instead of the default one.

Ashell will still watch this file for changes and apply updates immediately.🚪 Main

This page contains the base configuration options for Ashell.

It allows you to configure things like the log level, the monitor(s) used to render the status bar, and the bar’s position.

All these configurations are defined in the root of the toml file.
Log Level

The log level controls the verbosity of logs.

You can set it to a general level like debug, info, warn, or error, or specify fine-grained control to enable logs from specific modules in the codebase, e.g., ashell::services::network=debug.

See more about log levels.
warning

This configuration requires restarting Ashell to take effect.
Log Examples

Set the global log level to debug for all modules:

log_level = "debug"

Set the log level for the ashell module only:

log_level = "ashell=debug"

Set the log level to warn for all modules, info for Ashell modules, and debug only for the network service:

log_level = "warn,ashell=info,ashell::services::network=debug"

To understand all possible module names you can use, check the source code.
The src folder is the root of the ashell module, and every directory or file under it declares a module or submodule.

For example, the file src/modules/media_player.rs maps to the module ashell::modules::media_player.
warning

Don’t confuse Ashell features (called “modules”) with Rust modules (defined with mod.rs or in files).
In this configuration, we're referring to Rust modules.
Outputs

You can configure which monitor(s) should display the status bar.

It can render on all monitors, only on the active one (the focused monitor when Ashell starts), or on a list of specified monitors.
Output Examples

Render the status bar on all monitors:

outputs = "All"

Render the status bar on the active monitor:

outputs = "Active"

Render the status bar on a specific list of monitors:

outputs = { Targets = ["DP-1", "eDP-1"] }

Position

You can set the position of the status bar to either Top or Bottom.
Position Examples

Set the bar position to the top:

position = "Top"

Set the bar position to the bottom:

position = "Bottom"

Close menu with esc

You can enable the use of the Esc key to close the menu.
warning

With these features enabled ashell will use the keyboard in an exclusive way when a menu is open.

That means other applications will not be able to use the keyboard when the menu is open.

enable_esc_key = true🧩 Modules

Ashell modules identify the various features of the status bar.

Each module provides a set of functionalities that can be enabled or disabled in the configuration file.
Organize modules

The status bar is divided into three main sections: left, center, and right.

Each section holds a list of modules or module groups, allowing flexible layout configuration.

Modules can be used on their own or organized into groups.
Default configuration

[modules]
left = [ "Workspaces" ]
center = [ "WindowTitle" ]
right = [ [ "Clock", "Privacy", "Settings" ] ]

Example

If we want to add the SystemInfo module to the right side of the status bar but not in the same group as the Clock, Privacy, and Settings modules, we can do it like this:

right = [ "SystemInfo", [ "Clock", "Privacy", "Settings" ] ]

Available modules

The following modules are available:
AppLauncher

Provides a way to launch applications from the status bar.
info

This module requires additional configuration to work properly. See the dedicated section in the documentation.
warning

This module will be deprecated in future releases.
Updates

Provides information about available updates for the system.
info

This module requires additional configuration to work properly. See the dedicated section in the documentation.
Clipboard

Launches a clipboard manager.
info

This module requires additional configuration to work properly. See the dedicated section in the documentation.
warning

This module will be deprecated in future releases.
Workspaces

Provides information about the current workspaces and allows switching between them.
WindowTitle

Displays the title of the currently focused window.
SystemInfo

Displays system information such as CPU usage, memory usage, and disk space.
KeyboardLayout

Displays the current keyboard layout and allows switching between layouts.
KeyboardSubmap

Displays the current keyboard submap.
Tray

Displays system tray icons and menus for applications.
Clock

Displays the current time and date.
Privacy

Provides privacy-related features, such as toggling microphone and camera access.
MediaPlayer

Displays media player controls and information about the currently playing media.
Settings
Provides access to system settings like audio, network, Bluetooth, battery, power profile, and idle inhibitor.App Launcher
warning

This module will be deprecated in future releases.

Provides a way to launch applications from the status bar.

To configure this module, you need to specify a command that will start your launcher when the module is clicked.
info

Without this configuration, the module will not appear in the status bar.
Example

In this example, I use Walker as my application launcher.

app_launcher_cmd = "walker"Clipboard
warning

This module will be deprecated in future releases.

Provides a way to open your clipboard manager from the status bar.

To configure this module, you need to specify a command that will start your clipboard manager when the module is clicked.
info

Without this configuration, the module will not appear in the status bar.
Example

In this example, I use cliphist as my clipboard manager.

clipboard_cmd = "cliphist-rofi-img | wl-copy"Updates

This module provides information about available updates for the system.

To configure this module, you need to specify a command that
will check for new system updates and a command that will launch the system updates.
info

Without this configuration, the module will not appear in the status bar.

The check command should return a list of updates,
one package per line in the following format:

package_name version_from -> version_to
Output Example

calf 0.90.7-1 -> 0.90.8-1
hyprutils 0.8.0-1 -> 0.8.1-1
lazygit 0.52.0-1 -> 0.53.0-1

Example

In this example, I am using an Arch Linux distribution, with paru as my AUR package manager and alacritty as a terminal emulator.

[updates]
check_cmd = "checkupdates; paru -Qua"
update_cmd = 'alacritty -e bash -c "paru; echo Done - Press enter to exit; read" &'Workspaces

This module provides information about the current workspaces
and allows switching between them.
Visibility Modes

You can configure how workspaces are displayed using the visibility_mode option.
All

This mode displays all workspaces across all monitors. Workspaces from different monitors are shown using different colors.
MonitorSpecific

This mode displays only the workspaces associated with the monitor where ashell is displayed. If ashell is not displayed on a specific monitor, the monitor where ashell is displayed will contain also the workspaces from the other monitor.
MonitorSpecificExclusive

This mode displays only the workspaces associated with the monitor where ashell is displayed. If ashell is not displayed on a specific monitor the workspaces for that monitor will not be shown.
Showing special workspaces

If you would like to make the special workspaces invisible, set the disable_special_workspaces to true. By default special workspaces will be visible.
Workspace Filling And Maximum Workspaces

You can also enable or disable filling the workspace
list with empty workspaces using the enable_workspace_filling option.
warning

enable_workspace_filling will not work if the visibility_mode is set to MonitorSpecificExclusive.

If you want a specific number of empty workspaces always displayed,
you can use the max_workspaces option. This setting only works
if enable_workspace_filling is set to true.

Usually, enable_workspace_filling will create empty workspaces
up to the greatest workspace in use.
For example, if you have a window open in workspace 1 and
another one in workspace 5, ashell will create empty
workspaces 2, 3, and 4 to fill the gap.

With max_workspaces set to 10, ashell will also create
workspaces 6, 7, 8, 9, and 10.

By default, max_workspaces is None, which disables this feature.
Custom Workspace Names

You can also assign custom names to your workspaces using the workspace_names option.
This lets you display alternative numerals (e.g., roman numerals, chinese numerals) instead of typical arabic numerals.
If a name is missing for a given workspace index, the numeric ID will be used as a fallback.
warning

Ashell comes with a set of default icons that are used internally.

If you decide to use a font icon in your workspace names configuration remember to install the font with that icon on your system.

For example you can use Nerd Fonts

[workspaces]
workspace_names = ["一","二","三","四","五","六","七","八","九","十",]

Virtual Desktop Plugin Support

If you are using the Hyprland plugin hyprland-virtual-desktops you probably want the workspaces to be grouped together instead of showing up individually. Use the configuration option enable_virtual_desktops to handle a virtual desktop as a single workspace. Custom workspace colors and names will be applied to the virtual desktop number instead of the workspace when this is enabled.

[workspaces]
enable_virtual_desktops = true

Default Configuration

The default configuration is:

[workspaces]
visibility_mode = "All"
enable_workspace_filling = true

Examples

If you want to disable workspace filling and set the visibility mode
to MonitorSpecific, you can do it like this:

[workspaces]
visibility_mode = "MonitorSpecific"
enable_workspace_filling = false

If you want to set the maximum number of workspaces to 10, you can do it like this:

[workspaces]
enable_workspace_filling = true
max_workspaces = 10Window Title

Displays the title of the currently focused window.

Using the mode field, you can configure what information to show:

    Title: the window title, which is the default
    Class: the window class

You can also configure the maximum title length, after which the title will be
truncated, using the truncate_title_after_length field.

The default value is 150 characters.
Example

[window_title]
mode = "Title"
truncate_title_after_length = 75System Info

This module provides information about the system such as:

    CPU usage
    Memory usage
    Disk space
    Network IP
    Network speed
    Temperature

It changes the indicator color based on the related value.
For example, if the CPU usage is above 80%, the indicator will be red.

By default, the module will display the CPU usage, memory usage, and temperature.
Indicators

Using the indicators configuration, you can select which indicators to display in the status bar.

These are the available indicators:
CPU

The CPU indicator displays the current CPU usage as a percentage.

To enable this indicator, add Cpu to the indicators configuration.
Memory

The Memory indicator displays the current memory usage as a percentage.

To enable this indicator, add Memory to the indicators configuration.
Memory Swap

The Memory Swap indicator displays the current memory swap usage as a percentage.

To enable this indicator, add MemorySwap to the indicators configuration.
Disk

The Disk indicator displays the disk space usage for a specific path.

To enable this indicator, add { Disk = "path" } to the indicators configuration, where path is the path to the disk you want to monitor.
Example

To monitor the home directory disk space, you can add the following to your configuration:

[system_info]
indicators = [ { Disk = "/home" } ]

IpAddress

The IpAddress indicator displays the current IP address of the system.

To enable this indicator, add IpAddress to the indicators configuration.
DownloadSpeed

The DownloadSpeed indicator displays the current download speed
of the system's network connection.

To enable this indicator, add DownloadSpeed to the indicators configuration.
UploadSpeed

The UploadSpeed indicator displays the current upload speed
of the system's network connection.

To enable this indicator, add UploadSpeed to the indicators configuration.
Temperature

The Temperature indicator displays the current temperature from the configured sensor.

To enable this indicator, add Temperature to the indicators configuration.

By default, the temperature sensor used is acpitz temp1 (ACPI thermal zone). You can configure which sensor to use with the sensor option in the [system_info.temperature] section.

To see available sensors on your system, you can check the output of sensors command or look at the component labels returned by the sysinfo library.

For NVMe SSDs, you'll need to find the model number first:

# Get NVMe model number
lsblk -d -o name,model
# Output example:
# NAME    MODEL
# nvme0n1 CT1000T705SSD3

Common sensor labels include:

    acpitz temp1 - ACPI thermal zone
    coretemp Package id 0 - Intel CPU temperature
    k10temp Tctl - AMD Ryzen CPU temperature
    amdgpu edge - AMD GPU temperature
    nvme Composite MODEL_NAME - NVMe SSD temperature (use model from lsblk output)

Warning and Alert Thresholds

You can also configure the warning and alert thresholds for the following indicators:

    CPU
    Memory (RAM and Swap use the same thresholds)
    Disk
    Temperature

To configure a threshold, you can add the following to your configuration:

[system_info.threshold_type]
warn_threshold = 60
alert_threshold = 80

Where threshold_type is the type of indicator you want to
configure and can be one of:

    cpu
    memory
    disk
    temperature

Default Configuration

[system_info]
indicators = [ "Cpu", "Memory", "Temperature" ]

[system_info.cpu]
warn_threshold = 60
alert_threshold = 80

[system_info.memory]
warn_threshold = 70
alert_threshold = 85

[system_info.disk]
warn_threshold = 80
alert_threshold = 90

[system_info.temperature]
warn_threshold = 60
alert_threshold = 80
sensor = "acpitz temp1"eyboard

There are two keyboard modules available in the status bar.
Keyboard Layout

The Keyboard Layout module displays the current keyboard layout and allows switching between layouts by clicking on the module.

You can add an optional configuration to map a keyboard layout label to another label using the labels configuration.
warning

Ashell comes with a set of default icons that are used internally.

If you decide to use a font icon in your keyboard layout configuration remember to install the font with that icon on your system.

For example you can use Nerd Fonts
Example

In this example we're mapping the "English (US)" layout to the 🇺🇸 flag and the "Italian" layout to the 🇮🇹 flag.

[keyboard_layout.labels]
"English (US)" = "🇺🇸"
"Italian" = "🇮🇹"

Keyboard Submap
This module displays the current keyboard submap in use. You can find more information about submap in the Hyprland documentation.Tray

This module provides a system tray for displaying icons of running applications.

Clicking on an icon will open the corresponding application or menu.

There are no additional configuration options available for this module.Clock

This module displays the current time and date in the status bar.

Using the format configuration, you can customize how the time and date are displayed.

For more information about the available format options, see the chrono documentation.

By default, the clock displays the time using this format: %a %d %b %R,
which prints the date as Tue 08 Jul 11:04.
Example

This configuration shows the date in the format: 07/22/25 11:11:43 AM

[clock]
format = "%D %r"Privacy

This module provides a way to show if the microphone,
the webcam or the screen-sharing is currently in use.

There are no additional configurations available for this module.
Media Player

This module displays the current media playback status in the status bar.

You can configure the max media title length after which the title will be truncated using the max_title_length field.

The default value is 100 characters.
Example

[media_player]
max_title_length = 50This module provides access to system settings like audio, network, bluetooth,
battery, power profile and idle inhibitor.

It displays in the status bar indicators about:

    Audio volume
    Network status
    Bluetooth connection status
    Battery status
    Power profile
    Idle inhibitor status
    VPN connection status

And let you interact with these settings:

    Change audio and microphone volume
    Change audio output and input devices
    Toggle network connection
    Toggle VPN connection
    Toggle airplane mode
    Change brightness
    Toggle bluetooth
    Change power profile
    Toggle idle inhibitor
    Lock the screen
    Suspend, hibernate, logout, reboot, or shutdown the system

You can configure some function of this module.

With the lock_cmd option you can set a command to lock
the system, if not set the related button will not appear.

With the shutdown_cmd, suspend_cmd, hibernate_cmd, reboot_cmd, and logout_cmd, you can change the related commands to shut down, suspend, hibernate, reboot, or log out of the system.
These parameters are optional and have the following default values:

shutdown_cmd = "shutdown now"
suspend_cmd = "systemctl suspend"
hibernate_cmd = "systemctl hibernate"
reboot_cmd = "systemctl reboot"
logout_cmd = "loginctl kill-user $(whoami)"

With the audio_sinks_more_cmd and audio_sources_more_cmd
options you can set commands to open the audio settings
for sinks and sources, if not set the related buttons will not appear.

With the wifi_more_cmd, vpn_more_cmd and bluetooth_more_cmd options
you can set commands to open the network, VPN and bluetooth settings.

With the remove_airplane_btn option you can remove the airplane mode button.

With the remove_idle_btn option you can remove the idle inhibitor button.

With the battery_format option you can customize the battery indicator format.

The possible values are:

    Icon - Show only the battery icon
    Percentage - Show only the battery percentage
    IconAndPercentage - Show both the battery icon and percentage (default)

In the same way it's possible to customize the peripheral battery indicator format. The possible values are the same as above, but you need to use the peripheral_battery_format option. The default value is Icon.

With the peripheral_indicators you can decide which peripheral battery indicators are shown in the status bar.

The possible values are:

    All - Show all peripheral battery indicators (default)
    Specific - Show only the peripheral battery indicators in the specified categories. The possible categories are:
        Keyboard
        Mouse
        Headphones
        Gamepad

[settings]
battery_format = "IconAndPercentage"
peripheral_battery_format = "Icon"
peripheral_indicators = { Specific = ["Gamepad", "Keyboard"] }

Status Bar Indicators

With the indicators option you can customize which status indicators are displayed in the status bar and in what order they appear.

Available indicators are:

    IdleInhibitor - Shows an icon when idle inhibitor is active
    PowerProfile - Shows the current power profile icon
    Audio - Shows the audio volume level icon
    Network - Shows the network connection status icon
    Vpn - Shows the VPN connection status icon
    Bluetooth - Shows a Bluetooth icon when connected to at least one device
    Battery - Shows the battery level and charging status
    PeripheralBattery - Shows the peripheral battery status

[settings]
# Customize which indicators to show and their order
indicators = ["Battery", "Bluetooth", "Network", "Audio"]

# The default value is the following, the items are shown in this order:
indicators = ["IdleInhibitor", "PowerProfile", "Audio", "Bluetooth", "Network", "Vpn", "Battery"]

Custom Buttons

You can add custom buttons to the settings panel using the CustomButton configuration. These buttons can execute commands when clicked.
Button Behavior

    If status_command is provided, the button acts as a toggle with visual state tracking
    If status_command is not provided, the button acts as a launcher (simple command execution)

Configuration
Field	Required	Description
name	Yes	Display name of the button
icon	Yes	Icon to display (Unicode emoji or Nerd Font symbol)
command	Yes	Shell command to execute when button is clicked
status_command	No	Command to check if toggle is active (exit code 0 = active)
tooltip	No	Tooltip text shown on hover
Icon Support

The icon field accepts:

    Unicode emoji: ⌨️, 🖥️, 📁, 🌐, etc.
    Nerd Font symbols: 󰌓, , , etc. (requires Nerd Font installed)

Both are rendered using the Symbols Nerd Font and will display correctly in the UI.
Command Execution

Both command and status_command are executed through bash shell (bash -c), which means you can use:

    Shell features: pipes (|), redirects (>), logical operators (&&, ||)
    Environment variables: $HOME, $USER, etc.
    Globs: *.txt, ~/Documents/*

Security Note

Commands are executed with your user privileges. Be careful with commands from untrusted sources, as they have full shell access.
Status Command Timeout

Each status_command has a 1 second timeout. If the command doesn't complete within this time:

    The button state will be shown as "unknown" (grayed out)
    The process will be killed automatically
    An error will be logged for debugging

# Toggle button example (with status_command)
[[settings.CustomButton]]
name = "Virtual Keyboard"
icon = "⌨️"
command = "/path/to/toggle-keyboard.sh"
status_command = "/path/to/check-keyboard-status.sh"
tooltip = "Toggle On-Screen Keyboard"

# Launcher button example (without status_command)
[[settings.CustomButton]]
name = "Terminal"
icon = ""
command = "alacritty"
tooltip = "Open Terminal"

Example

In the following example we use:

    hyprlock to lock the screen
    pavucontrol to open the audio settings for sinks and sources
    directly in the correct tab.
    nm-connection-editor to open the wifi and VPN settings
    blueman-manager to open the bluetooth settings

We also disable the airplane mode button and the idle inhibitor button.

[settings]
lock_cmd = "hyprlock &"
audio_sinks_more_cmd = "pavucontrol -t 3"
audio_sources_more_cmd = "pavucontrol -t 4"
wifi_more_cmd = "nm-connection-editor"
vpn_more_cmd = "nm-connection-editor"
bluetooth_more_cmd = "blueman-manager"
remove_airplane_btn = true
remove_idle_btn = true
indicators = ["Battery", "Bluetooth", "Network", "Audio"]

[[settings.CustomButton]]
name = "Virtual Keyboard"
icon = "⌨️"
command = "toggle-onscreen-keyboard.sh"
status_command = "pgrep -x onboard"
tooltip = "Toggle On-Screen Keyboard"

[[settings.CustomButton]]
name = "File Manager"
icon = ""
command = "nautilus"
tooltip = "Open Files"Custom Modules

This special module type lets you extend the functionality of Ashell by creating your own simple components.

A custom module allows you to:

    Display the output of a command (live).
    Run a command when the module is clicked.
    Change icons dynamically based on output.
    Show an alert indicator based on specific conditions.

warning

Ashell comes with a set of default icons that are used internally.

If you specify a font icon in the custom module configuration remember to install the font with that icon on your system.

For example you can use Nerd Fonts
Configuration

To define a custom module, use the following fields:

    name: Name of the module. Use this to refer to it in the modules definitions.
    icon: Icon displayed in the status bar.
    command: Command to execute when the module is clicked.
    listen_cmd (optional): Command to run in the background to update the module’s display.
    icons (optional): Regex-to-icon mapping to change the icon based on the listen_cmd output.
    alert (optional): Regex to trigger a red alert dot on the icon when matched in the listen_cmd output.

listen_cmd

The listen_cmd should output JSON in the Waybar format, using text and alt fields.
Example Output

{
  "text": "3",
  "alt": "notification"
}

Dynamic Icons

You can change the icon depending on the value of alt in the listen_cmd output.
Icons Example

icons.'dnd.*' = ""

This will change the icon to  when alt matches dnd.*.
Alerts

Use the alert field to show a red dot on the module icon if the output matches a given regex.
Alerts Example

alert = ".*notification"

Examples
Notifications (with swaync-client)

[[CustomModule]]
name = "CustomNotifications"
icon = ""
command = "swaync-client -t -sw"
listen_cmd = "swaync-client -swb"
icons.'dnd.*' = ""
alert = ".*notification"

App Launcher (with walker)

[[CustomModule]]
name = "AppLauncher"
icon = "󱗼"
command = "walker"🎨 Appearance

With these configurations, you can change the appearance of ashell.

It's possible to modify the color palette and other general visual aspects.

All of these configurations should be placed in the appearance section
of the configuration file.

You can customize things like:

    The color palette
    The font used
    The scaling factor of the status bar
    The style of the status bar
    The opacity of the status bar components
    The opacity of the status bar menus
General

These are all the appearance options not related to the color palette.
Font

You can change the font used by setting the font_name field. This configuration is optional—if not set, the iced library will use the default font.

[appearance]
font_name = "Comic Sans MS"

warning

Changing the font requires to kill and restart ashell process. The font configuration does not support hot-reloading
Scaling Factor

You can change the scaling factor of the status bar using the scale_factor field.

The value should be a float greater than 0.0 and less than or equal to 2.0. The default value is 1.0.

[appearance]
scale_factor = 1.5

Status Bar Style

You can change the style of the status bar using the style field.

You can choose between:

    Island: This is the default style. Each module or module group is displayed in a rounded rectangle using the background color.
    Solid: The status bar has a solid background color.
    Gradient: The status bar has a gradient background color.

Example

[appearance]
style = "Gradient"

Opacity

You can change the opacity of the status bar components using the opacity field.

The value should be a float between 0.0 and 1.0, where 0.0 is fully transparent. The default value is 1.0.

It's also possible to define the opacity of status bar menus and whether they should include a backdrop effect.
Examples

Setting the opacity of the status bar components:

[appearance]
opacity = 0.8

Also setting the opacity of the status bar menus and adding a backdrop effect:

[appearance]
opacity = 0.8

[appearance.menu]
opacity = 0.7
backdrop = 0.3Palette

With these configuration options, you can customize
the color palette of your status bar.

Each color can be a simple hex color like #228800 or an
object that defines:

    A base hex color
    Two optional variants of that color (a strong one and a weak one)
    An optional text color to use with that base color

If the strong and weak variants are not provided, they will be auto-generated.
If no text color is provided, the default text color will be used.
Example

[appearance.background_color]
base = "#448877"
strong = "#448888"
weak = "#448855"
text = "#ffffff"

Palette Colors

The following are the colors that make up the palette:

    background_color: Used as the background color for all status bar components
    primary_color: Used for elements like buttons or slider handles
    secondary_color: Used for borders and slider tracks
    success_color: Used for success indicators
    danger_color: Used for danger messages or danger states
    (the weak version is used for warning states)
    text_color: Used as the default text color

Workspace Colors

The following colors are used for the workspaces module.

You can specify which color to use for workspace indicators based on
the monitor to which a workspace is attached.

For example, if workspace 1 is attached to monitorA, the first color will be used; if workspace 2 is attached to monitorB, the second color will be used, and so on.

Use the workspace_colors field for regular workspaces, and
special_workspace_colors for special workspaces.

If special_workspace_colors is not defined, workspace_colors will be used.
If neither workspace_colors is defined nor a color exists for a given monitor, the primary_color will be used.Theme
Catppuccin Mocha

[appearance]

success_color = "#a6e3a1"
text_color = "#cdd6f4"

workspace_colors = [ "#fab387", "#b4befe", "#cba6f7" ]

[appearance.primary_color]
base = "#fab387"
text = "#1e1e2e"

[appearance.danger_color]
base = "#f38ba8"
weak = "#f9e2af"

[appearance.background_color]
base = "#1e1e2e"
weak = "#313244"
strong = "#45475a"

[appearance.secondary_color]
base = "#11111b"
strong = "#1b1b25"

Tokyo Night - night

[appearance]

primary_color = "#7aa2f7"
success_color = "#9ece6a"
text_color = "#a9b1d6"

workspace_colors = [ "#7aa2f7", "#9ece6a" ]

[appearance.danger_color]
base = "#f7768e"
weak = "#e0af68"

[appearance.background_color]
base = "#1a1b26"
weak = "#24273a"
strong = "#414868"

[appearance.secondary_color]
base = "#0c0d14"
