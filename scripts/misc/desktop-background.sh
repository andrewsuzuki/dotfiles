#!/bin/sh

# Set desktop background

# Default to a color...
#xsetroot -solid '#008080' # (teal)
#xsetroot -solid '#302f4d' # (dark purple)
#xsetroot -solid '#120d32' # (navy)
xsetroot -solid '#e7ad99' # (salmon)

# Set image using feh, if it is specified (in ~/.wallpaper)
dotwallpaper=$HOME/.wallpaper
if [ -f $dotwallpaper ]; then
	wallpaperimage=$(cat $dotwallpaper)
	wallpaperimage="${wallpaperimage//\~/$HOME}"
	# background image
	[ -f "$wallpaperimage" ] && feh --bg-fill $wallpaperimage
fi
