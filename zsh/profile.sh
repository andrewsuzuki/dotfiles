# Set $IS_DARWIN, $IS_LINUX, $PATH, $VISUAL, $EDITOR, $PAGER, $ZSH

# Source os detection (primitive)
# ($IS_DARWIN, $IS_LINUX)
source ~/.dotfiles/zsh/detect-os.sh

# Source PATH
if [[ "$IS_DARWIN" == "1" ]]
then
    source ~/.dotfiles/zsh/path-darwin.sh
else
    source ~/.dotfiles/zsh/path-linux.sh
fi

# swiftenv (prepends to $PATH)
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi

# Use emacs as preferred text editor
export VISUAL=emacs
export EDITOR=$VISUAL
export PAGER=less

# Path to the oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh
