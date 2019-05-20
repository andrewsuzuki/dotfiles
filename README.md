# andrewsuzuki/dotfiles

These are my dotfiles for Arch Linux.

## Applications

* `rcm` (to manage these dotfiles)
* `xorg` (started in .zprofile)
* `i3` (started in .xinitrc)
* `termite` (used by i3 and some scripts)
* `neovim` ($EDITOR)
* `xcwd` (in scripts/misc/term-samedir.sh)
* `xbindkeys` (used in .xinitrc)
* `udiskie` (started in .xinitrc)
* `autorandr` (triggered in udev rule, see scripts/misc/monitor-hotplug.sh)
* `gnome-keyring` (started in .xinitrc)
* `qt5ct` (set up as QT_QPA_PLATFORMTHEME in .xinitrc)
* `rofi` (launched by i3 on hotkey)
* `polybar` (launched by i3)
* `pactl` (for various media scripts/bound keys)
* `playerctl` (for various media scripts/bound keys)
* `z` (installed in /usr/share/z/z.sh, loaded in .zshrc)
* `oh-my-zsh` (installed in ~/.oh-my-zsh, loaded in .zshrc)
* `i3lock` (started in scripts/misc/i3lock.sh from systemd service)
* `borg` (for backups, see scripts/backups/borg/run.sh)
* `dunst` (auto-started)

## Installation

1. `touch ~/.secrets.sh`
2. `rcup`
