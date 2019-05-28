#!/bin/sh

userresources=$HOME/.Xresources
userxkbmap=$HOME/.Xkeymap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f "$userxkbmap" ]; then
    xkbcomp "$userxkbmap" $DISPLAY
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# gnome-keyring
# https://wiki.archlinux.org/index.php/GNOME/Keyring#xinitrc_method
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Set DPI
xrandr --dpi 220

# sxhkd (Simple X Hotkey Daemon)
sxhkd -t 1 &

# udiskie (drive auto-mount)
udiskie &

# autorandr (xrandr)
scripts/keys/autorandr-conditional-load.sh

# Desktop background
scripts/misc/desktop-background.sh

# qt (use qt5ct config tool)
export QT_QPA_PLATFORMTHEME="qt5ct"

# start i3
exec i3
