# Aliases

# override vi/vim with nvim
alias vi="nvim"
alias vim="nvim"

# simple
alias ..="cd .."
alias lsa="ls -a"
alias mkdir="mkdir -p"

# shortenings
alias a="atom ."
alias g="git"
alias t="tmux"
alias h="history"
alias pa="php artisan"
alias ns="npm start"
alias ms="make start"
alias cdumrs="composer dump-autoload && php artisan migrate:refresh --seed"

# edit certain files
alias e_v="vim ~/.config/nvim/init.vim" # vimrc
alias e_z="vim ~/.zshrc" # zshrc

# start simple python web server in cwd on port 7777
alias serve="python3 -m http.server 7777"
# ...or on another port
alias serveon="python3 -m http.server"

# sublime text
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# npm execute local bin
alias npm-exec='PATH=$(npm bin):$PATH'

# drone secrets generate
alias dronesec="drone -t \$(echo \$DRONE_TOKEN) -s \$(echo \$DRONE_SERVER) secure --in secrets.yml --repo "
