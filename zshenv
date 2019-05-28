# .zshenv
# Sourced at start of every shell (before .zshrc and .zprofile) and script

# Source os detection (primitive)
# ($IS_DARWIN, $IS_LINUX)
source ~/scripts/zsh/detect-os.sh

# Source PATH
if [[ "$IS_DARWIN" == "1" ]]
then
    source ~/scripts/zsh/path-darwin.sh
else
    source ~/scripts/zsh/path-linux.sh
fi

# Go
export GOPATH=$HOME/Program/go

# Default applications
export VISUAL=nvim
export EDITOR=$VISUAL
export PAGER=less
export TERMINAL=termite
export TERMCMD=termite
export BROWSER=google-chrome-stable

# XDG Config Home
export XDG_CONFIG_HOME=$HOME/.config

# Path to the oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh
