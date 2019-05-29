# Aliases

# simple
alias ..="cd .."
alias lsa="ls -a"
alias mkdir="mkdir -p"

# rewrites
alias vim="nvim"

# shortenings
alias g="git"
alias p="python3"
alias h="history"
alias pa="php artisan"
alias ns="npm start"

# network manager
alias nr="nmcli device wifi rescan"
alias nl="nmcli device wifi list"
alias nc="nmcli device wifi connect"

# edit certain files
alias e_i3="vim ~/.config/i3/config"
alias e_pb="vim ~/.config/polybar/config"
alias e_z="vim ~/.zshrc"
alias e_v="vim ~/.config/nvim/init.vim"
alias e_sx="vim ~/.config/sxhkd/sxhkdrc"

# scripts
alias backup="~/scripts/backup/borg/run.sh"

# start simple python web server in cwd on port 7777
alias serve="python3 -m http.server 7777"
# ...or on another port
alias serveon="python3 -m http.server"

# npm execute local bin
alias npm-exec='PATH=$(npm bin):$PATH'
