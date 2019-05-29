#!/bin/sh

# Called from /etc/systemd/system/i3lock.service
# Taken from https://hund0b1.gitlab.io/2019/01/08/using-i3lock-with-systemd-suspend.html

# Run i3lock
i3lock --show-failed-attempts --color=A5978B
