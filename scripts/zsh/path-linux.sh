# Add to $PATH on Linux

# Composer
PATH=$HOME/.config/composer/vendor/bin:$PATH

# Yarn
PATH=$HOME/.yarn/bin:$PATH

# Local NPM (https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md#install-npm-packages-globally-without-sudo-on-macos-and-linux)
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$PATH:$NPM_PACKAGES/bin"
MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# Go binaries
PATH=$HOME/Program/go/bin:$PATH

# My scripts (mostly linked elsewhere)
PATH=$HOME/scripts/bin:$PATH

# ------
# Export
# ------

export PATH
export MANPATH
