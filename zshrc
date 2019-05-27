# Source secrets file
if [ -f ~/.secrets.sh ]; then
    source ~/.secrets.sh
else
    print "~/.secrets.sh not found"
fi

# Source my functions
source ~/scripts/zsh/functions.sh

# Source my aliases
source ~/scripts/zsh/aliases.sh

# Source z, if installed
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# oh-my-zsh config
# ----------------

# Name of the theme to load (~/.oh-my-zsh/themes)
# (or use "random" for a random theme
ZSH_THEME="lambda-gitster"
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
plugins=(
	git
	vi-mode
)
# vi-mode indicator
# MODE_INDICATOR="NORMAL"
# MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# User configuration
# ------------------

# oh-my-zsh vi-mode indicator
MODE_INDICATOR="%{$fg_bold[red]%} [% NORMAL]% %{$reset_color%}"

# Neovim
export NVIM_TUI_ENABLE_TRUE_COLOR=1 # enable true 24-bit color

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Key timeout in tenths of seconds
# (esp. for ESC to normal mode in zsh vi mode)
export KEYTIMEOUT=1
