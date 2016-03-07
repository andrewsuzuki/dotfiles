# Source os detection (primitive)
source ~/.dotfiles/zsh/detect-os.sh

# Source misc functions
source ~/.dotfiles/zsh/functions.sh

# Source aliases
source ~/.dotfiles/zsh/aliases.sh

# Source z
source ~/Program/z-master/z.sh

# Source PATH
if [[ "$IS_DARWIN" == "1" ]]
then
    source ~/.dotfiles/zsh/path-darwin.sh
else
    source ~/.dotfiles/zsh/path-linux.sh
fi

# Use neovim as preferred text editor
export VISUAL=nvim
export EDITOR=$VISUAL

# Path to the oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Name of the theme to load (~/.oh-my-zsh/themes)
# (or use "random" for a random theme
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
ENABLE_CORRECTION="false"

# Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="false"

# Don't disable marking untracked files under VCS as dirty. Marking this true
# makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="false"

# Change the command execution time stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# oh-my-zsh custom folder
ZSH_CUSTOM=$ZSH/custom # (default)

# Space-separated plugins to load (from ~/.oh-my-zsh/plugins)
plugins=(git zsh-autosuggestions)

# XDG_CONFIG_HOME for whatever needs it (like Neovim)
export XDG_CONFIG_HOME=$HOME/.config

# Neovim
export NVIM_TUI_ENABLE_TRUE_COLOR=1 # enable true 24-bit color

# Set GOPATH on Darwin
if [[ "$IS_DARWIN" == "1" ]]
then
    export GOPATH=$HOME/program/go
fi

# export MANPATH="/usr/local/man:$MANPATH"

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
