# dotfiles

These are my dotfiles for Linux and macOS.

## Setup

Just run `./link`. It will create a number of symlinks in your home directory.

## Organization and other Notes

Dotfiles for programs that look for configuration in `~/.config` (git, i3, neovim, etc.) can be found in `config`. I'm not using vim at the moment, so it may be outdated.

Emacs configuration can be found in `emacs.d` (symlinked to `~/.emacs.d`).

Tmux configuration can be found in `tmux`. I'm not using tmux at the moment, so it may be outdated.

Zsh configuration can be found in `tmux`.

There are a few other files in the root here that are symlinked directly in `~` (gitconfig, xinitrc, etc).
