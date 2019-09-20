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
alias hr="history | rg --smart-case"
alias pa="php artisan"
alias ns="npm start"
alias d="docker"
alias dc="docker-compose"

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
alias rx="~/scripts/misc/reload-xkb-config.sh"

# start simple python web server in cwd on port 7777
alias serve="python3 -m http.server 7777"
# ...or on another port
alias serveon="python3 -m http.server"

# npm execute local bin
alias npm-exec='PATH=$(npm bin):$PATH'

# weather (go get https://github.com/genuinetools/weather)
alias wth="weather -d 7 | less"
