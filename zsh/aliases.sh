# Aliases

# override vi/vim with nvim
alias vi="nvim"
alias vim="nvim"

# simple
alias ..="cd .."
alias lsl="ls -a"
alias mkdir="mkdir -p"

# shortenings
alias g="git"
alias t="tmux"
alias h="history"
alias pa="php artisan"
alias cdumrs="composer dump-autoload && php artisan migrate:refresh --seed"

# edit certain files
alias e_v="vim ~/.config/nvim/init.vim"
alias e_z="vim ~/.zshrc"

# start simple python web server in cwd on port 7777
alias serve="python3 -m http.server 7777"
# ...or on another port
alias serveon="python3 -m http.server"

# mkdir, then cd
mcd()
{
    if [ ${1} ]
    then
    mkdir ${1}
    cd ${1}
    fi
}

