# Aliases

alias g="git"
alias vi="nvim"
alias vim="nvim"
alias t="tmux"
alias h="history"
alias lsl="ls -a"
alias mkdir="mkdir -p"
alias ..="cd .."
alias pa="php artisan"
alias cdumrs="composer dump-autoload && php artisan migrate:refresh --seed"

# Start simple python web server in cwd on port 7777
alias serve="python3 -m http.server 7777"
# or on another port
alias serveon="python3 -m http.server"

# mkdir && cd
mcd()
{
    if [ ${1} ]
    then
    mkdir ${1}
    cd ${1}
    fi
}

