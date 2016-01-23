# Source aliases
source ~/.aliases

# Use neovim as preferred text editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Path to your oh-my-zsh installation.
export ZSH=/Users/andrew/.oh-my-zsh

# Name of the theme to load (~/.oh-my-zsh/themes), or "random" for a random theme
ZSH_THEME="fino"

# Use case-insensitive auto-completion
CASE_SENSITIVE="false"

# Correct mistakes between _ and -
HYPHEN_INSENSITIVE="true"

# Don't disable bi-weekly update checks
DISABLE_AUTO_UPDATE="false"

# How often to auto-update (in days)
export UPDATE_ZSH_DAYS=13

# Enable colors in ls.
DISABLE_LS_COLORS="false"

# Enable auto-setting terminal title.
DISABLE_AUTO_TITLE="false"

# Enable command auto-correction
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# Don't disable marking untracked files under VCS as dirty. Marking this true
# makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="false"

# Change the command execution time stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# oh-my-zsh custom folder
ZSH_CUSTOM=$ZSH/custom # (default)

# Space-separated plugins to load (from ~/.oh-my-zsh/plugins)
plugins=(git)

# XDG_CONFIG_HOME for whatever needs it (like Neovim)
export XDG_CONFIG_HOME=$HOME/.config

# Neovim
export NVIM_TUI_ENABLE_TRUE_COLOR=1 # enable true 24-bit color

# TODO create separate file for path export

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

# Git
export PATH=/usr/local/git/bin:$PATH

# Composer/Homestead
export PATH="$PATH:$HOME/.composer/vendor/bin"

# PHP 5.6 from http://php-osx.liip.ch/
export PATH=/usr/local/php5/bin:$PATH

# Go
export PATH=/usr/local/go/bin:$PATH
export GOPATH=$HOME/program/go

# Maven
export PATH="$PATH:/usr/local/apache-maven-3.3.3/bin"

# Leiningen
export PATH="$PATH:/Applications/clojure"

# LaTeX
export PATH="$PATH:/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin"

# Scsynth (Supercollider)
export PATH="$PATH:/Applications/SuperCollider/SuperCollider.app/Contents/Resources"

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
