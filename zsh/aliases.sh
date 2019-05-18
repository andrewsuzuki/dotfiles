# Aliases

# simple
alias ..="cd .."
alias lsa="ls -a"
alias mkdir="mkdir -p"

# rewrites
alias vim="nvim"

# shortenings
alias g="git"
alias t="tmux"
alias h="history"
alias pa="php artisan"
alias ns="npm start"
alias ms="make start"

# network manager
alias nr="nmcli device wifi rescan"
alias nl="nmcli device wifi list"
alias nc="nmcli device wifi connect"

# edit certain files
alias e_i3="vim ~/.config/i3/config"
alias e_pb="vim ~/.config/polybar/config"
alias e_z="vim ~/.zshrc" # zshrc

# start simple python web server in cwd on port 7777
alias serve="python3 -m http.server 7777"
# ...or on another port
alias serveon="python3 -m http.server"

# npm execute local bin
alias npm-exec='PATH=$(npm bin):$PATH'

# drone secrets generate
alias dronesec="drone -t \$(echo \$DRONE_TOKEN) -s \$(echo \$DRONE_SERVER) secure --in secrets.yml --repo "
