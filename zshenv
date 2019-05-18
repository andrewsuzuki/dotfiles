# .zshenv
# Sourced at start of every shell (before .zshrc and .zprofile) and script

# Set $IS_DARWIN, $IS_LINUX, $PATH, $VISUAL, $EDITOR, $PAGER, $ZSH

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

# swiftenv (prepends to $PATH)
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi

# Use emacs as preferred text editor
export VISUAL=nvim
export EDITOR=$VISUAL
export PAGER=less
export TERMINAL=termite
export BROWSER=google-chrome-stable

# Path to the oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh
