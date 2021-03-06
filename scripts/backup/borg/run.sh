#!/bin/sh

# Backup with Borg
# https://borgbackup.readthedocs.io/en/stable/quickstart.html#automating-backups

# Setting this, so the repo does not need to be given on the commandline:
export BORG_REPO=/run/media/andrew/AbsBackup

# some helpers and error handling:
info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM

info "Starting backup"

# Backup the most important directories into an archive named after
# the machine this script is currently running on:

borg create                         \
    --verbose                       \
    --filter AME                    \
    --list                          \
    --stats                         \
    --show-rc                       \
    --compression lz4               \
    --exclude-caches                \
    --exclude '/home/*/.cache/*'    \
    --exclude '/var/cache/*'        \
    --exclude '/var/tmp/*'          \
    --exclude '/var/lib/pacman/*' \
    --exclude '/home/andrew/.config/google-chrome/*' \
    --exclude '/home/andrew/.config/Code - OSS/*' \
    --exclude '/home/andrew/.vscode-oss/*' \
    --exclude '/home/andrew/.mozilla/firefox/*' \
    --exclude '/home/andrew/.cargo/*' \
    --exclude '/home/andrew/.npm/*' \
    --exclude '/home/andrew/.node-gyp/*' \
    --exclude '/home/andrew/.m2/*' \
    --exclude '/home/andrew/Program/go/*' \
    --exclude '/home/andrew/.oh-my-zsh/*' \
    --exclude '/home/andrew/Torrent/*' \
    --exclude '/home/andrew/.local/share/Trash/*' \
    --exclude '/home/andrew/.local/share/xorg/*' \
    --exclude '/home/andrew/.z' \
    --exclude '/home/andrew/.zsh_history' \
    --exclude '/home/andrew/.thumbnails/*' \
                                    \
    ::'{hostname}-{now}'            \
    /etc                            \
    /home                           \
    /root                           \
    /var                            \

backup_exit=$?

info "Pruning repository"

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machines' archives also:

borg prune                          \
    --list                          \
    --prefix '{hostname}-'          \
    --show-rc                       \
    --keep-daily    7               \
    --keep-weekly   4               \
    --keep-monthly  6               \

prune_exit=$?

# use highest exit code as global exit code
global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))

if [ ${global_exit} -eq 0 ]; then
    info "Backup and Prune finished successfully"
elif [ ${global_exit} -eq 1 ]; then
    info "Backup and/or Prune finished with warnings"
else
    info "Backup and/or Prune finished with errors"
fi

exit ${global_exit}
