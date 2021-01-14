#!/bin/sh

wmctrl -i -R $(wmctrl -lx | fzf --color=light | cut -d\  -f1)
